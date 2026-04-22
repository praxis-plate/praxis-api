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
import '../enums/task_type.dart' as _i2;

abstract class CourseAnalyticsTaskDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseAnalyticsTaskDto._({
    required this.taskId,
    required this.lessonId,
    required this.lessonTitle,
    required this.questionText,
    required this.taskType,
    required this.totalAttempts,
    required this.correctAttempts,
    required this.incorrectAttempts,
    required this.accuracyRate,
  });

  factory CourseAnalyticsTaskDto({
    required int taskId,
    required int lessonId,
    required String lessonTitle,
    required String questionText,
    required _i2.TaskType taskType,
    required int totalAttempts,
    required int correctAttempts,
    required int incorrectAttempts,
    required double accuracyRate,
  }) = _CourseAnalyticsTaskDtoImpl;

  factory CourseAnalyticsTaskDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CourseAnalyticsTaskDto(
      taskId: jsonSerialization['taskId'] as int,
      lessonId: jsonSerialization['lessonId'] as int,
      lessonTitle: jsonSerialization['lessonTitle'] as String,
      questionText: jsonSerialization['questionText'] as String,
      taskType: _i2.TaskType.fromJson(
        (jsonSerialization['taskType'] as String),
      ),
      totalAttempts: jsonSerialization['totalAttempts'] as int,
      correctAttempts: jsonSerialization['correctAttempts'] as int,
      incorrectAttempts: jsonSerialization['incorrectAttempts'] as int,
      accuracyRate: (jsonSerialization['accuracyRate'] as num).toDouble(),
    );
  }

  int taskId;

  int lessonId;

  String lessonTitle;

  String questionText;

  _i2.TaskType taskType;

  int totalAttempts;

  int correctAttempts;

  int incorrectAttempts;

  double accuracyRate;

  /// Returns a shallow copy of this [CourseAnalyticsTaskDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseAnalyticsTaskDto copyWith({
    int? taskId,
    int? lessonId,
    String? lessonTitle,
    String? questionText,
    _i2.TaskType? taskType,
    int? totalAttempts,
    int? correctAttempts,
    int? incorrectAttempts,
    double? accuracyRate,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseAnalyticsTaskDto',
      'taskId': taskId,
      'lessonId': lessonId,
      'lessonTitle': lessonTitle,
      'questionText': questionText,
      'taskType': taskType.toJson(),
      'totalAttempts': totalAttempts,
      'correctAttempts': correctAttempts,
      'incorrectAttempts': incorrectAttempts,
      'accuracyRate': accuracyRate,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseAnalyticsTaskDto',
      'taskId': taskId,
      'lessonId': lessonId,
      'lessonTitle': lessonTitle,
      'questionText': questionText,
      'taskType': taskType.toJson(),
      'totalAttempts': totalAttempts,
      'correctAttempts': correctAttempts,
      'incorrectAttempts': incorrectAttempts,
      'accuracyRate': accuracyRate,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CourseAnalyticsTaskDtoImpl extends CourseAnalyticsTaskDto {
  _CourseAnalyticsTaskDtoImpl({
    required int taskId,
    required int lessonId,
    required String lessonTitle,
    required String questionText,
    required _i2.TaskType taskType,
    required int totalAttempts,
    required int correctAttempts,
    required int incorrectAttempts,
    required double accuracyRate,
  }) : super._(
         taskId: taskId,
         lessonId: lessonId,
         lessonTitle: lessonTitle,
         questionText: questionText,
         taskType: taskType,
         totalAttempts: totalAttempts,
         correctAttempts: correctAttempts,
         incorrectAttempts: incorrectAttempts,
         accuracyRate: accuracyRate,
       );

  /// Returns a shallow copy of this [CourseAnalyticsTaskDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseAnalyticsTaskDto copyWith({
    int? taskId,
    int? lessonId,
    String? lessonTitle,
    String? questionText,
    _i2.TaskType? taskType,
    int? totalAttempts,
    int? correctAttempts,
    int? incorrectAttempts,
    double? accuracyRate,
  }) {
    return CourseAnalyticsTaskDto(
      taskId: taskId ?? this.taskId,
      lessonId: lessonId ?? this.lessonId,
      lessonTitle: lessonTitle ?? this.lessonTitle,
      questionText: questionText ?? this.questionText,
      taskType: taskType ?? this.taskType,
      totalAttempts: totalAttempts ?? this.totalAttempts,
      correctAttempts: correctAttempts ?? this.correctAttempts,
      incorrectAttempts: incorrectAttempts ?? this.incorrectAttempts,
      accuracyRate: accuracyRate ?? this.accuracyRate,
    );
  }
}
