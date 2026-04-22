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

abstract class CourseAnalyticsLessonDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseAnalyticsLessonDto._({
    required this.lessonId,
    required this.moduleId,
    required this.moduleTitle,
    required this.title,
    required this.orderIndex,
    required this.startedLearners,
    required this.completedLearners,
    required this.completionRate,
    required this.averageTimeSpentSeconds,
    required this.dropOffCount,
  });

  factory CourseAnalyticsLessonDto({
    required int lessonId,
    required int moduleId,
    required String moduleTitle,
    required String title,
    required int orderIndex,
    required int startedLearners,
    required int completedLearners,
    required double completionRate,
    required int averageTimeSpentSeconds,
    required int dropOffCount,
  }) = _CourseAnalyticsLessonDtoImpl;

  factory CourseAnalyticsLessonDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CourseAnalyticsLessonDto(
      lessonId: jsonSerialization['lessonId'] as int,
      moduleId: jsonSerialization['moduleId'] as int,
      moduleTitle: jsonSerialization['moduleTitle'] as String,
      title: jsonSerialization['title'] as String,
      orderIndex: jsonSerialization['orderIndex'] as int,
      startedLearners: jsonSerialization['startedLearners'] as int,
      completedLearners: jsonSerialization['completedLearners'] as int,
      completionRate: (jsonSerialization['completionRate'] as num).toDouble(),
      averageTimeSpentSeconds:
          jsonSerialization['averageTimeSpentSeconds'] as int,
      dropOffCount: jsonSerialization['dropOffCount'] as int,
    );
  }

  int lessonId;

  int moduleId;

  String moduleTitle;

  String title;

  int orderIndex;

  int startedLearners;

  int completedLearners;

  double completionRate;

  int averageTimeSpentSeconds;

  int dropOffCount;

  /// Returns a shallow copy of this [CourseAnalyticsLessonDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseAnalyticsLessonDto copyWith({
    int? lessonId,
    int? moduleId,
    String? moduleTitle,
    String? title,
    int? orderIndex,
    int? startedLearners,
    int? completedLearners,
    double? completionRate,
    int? averageTimeSpentSeconds,
    int? dropOffCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseAnalyticsLessonDto',
      'lessonId': lessonId,
      'moduleId': moduleId,
      'moduleTitle': moduleTitle,
      'title': title,
      'orderIndex': orderIndex,
      'startedLearners': startedLearners,
      'completedLearners': completedLearners,
      'completionRate': completionRate,
      'averageTimeSpentSeconds': averageTimeSpentSeconds,
      'dropOffCount': dropOffCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseAnalyticsLessonDto',
      'lessonId': lessonId,
      'moduleId': moduleId,
      'moduleTitle': moduleTitle,
      'title': title,
      'orderIndex': orderIndex,
      'startedLearners': startedLearners,
      'completedLearners': completedLearners,
      'completionRate': completionRate,
      'averageTimeSpentSeconds': averageTimeSpentSeconds,
      'dropOffCount': dropOffCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CourseAnalyticsLessonDtoImpl extends CourseAnalyticsLessonDto {
  _CourseAnalyticsLessonDtoImpl({
    required int lessonId,
    required int moduleId,
    required String moduleTitle,
    required String title,
    required int orderIndex,
    required int startedLearners,
    required int completedLearners,
    required double completionRate,
    required int averageTimeSpentSeconds,
    required int dropOffCount,
  }) : super._(
         lessonId: lessonId,
         moduleId: moduleId,
         moduleTitle: moduleTitle,
         title: title,
         orderIndex: orderIndex,
         startedLearners: startedLearners,
         completedLearners: completedLearners,
         completionRate: completionRate,
         averageTimeSpentSeconds: averageTimeSpentSeconds,
         dropOffCount: dropOffCount,
       );

  /// Returns a shallow copy of this [CourseAnalyticsLessonDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseAnalyticsLessonDto copyWith({
    int? lessonId,
    int? moduleId,
    String? moduleTitle,
    String? title,
    int? orderIndex,
    int? startedLearners,
    int? completedLearners,
    double? completionRate,
    int? averageTimeSpentSeconds,
    int? dropOffCount,
  }) {
    return CourseAnalyticsLessonDto(
      lessonId: lessonId ?? this.lessonId,
      moduleId: moduleId ?? this.moduleId,
      moduleTitle: moduleTitle ?? this.moduleTitle,
      title: title ?? this.title,
      orderIndex: orderIndex ?? this.orderIndex,
      startedLearners: startedLearners ?? this.startedLearners,
      completedLearners: completedLearners ?? this.completedLearners,
      completionRate: completionRate ?? this.completionRate,
      averageTimeSpentSeconds:
          averageTimeSpentSeconds ?? this.averageTimeSpentSeconds,
      dropOffCount: dropOffCount ?? this.dropOffCount,
    );
  }
}
