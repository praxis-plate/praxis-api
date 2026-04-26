import 'dart:math';

import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_progress_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_answer_attempt_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AdaptiveLearningPathService {
  static const double _remedialThreshold = 0.45;
  static const double _acceleratedThreshold = 0.85;

  final CourseDataSource _courseDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonDataSource _lessonDataSource;
  final TaskDataSource _taskDataSource;
  final LessonProgressDataSource _lessonProgressDataSource;
  final TaskAnswerAttemptDataSource _taskAnswerAttemptDataSource;

  const AdaptiveLearningPathService({
    required CourseDataSource courseDataSource,
    required ModuleDataSource moduleDataSource,
    required LessonDataSource lessonDataSource,
    required TaskDataSource taskDataSource,
    required LessonProgressDataSource lessonProgressDataSource,
    required TaskAnswerAttemptDataSource taskAnswerAttemptDataSource,
  }) : _courseDataSource = courseDataSource,
       _moduleDataSource = moduleDataSource,
       _lessonDataSource = lessonDataSource,
       _taskDataSource = taskDataSource,
       _lessonProgressDataSource = lessonProgressDataSource,
       _taskAnswerAttemptDataSource = taskAnswerAttemptDataSource;

  Future<AdaptiveLearningPathDto> getPath(
    Session session, {
    required UuidValue authUserId,
    required int courseId,
  }) async {
    final course = await _courseDataSource.findPublishedById(session, courseId);
    if (course == null) {
      throw NotFoundException(message: 'Course not found');
    }

    final modules = await _moduleDataSource.listByCourseId(session, courseId);
    final lessons = <Lesson>[];
    for (final module in modules) {
      final moduleLessons = await _lessonDataSource.listByModuleId(
        session,
        module.id!,
      );
      lessons.addAll(moduleLessons);
    }
    lessons.sort((left, right) => left.orderIndex.compareTo(right.orderIndex));

    if (lessons.isEmpty) {
      return AdaptiveLearningPathDto(
        courseId: courseId,
        pathType: AdaptiveLearningPathType.completed,
        recommendedLessonId: null,
        recommendedLessonTitle: null,
        supportingLessonId: null,
        supportingLessonTitle: null,
        focusTopic: null,
        overallMasteryScore: 0,
        reason: 'Course does not contain lessons yet.',
        topicMasteries: const [],
      );
    }

    final lessonIds = lessons.map((lesson) => lesson.id!).toList();
    final tasks = await _taskDataSource.listByLessonIds(session, lessonIds);
    final taskIds = tasks.map((task) => task.id!).toList();
    final progresses = await _lessonProgressDataSource
        .listByAuthUserIdAndLessonIds(
          session,
          authUserId,
          lessonIds,
        );
    final attempts = await _taskAnswerAttemptDataSource
        .listByAuthUserIdAndTaskIds(
          session,
          authUserId,
          taskIds,
        );

    final completedLessonIds = progresses
        .where((progress) => progress.isCompleted)
        .map((progress) => progress.lessonId)
        .toSet();
    final tasksByLessonId = <int, List<Task>>{};
    for (final task in tasks) {
      tasksByLessonId.putIfAbsent(task.lessonId, () => []).add(task);
    }

    final topicStats = <String, _TopicStats>{};
    final taskById = <int, Task>{for (final task in tasks) task.id!: task};

    for (final lesson in lessons) {
      final lessonTopics = (tasksByLessonId[lesson.id!] ?? const <Task>[])
          .map((task) => task.topic.trim())
          .where((topic) => topic.isNotEmpty)
          .toSet();
      for (final topic in lessonTopics) {
        final stats = topicStats.putIfAbsent(topic, () => _TopicStats(topic));
        stats.totalTopicLessons++;
        if (completedLessonIds.contains(lesson.id)) {
          stats.completedLessons++;
        }
      }
    }

    for (final attempt in attempts) {
      final task = taskById[attempt.taskId];
      if (task == null) {
        continue;
      }

      final topic = task.topic.trim();
      if (topic.isEmpty) {
        continue;
      }

      final stats = topicStats.putIfAbsent(topic, () => _TopicStats(topic));
      stats.totalAttempts++;
      if (attempt.isCorrect) {
        stats.correctAnswers++;
      }
    }

    final topicMasteries =
        topicStats.values.map((stats) => stats.toDto()).toList()..sort((
          left,
          right,
        ) {
          final scoreCompare = left.masteryScore.compareTo(right.masteryScore);
          if (scoreCompare != 0) {
            return scoreCompare;
          }
          return left.topic.compareTo(right.topic);
        });

    final overallMasteryScore = topicMasteries.isEmpty
        ? 0.0
        : topicMasteries
                  .map((topic) => topic.masteryScore)
                  .reduce((left, right) => left + right) /
              topicMasteries.length;

    final orderedUncompletedLessons = lessons
        .where((lesson) => !completedLessonIds.contains(lesson.id))
        .toList();
    if (orderedUncompletedLessons.isEmpty) {
      return AdaptiveLearningPathDto(
        courseId: courseId,
        pathType: AdaptiveLearningPathType.completed,
        recommendedLessonId: null,
        recommendedLessonTitle: null,
        supportingLessonId: null,
        supportingLessonTitle: null,
        focusTopic: null,
        overallMasteryScore: overallMasteryScore,
        reason: 'All lessons in this course are completed.',
        topicMasteries: topicMasteries,
      );
    }

    final canonicalNextLesson = orderedUncompletedLessons.first;
    final nextLessonTopics = _lessonTopics(
      lessonId: canonicalNextLesson.id!,
      tasksByLessonId: tasksByLessonId,
    );
    final weakestEncounteredTopic = _findWeakestEncounteredTopic(topicMasteries);
    final nextLessonReadiness = _lessonReadiness(
      topics: nextLessonTopics,
      topicMasteries: topicMasteries,
      fallback: overallMasteryScore,
    );

    if (weakestEncounteredTopic != null &&
        weakestEncounteredTopic.masteryScore < _remedialThreshold &&
        nextLessonTopics.contains(weakestEncounteredTopic.topic)) {
      return AdaptiveLearningPathDto(
        courseId: courseId,
        pathType: AdaptiveLearningPathType.remedial,
        recommendedLessonId: canonicalNextLesson.id,
        recommendedLessonTitle: canonicalNextLesson.title,
        supportingLessonId: null,
        supportingLessonTitle: null,
        focusTopic: weakestEncounteredTopic.topic,
        overallMasteryScore: overallMasteryScore,
        reason:
            'Low mastery in ${weakestEncounteredTopic.topic}; continue with the next reinforcement lesson.',
        topicMasteries: topicMasteries,
      );
    }

    if (orderedUncompletedLessons.length > 1 &&
        nextLessonReadiness >= _acceleratedThreshold) {
      final acceleratedLesson = orderedUncompletedLessons[1];
      return AdaptiveLearningPathDto(
        courseId: courseId,
        pathType: AdaptiveLearningPathType.accelerated,
        recommendedLessonId: acceleratedLesson.id,
        recommendedLessonTitle: acceleratedLesson.title,
        supportingLessonId: canonicalNextLesson.id,
        supportingLessonTitle: canonicalNextLesson.title,
        focusTopic: nextLessonTopics.firstOrNull,
        overallMasteryScore: overallMasteryScore,
        reason:
            'High mastery in upcoming topics; you can move faster through the course.',
        topicMasteries: topicMasteries,
      );
    }

    return AdaptiveLearningPathDto(
      courseId: courseId,
      pathType: AdaptiveLearningPathType.standard,
      recommendedLessonId: canonicalNextLesson.id,
      recommendedLessonTitle: canonicalNextLesson.title,
      supportingLessonId: null,
      supportingLessonTitle: null,
      focusTopic: nextLessonTopics.firstOrNull,
      overallMasteryScore: overallMasteryScore,
      reason: 'Continue with the next lesson in your learning sequence.',
      topicMasteries: topicMasteries,
    );
  }

  Set<String> _lessonTopics({
    required int lessonId,
    required Map<int, List<Task>> tasksByLessonId,
  }) {
    return (tasksByLessonId[lessonId] ?? const <Task>[])
        .map((task) => task.topic.trim())
        .where((topic) => topic.isNotEmpty)
        .toSet();
  }

  double _lessonReadiness({
    required Set<String> topics,
    required List<AdaptiveTopicMasteryDto> topicMasteries,
    required double fallback,
  }) {
    if (topics.isEmpty) {
      return fallback;
    }

    final masteryByTopic = {
      for (final topicMastery in topicMasteries)
        topicMastery.topic: topicMastery.masteryScore,
    };
    var total = 0.0;
    for (final topic in topics) {
      total += masteryByTopic[topic] ?? 0.0;
    }
    return total / topics.length;
  }

  AdaptiveTopicMasteryDto? _findWeakestEncounteredTopic(
    List<AdaptiveTopicMasteryDto> topicMasteries,
  ) {
    for (final topicMastery in topicMasteries) {
      if (topicMastery.totalAttempts > 0 || topicMastery.completedLessons > 0) {
        return topicMastery;
      }
    }
    return null;
  }
}

