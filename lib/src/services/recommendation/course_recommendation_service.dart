import 'dart:math';

import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_progress_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/user_course_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/course/entities/course_content_counts.dart';
import 'package:praxis_server/src/shared/mappers/learning_content_mapper.dart';
import 'package:serverpod/serverpod.dart';

class CourseRecommendationService {
  static const double _completedCourseBoost = 2.0;
  static const double _inProgressCourseBoost = 1.0;
  static const double _collaborativeWeight = 20.0;
  static const double _fallbackPopularityWeight = 8.0;
  static const double _fallbackRatingWeight = 12.0;
  static const double _collaborativePopularityWeight = 2.0;
  static const double _collaborativeRatingWeight = 2.0;

  final CourseDataSource _courseDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonDataSource _lessonDataSource;
  final TaskDataSource _taskDataSource;
  final UserCourseDataSource _userCourseDataSource;
  final LessonProgressDataSource _lessonProgressDataSource;

  const CourseRecommendationService({
    required CourseDataSource courseDataSource,
    required ModuleDataSource moduleDataSource,
    required LessonDataSource lessonDataSource,
    required TaskDataSource taskDataSource,
    required UserCourseDataSource userCourseDataSource,
    required LessonProgressDataSource lessonProgressDataSource,
  }) : _courseDataSource = courseDataSource,
       _moduleDataSource = moduleDataSource,
       _lessonDataSource = lessonDataSource,
       _taskDataSource = taskDataSource,
       _userCourseDataSource = userCourseDataSource,
       _lessonProgressDataSource = lessonProgressDataSource;

  Future<List<CourseRecommendationDto>> getRecommendations(
    Session session, {
    required UuidValue authUserId,
    int limit = 5,
  }) async {
    if (limit < 1 || limit > 50) {
      throw ValidationException(
        message: 'limit must be between 1 and 50',
        field: 'limit',
      );
    }

    final publishedCourses = await _courseDataSource.listPublished(session);
    if (publishedCourses.isEmpty) {
      return [];
    }

    final userEnrollments = await _userCourseDataSource.listByAuthUserId(
      session,
      authUserId,
    );
    final enrolledCourseIds = userEnrollments
        .map((enrollment) => enrollment.courseId)
        .toSet();

    final candidateCourses = publishedCourses
        .where((course) => !enrolledCourseIds.contains(course.id))
        .toList();
    if (candidateCourses.isEmpty) {
      return [];
    }

    final publishedCourseIds = publishedCourses
        .map((course) => course.id!)
        .toList();
    final candidateCourseIds = candidateCourses
        .map((course) => course.id!)
        .toList();
    final contentCounts = await _countContentForCourses(
      session,
      candidateCourseIds,
    );
    final popularityCounts = await _countPopularityForCourses(
      session,
      publishedCourseIds,
    );
    final interactionStrengthsByUser = await _buildInteractionStrengths(
      session,
      publishedCourses: publishedCourses,
    );
    final targetUserInteractions =
        interactionStrengthsByUser[authUserId] ?? const <int, double>{};

    final recommendations =
        candidateCourses.map((course) {
          final counts =
              contentCounts[course.id!] ?? const CourseContentCounts.empty();
          final popularityCount = popularityCounts[course.id!] ?? 0;
          final collaborativeScore = _computeCollaborativeScore(
            targetUserInteractions: targetUserInteractions,
            candidateCourseId: course.id!,
            interactionStrengthsByUser: interactionStrengthsByUser,
          );
          final score = collaborativeScore > 0
              ? _computeCollaborativeRankScore(
                  collaborativeScore: collaborativeScore,
                  popularityCount: popularityCount,
                  rating: course.rating,
                )
              : _computeFallbackScore(
                  course: course,
                  popularityCount: popularityCount,
                );

          return CourseRecommendationDto(
            course: course.toCourseDto(
              totalLessons: counts.totalLessons,
              totalTasks: counts.totalTasks,
            ),
            score: score,
            reason: _buildReason(
              collaborativeScore: collaborativeScore,
              popularityCount: popularityCount,
              rating: course.rating,
            ),
          );
        }).toList()..sort((left, right) {
          final scoreCompare = right.score.compareTo(left.score);
          if (scoreCompare != 0) {
            return scoreCompare;
          }

          return right.course.rating.compareTo(left.course.rating);
        });

    return recommendations.take(limit).toList();
  }

