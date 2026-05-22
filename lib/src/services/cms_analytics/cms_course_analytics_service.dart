import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_progress_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_answer_attempt_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/user_course_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CmsCourseAnalyticsService {
  final CourseDataSource _courseDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonDataSource _lessonDataSource;
  final TaskDataSource _taskDataSource;
  final UserCourseDataSource _userCourseDataSource;
  final LessonProgressDataSource _lessonProgressDataSource;
  final TaskAnswerAttemptDataSource _taskAnswerAttemptDataSource;

  const CmsCourseAnalyticsService({
    required CourseDataSource courseDataSource,
    required ModuleDataSource moduleDataSource,
    required LessonDataSource lessonDataSource,
    required TaskDataSource taskDataSource,
    required UserCourseDataSource userCourseDataSource,
    required LessonProgressDataSource lessonProgressDataSource,
    required TaskAnswerAttemptDataSource taskAnswerAttemptDataSource,
  }) : _courseDataSource = courseDataSource,
       _moduleDataSource = moduleDataSource,
       _lessonDataSource = lessonDataSource,
       _taskDataSource = taskDataSource,
       _userCourseDataSource = userCourseDataSource,
       _lessonProgressDataSource = lessonProgressDataSource,
       _taskAnswerAttemptDataSource = taskAnswerAttemptDataSource;

  Future<CourseAnalyticsDashboardDto> getDashboard(
    Session session,
    int courseId, {
    int commonWrongAnswersLimit = 10,
  }) async {
    if (commonWrongAnswersLimit < 1 || commonWrongAnswersLimit > 50) {
      throw ValidationException(
        message: 'commonWrongAnswersLimit must be between 1 and 50',
        field: 'commonWrongAnswersLimit',
      );
    }

    final course = await _courseDataSource.findById(session, courseId);
    if (course == null) {
      throw NotFoundException(message: 'Course not found');
    }

    final modules = await _moduleDataSource.listByCourseId(session, courseId);
    final moduleIds = modules.map((module) => module.id!).toList();
    final lessons = await _lessonDataSource.listByModuleIds(session, moduleIds);
    final lessonIds = lessons.map((lesson) => lesson.id!).toList();
    final tasks = await _taskDataSource.listByLessonIds(session, lessonIds);
    final taskIds = tasks.map((task) => task.id!).toList();
    final enrollments = await _userCourseDataSource.listByCourseId(
      session,
      courseId,
    );
    final progresses = await _lessonProgressDataSource.listByLessonIds(
      session,
      lessonIds,
    );
    final attempts = await _taskAnswerAttemptDataSource.listByTaskIds(
      session,
      taskIds,
    );

    final lessonsById = {for (final lesson in lessons) lesson.id!: lesson};
    final modulesById = {for (final module in modules) module.id!: module};
    final tasksById = {for (final task in tasks) task.id!: task};
    final enrolledUserIds = enrollments.map((item) => item.authUserId).toSet();

    final completedLessonsByUser = <UuidValue, Set<int>>{};
    final timeSpentByUser = <UuidValue, int>{};
    final progressByLessonId = <int, List<LessonProgress>>{};

    for (final progress in progresses) {
      if (!enrolledUserIds.contains(progress.authUserId)) {
        continue;
      }

      final lessonProgresses = progressByLessonId.putIfAbsent(
        progress.lessonId,
        () => [],
      );
      lessonProgresses.add(progress);

      if (progress.isCompleted) {
        final completedLessons = completedLessonsByUser.putIfAbsent(
          progress.authUserId,
          () => <int>{},
        );
        completedLessons.add(progress.lessonId);
      }

      timeSpentByUser[progress.authUserId] =
          (timeSpentByUser[progress.authUserId] ?? 0) +
          progress.timeSpentSeconds;
    }

    final totalLessons = lessons.length;
    final totalTasks = tasks.length;
    final enrollmentsCount = enrollments.length;
    final completedEnrollmentsCount = enrolledUserIds.where((authUserId) {
      if (totalLessons == 0) {
        return false;
      }

      final completedLessons = completedLessonsByUser[authUserId];
      return completedLessons != null &&
          completedLessons.length >= totalLessons;
    }).length;

    final totalCompletedLessons = enrolledUserIds.fold<int>(
      0,
      (sum, authUserId) =>
          sum + (completedLessonsByUser[authUserId]?.length ?? 0),
    );
    final averageLessonsCompleted = enrollmentsCount == 0
        ? 0.0
        : totalCompletedLessons / enrollmentsCount;
    final averageProgressPercentage = enrollmentsCount == 0 || totalLessons == 0
        ? 0.0
        : (averageLessonsCompleted / totalLessons) * 100;
    final completionRate = enrollmentsCount == 0
        ? 0.0
        : (completedEnrollmentsCount / enrollmentsCount) * 100;

    final completedUserIds = enrolledUserIds.where((authUserId) {
      final completedLessons = completedLessonsByUser[authUserId];
      return totalLessons > 0 &&
          completedLessons != null &&
          completedLessons.length >= totalLessons;
    }).toList();
    final averageCompletionTimeSeconds = completedUserIds.isEmpty
        ? 0
        : (completedUserIds
                      .map((authUserId) => timeSpentByUser[authUserId] ?? 0)
                      .reduce((left, right) => left + right) /
                  completedUserIds.length)
              .round();

    final lessonAnalytics = lessons.map((lesson) {
      final lessonProgresses = progressByLessonId[lesson.id!] ?? const [];
      final startedLearners = lessonProgresses
          .map((progress) => progress.authUserId)
          .toSet()
          .length;
      final completedLearners = lessonProgresses
          .where((progress) => progress.isCompleted)
          .map((progress) => progress.authUserId)
          .toSet()
          .length;
      final averageTimeSpentSeconds = lessonProgresses.isEmpty
          ? 0
          : (lessonProgresses
                        .map((progress) => progress.timeSpentSeconds)
                        .reduce((left, right) => left + right) /
                    lessonProgresses.length)
                .round();
      final module = modulesById[lesson.moduleId]!;

      return CourseAnalyticsLessonDto(
        lessonId: lesson.id!,
        moduleId: module.id!,
        moduleTitle: module.title,
        title: lesson.title,
        orderIndex: lesson.orderIndex,
        startedLearners: startedLearners,
        completedLearners: completedLearners,
        completionRate: enrollmentsCount == 0
            ? 0.0
            : (completedLearners / enrollmentsCount) * 100,
        averageTimeSpentSeconds: averageTimeSpentSeconds,
        dropOffCount: startedLearners - completedLearners,
      );
    }).toList();

    final attemptsByTaskId = <int, List<TaskAnswerAttempt>>{};
    for (final attempt in attempts) {
      final taskAttempts = attemptsByTaskId.putIfAbsent(
        attempt.taskId,
        () => [],
      );
      taskAttempts.add(attempt);
    }

    final taskAnalytics = tasks.map((task) {
      final taskAttempts = attemptsByTaskId[task.id!] ?? const [];
      final correctAttempts = taskAttempts
          .where((attempt) => attempt.isCorrect)
          .length;
      final incorrectAttempts = taskAttempts
          .where((attempt) => !attempt.isCorrect)
          .length;
      final lesson = lessonsById[task.lessonId]!;

      return CourseAnalyticsTaskDto(
        taskId: task.id!,
        lessonId: lesson.id!,
        lessonTitle: lesson.title,
        questionText: task.questionText,
        taskType: task.taskType,
        totalAttempts: taskAttempts.length,
        correctAttempts: correctAttempts,
        incorrectAttempts: incorrectAttempts,
        accuracyRate: taskAttempts.isEmpty
            ? 0.0
            : (correctAttempts / taskAttempts.length) * 100,
      );
    }).toList();

    final totalAttempts = attempts.length;
    final incorrectAttemptsCount = attempts
        .where((attempt) => !attempt.isCorrect)
        .length;

    final wrongAnswers = _buildWrongAnswers(
      attempts: attempts,
      tasksById: tasksById,
      lessonsById: lessonsById,
      limit: commonWrongAnswersLimit,
    );

    return CourseAnalyticsDashboardDto(
      summary: CourseAnalyticsSummaryDto(
        courseId: course.id!,
        title: course.title,
        contentStatus: course.contentStatus,
        enrollmentsCount: enrollmentsCount,
        completedEnrollmentsCount: completedEnrollmentsCount,
        completionRate: completionRate,
        averageLessonsCompleted: averageLessonsCompleted,
        averageProgressPercentage: averageProgressPercentage,
        averageCompletionTimeSeconds: averageCompletionTimeSeconds,
        totalLessons: totalLessons,
        totalTasks: totalTasks,
        totalAttempts: totalAttempts,
        incorrectAttempts: incorrectAttemptsCount,
      ),
      lessons: lessonAnalytics,
      tasks: taskAnalytics,
      commonWrongAnswers: wrongAnswers,
    );
  }

  List<CourseAnalyticsWrongAnswerDto> _buildWrongAnswers({
    required List<TaskAnswerAttempt> attempts,
    required Map<int, Task> tasksById,
    required Map<int, Lesson> lessonsById,
    required int limit,
  }) {
    final groupedWrongAnswers = <String, _WrongAnswerAggregate>{};

    for (final attempt in attempts) {
      if (attempt.isCorrect) {
        continue;
      }

      final answerText = attempt.userAnswer?.trim();
      if (answerText == null || answerText.isEmpty) {
        continue;
      }

      final task = tasksById[attempt.taskId];
      if (task == null) {
        continue;
      }

      final key = '${attempt.taskId}:${answerText.toLowerCase()}';
      final aggregate = groupedWrongAnswers.putIfAbsent(
        key,
        () => _WrongAnswerAggregate(
          task: task,
          answerText: answerText,
          lastSubmittedAt: attempt.submittedAt,
        ),
      );
      aggregate.occurrences += 1;
      if (attempt.submittedAt.isAfter(aggregate.lastSubmittedAt)) {
        aggregate.lastSubmittedAt = attempt.submittedAt;
      }
    }

    final sortedAggregates = groupedWrongAnswers.values.toList()
      ..sort((left, right) {
        final countCompare = right.occurrences.compareTo(left.occurrences);
        if (countCompare != 0) {
          return countCompare;
        }
        return right.lastSubmittedAt.compareTo(left.lastSubmittedAt);
      });

    return sortedAggregates.take(limit).map((aggregate) {
      final lesson = lessonsById[aggregate.task.lessonId]!;
      return CourseAnalyticsWrongAnswerDto(
        taskId: aggregate.task.id!,
        lessonId: lesson.id!,
        lessonTitle: lesson.title,
        questionText: aggregate.task.questionText,
        answerText: aggregate.answerText,
        occurrences: aggregate.occurrences,
        lastSubmittedAt: aggregate.lastSubmittedAt,
      );
    }).toList();
  }
}

class _WrongAnswerAggregate {
  final Task task;
  final String answerText;
  int occurrences = 0;
  DateTime lastSubmittedAt;

  _WrongAnswerAggregate({
    required this.task,
    required this.answerText,
    required this.lastSubmittedAt,
  });
}