class _TopicStats {
  final String topic;
  int correctAnswers = 0;
  int totalAttempts = 0;
  int completedLessons = 0;
  int totalTopicLessons = 0;

  _TopicStats(this.topic);

  AdaptiveTopicMasteryDto toDto() {
    final completionRatio = totalTopicLessons == 0
        ? 0.0
        : completedLessons / totalTopicLessons;
    final measuredAccuracy = totalAttempts == 0
        ? completionRatio
        : correctAnswers / totalAttempts;
    final evidenceFactor = totalAttempts == 0
        ? 0.0
        : min(1.0, totalAttempts / 3);
    final adjustedAccuracy =
        (0.5 * (1 - evidenceFactor)) + (measuredAccuracy * evidenceFactor);
    final masteryScore = totalAttempts == 0 && completedLessons == 0
        ? 0.0
        : (adjustedAccuracy * 0.7) + (completionRatio * 0.3);

    return AdaptiveTopicMasteryDto(
      topic: topic,
      masteryScore: masteryScore,
      accuracyRatio: measuredAccuracy,
      completionRatio: completionRatio,
      correctAnswers: correctAnswers,
      totalAttempts: totalAttempts,
      completedLessons: completedLessons,
      totalTopicLessons: totalTopicLessons,
    );
  }
}