  Future<Map<UuidValue, Map<int, double>>> _buildInteractionStrengths(
    Session session, {
    required List<Course> publishedCourses,
  }) async {
    if (publishedCourses.isEmpty) {
      return const {};
    }

    final publishedCourseIds = publishedCourses
        .map((course) => course.id!)
        .toList();
    final contentCounts = await _countContentForCourses(
      session,
      publishedCourseIds,
    );
    final enrollments = await _userCourseDataSource.listByCourseIds(
      session,
      publishedCourseIds,
    );
    final courseIdByLessonId = await _buildCourseIdByLessonId(
      session,
      publishedCourseIds,
    );
    final lessonIds = courseIdByLessonId.keys.toList();
    final progresses = await _lessonProgressDataSource.listByLessonIds(
      session,
      lessonIds,
    );

    final completedLessonsByUserAndCourse = <UuidValue, Map<int, int>>{};
    for (final progress in progresses) {
      if (!progress.isCompleted) {
        continue;
      }

      final courseId = courseIdByLessonId[progress.lessonId];
      if (courseId == null) {
        continue;
      }

      final completedByCourse = completedLessonsByUserAndCourse.putIfAbsent(
        progress.authUserId,
        () => <int, int>{},
      );
      completedByCourse[courseId] = (completedByCourse[courseId] ?? 0) + 1;
    }

    final interactionStrengthsByUser = <UuidValue, Map<int, double>>{};
    for (final enrollment in enrollments) {
      final counts =
          contentCounts[enrollment.courseId] ??
          const CourseContentCounts.empty();
      final completedLessons =
          completedLessonsByUserAndCourse[enrollment.authUserId]?[enrollment
              .courseId] ??
          0;
      final progressRatio = counts.totalLessons == 0
          ? 0.0
          : completedLessons / counts.totalLessons;

      final interactionStrength =
          1.0 +
          (progressRatio * _inProgressCourseBoost) +
          ((progressRatio >= 0.999) ? _completedCourseBoost : 0.0);
      final byCourse = interactionStrengthsByUser.putIfAbsent(
        enrollment.authUserId,
        () => <int, double>{},
      );
      byCourse[enrollment.courseId] = interactionStrength;
    }

    return interactionStrengthsByUser;
  }

  double _computeCollaborativeScore({
    required Map<int, double> targetUserInteractions,
    required int candidateCourseId,
    required Map<UuidValue, Map<int, double>> interactionStrengthsByUser,
  }) {
    if (targetUserInteractions.isEmpty) {
      return 0.0;
    }

    var weightedSimilaritySum = 0.0;
    var weightSum = 0.0;

    for (final interactedCourse in targetUserInteractions.entries) {
      final similarity = _computeCourseSimilarity(
        leftCourseId: interactedCourse.key,
        rightCourseId: candidateCourseId,
        interactionStrengthsByUser: interactionStrengthsByUser,
      );
      if (similarity <= 0) {
        continue;
      }

      weightedSimilaritySum += similarity * interactedCourse.value;
      weightSum += similarity.abs();
    }

    if (weightSum == 0) {
      return 0.0;
    }

    return weightedSimilaritySum / weightSum;
  }

  double _computeCourseSimilarity({
    required int leftCourseId,
    required int rightCourseId,
    required Map<UuidValue, Map<int, double>> interactionStrengthsByUser,
  }) {
    var dotProduct = 0.0;
    var leftNorm = 0.0;
    var rightNorm = 0.0;

    for (final interactions in interactionStrengthsByUser.values) {
      final leftValue = interactions[leftCourseId] ?? 0.0;
      final rightValue = interactions[rightCourseId] ?? 0.0;

      dotProduct += leftValue * rightValue;
      leftNorm += leftValue * leftValue;
      rightNorm += rightValue * rightValue;
    }

    if (leftNorm == 0 || rightNorm == 0) {
      return 0.0;
    }

    return dotProduct / (sqrt(leftNorm) * sqrt(rightNorm));
  }

