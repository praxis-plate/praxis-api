/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../enums/content_status.dart' as _i2;

abstract class CourseAnalyticsSummaryDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseAnalyticsSummaryDto._({
    required this.courseId,
    required this.title,
    required this.contentStatus,
    required this.enrollmentsCount,
    required this.completedEnrollmentsCount,
    required this.completionRate,
    required this.averageLessonsCompleted,
    required this.averageProgressPercentage,
    required this.averageCompletionTimeSeconds,
    required this.totalLessons,
    required this.totalTasks,
    required this.totalAttempts,
    required this.incorrectAttempts,
  });

  factory CourseAnalyticsSummaryDto({
    required int courseId,
    required String title,
    required _i2.ContentStatus contentStatus,
    required int enrollmentsCount,
    required int completedEnrollmentsCount,
    required double completionRate,
    required double averageLessonsCompleted,
    required double averageProgressPercentage,
    required int averageCompletionTimeSeconds,
    required int totalLessons,
    required int totalTasks,
    required int totalAttempts,
    required int incorrectAttempts,
  }) = _CourseAnalyticsSummaryDtoImpl;

  factory CourseAnalyticsSummaryDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CourseAnalyticsSummaryDto(
      courseId: jsonSerialization['courseId'] as int,
      title: jsonSerialization['title'] as String,
      contentStatus: _i2.ContentStatus.fromJson(
        (jsonSerialization['contentStatus'] as String),
      ),
      enrollmentsCount: jsonSerialization['enrollmentsCount'] as int,
      completedEnrollmentsCount:
          jsonSerialization['completedEnrollmentsCount'] as int,
      completionRate: (jsonSerialization['completionRate'] as num).toDouble(),
      averageLessonsCompleted:
          (jsonSerialization['averageLessonsCompleted'] as num).toDouble(),
      averageProgressPercentage:
          (jsonSerialization['averageProgressPercentage'] as num).toDouble(),
      averageCompletionTimeSeconds:
          jsonSerialization['averageCompletionTimeSeconds'] as int,
      totalLessons: jsonSerialization['totalLessons'] as int,
      totalTasks: jsonSerialization['totalTasks'] as int,
      totalAttempts: jsonSerialization['totalAttempts'] as int,
      incorrectAttempts: jsonSerialization['incorrectAttempts'] as int,
    );
  }

  int courseId;

  String title;

  _i2.ContentStatus contentStatus;

  int enrollmentsCount;

  int completedEnrollmentsCount;

  double completionRate;

  double averageLessonsCompleted;

  double averageProgressPercentage;

  int averageCompletionTimeSeconds;

  int totalLessons;

  int totalTasks;

  int totalAttempts;

  int incorrectAttempts;

  /// Returns a shallow copy of this [CourseAnalyticsSummaryDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseAnalyticsSummaryDto copyWith({
    int? courseId,
    String? title,
    _i2.ContentStatus? contentStatus,
    int? enrollmentsCount,
    int? completedEnrollmentsCount,
    double? completionRate,
    double? averageLessonsCompleted,
    double? averageProgressPercentage,
    int? averageCompletionTimeSeconds,
    int? totalLessons,
    int? totalTasks,
    int? totalAttempts,
    int? incorrectAttempts,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseAnalyticsSummaryDto',
      'courseId': courseId,
      'title': title,
      'contentStatus': contentStatus.toJson(),
      'enrollmentsCount': enrollmentsCount,
      'completedEnrollmentsCount': completedEnrollmentsCount,
      'completionRate': completionRate,
      'averageLessonsCompleted': averageLessonsCompleted,
      'averageProgressPercentage': averageProgressPercentage,
      'averageCompletionTimeSeconds': averageCompletionTimeSeconds,
      'totalLessons': totalLessons,
      'totalTasks': totalTasks,
      'totalAttempts': totalAttempts,
      'incorrectAttempts': incorrectAttempts,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseAnalyticsSummaryDto',
      'courseId': courseId,
      'title': title,
      'contentStatus': contentStatus.toJson(),
      'enrollmentsCount': enrollmentsCount,
      'completedEnrollmentsCount': completedEnrollmentsCount,
      'completionRate': completionRate,
      'averageLessonsCompleted': averageLessonsCompleted,
      'averageProgressPercentage': averageProgressPercentage,
      'averageCompletionTimeSeconds': averageCompletionTimeSeconds,
      'totalLessons': totalLessons,
      'totalTasks': totalTasks,
      'totalAttempts': totalAttempts,
      'incorrectAttempts': incorrectAttempts,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CourseAnalyticsSummaryDtoImpl extends CourseAnalyticsSummaryDto {
  _CourseAnalyticsSummaryDtoImpl({
    required int courseId,
    required String title,
    required _i2.ContentStatus contentStatus,
    required int enrollmentsCount,
    required int completedEnrollmentsCount,
    required double completionRate,
    required double averageLessonsCompleted,
    required double averageProgressPercentage,
    required int averageCompletionTimeSeconds,
    required int totalLessons,
    required int totalTasks,
    required int totalAttempts,
    required int incorrectAttempts,
  }) : super._(
         courseId: courseId,
         title: title,
         contentStatus: contentStatus,
         enrollmentsCount: enrollmentsCount,
         completedEnrollmentsCount: completedEnrollmentsCount,
         completionRate: completionRate,
         averageLessonsCompleted: averageLessonsCompleted,
         averageProgressPercentage: averageProgressPercentage,
         averageCompletionTimeSeconds: averageCompletionTimeSeconds,
         totalLessons: totalLessons,
         totalTasks: totalTasks,
         totalAttempts: totalAttempts,
         incorrectAttempts: incorrectAttempts,
       );

  /// Returns a shallow copy of this [CourseAnalyticsSummaryDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseAnalyticsSummaryDto copyWith({
    int? courseId,
    String? title,
    _i2.ContentStatus? contentStatus,
    int? enrollmentsCount,
    int? completedEnrollmentsCount,
    double? completionRate,
    double? averageLessonsCompleted,
    double? averageProgressPercentage,
    int? averageCompletionTimeSeconds,
    int? totalLessons,
    int? totalTasks,
    int? totalAttempts,
    int? incorrectAttempts,
  }) {
    return CourseAnalyticsSummaryDto(
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      contentStatus: contentStatus ?? this.contentStatus,
      enrollmentsCount: enrollmentsCount ?? this.enrollmentsCount,
      completedEnrollmentsCount:
          completedEnrollmentsCount ?? this.completedEnrollmentsCount,
      completionRate: completionRate ?? this.completionRate,
      averageLessonsCompleted:
          averageLessonsCompleted ?? this.averageLessonsCompleted,
      averageProgressPercentage:
          averageProgressPercentage ?? this.averageProgressPercentage,
      averageCompletionTimeSeconds:
          averageCompletionTimeSeconds ?? this.averageCompletionTimeSeconds,
      totalLessons: totalLessons ?? this.totalLessons,
      totalTasks: totalTasks ?? this.totalTasks,
      totalAttempts: totalAttempts ?? this.totalAttempts,
      incorrectAttempts: incorrectAttempts ?? this.incorrectAttempts,
    );
  }
}