  double _computeFallbackScore({
    required Course course,
    required int popularityCount,
  }) {
    return (course.rating * _fallbackRatingWeight) +
        (popularityCount * _fallbackPopularityWeight);
  }

  double _computeCollaborativeRankScore({
    required double collaborativeScore,
    required int popularityCount,
    required double rating,
  }) {
    return (collaborativeScore * _collaborativeWeight) +
        (popularityCount * _collaborativePopularityWeight) +
        (rating * _collaborativeRatingWeight);
  }

  String _buildReason({
    required double collaborativeScore,
    required int popularityCount,
    required double rating,
  }) {
    if (collaborativeScore > 0) {
      return 'Based on similar learners progress';
    }
    if (popularityCount > 0) {
      return 'Popular among learners';
    }
    if (rating >= 4.5) {
      return 'Highly rated course';
    }

    return 'Recommended for you';
  }

  Future<Map<int, int>> _buildCourseIdByLessonId(
    Session session,
    List<int> courseIds,
  ) async {
    final modules = await _moduleDataSource.listByCourseIds(session, courseIds);
    if (modules.isEmpty) {
      return {};
    }

    final moduleIds = modules.map((module) => module.id!).toList();
    final lessons = await _lessonDataSource.listByModuleIds(session, moduleIds);
    final moduleToCourseId = {
      for (final module in modules) module.id!: module.courseId,
    };

    return {
      for (final lesson in lessons)
        lesson.id!: moduleToCourseId[lesson.moduleId]!,
    };
  }

  Future<Map<int, int>> _countPopularityForCourses(
    Session session,
    List<int> courseIds,
  ) async {
    if (courseIds.isEmpty) {
      return {};
    }

    final enrollments = await _userCourseDataSource.listByCourseIds(
      session,
      courseIds,
    );
    final counts = <int, int>{};
    for (final enrollment in enrollments) {
      counts[enrollment.courseId] = (counts[enrollment.courseId] ?? 0) + 1;
    }

    return counts;
  }

  Future<Map<int, CourseContentCounts>> _countContentForCourses(
    Session session,
    List<int> courseIds,
  ) async {
    if (courseIds.isEmpty) {
      return {};
    }

    final totalLessonsByCourse = <int, int>{};
    final totalTasksByCourse = <int, int>{};

    final modules = await _moduleDataSource.listByCourseIds(session, courseIds);
    if (modules.isEmpty) {
      return _buildContentCounts(totalLessonsByCourse, totalTasksByCourse);
    }

    final moduleIds = modules.map((module) => module.id!).toList();
    final moduleToCourseId = {
      for (final module in modules) module.id!: module.courseId,
    };

    final lessons = await _lessonDataSource.listByModuleIds(session, moduleIds);
    if (lessons.isEmpty) {
      return _buildContentCounts(totalLessonsByCourse, totalTasksByCourse);
    }

    final lessonIds = lessons.map((lesson) => lesson.id!).toList();
    final lessonToCourseId = <int, int>{};
    for (final lesson in lessons) {
      final courseId = moduleToCourseId[lesson.moduleId]!;
      lessonToCourseId[lesson.id!] = courseId;
      totalLessonsByCourse[courseId] =
          (totalLessonsByCourse[courseId] ?? 0) + 1;
    }

    final tasks = await _taskDataSource.listByLessonIds(session, lessonIds);
    for (final task in tasks) {
      final courseId = lessonToCourseId[task.lessonId]!;
      totalTasksByCourse[courseId] = (totalTasksByCourse[courseId] ?? 0) + 1;
    }

    return _buildContentCounts(totalLessonsByCourse, totalTasksByCourse);
  }

  Map<int, CourseContentCounts> _buildContentCounts(
    Map<int, int> totalLessonsByCourse,
    Map<int, int> totalTasksByCourse,
  ) {
    final courseIds = {
      ...totalLessonsByCourse.keys,
      ...totalTasksByCourse.keys,
    };

    return {
      for (final courseId in courseIds)
        courseId: CourseContentCounts(
          totalLessons: totalLessonsByCourse[courseId] ?? 0,
          totalTasks: totalTasksByCourse[courseId] ?? 0,
        ),
    };
  }
}
