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

abstract class CourseAnalyticsWrongAnswerDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseAnalyticsWrongAnswerDto._({
    required this.taskId,
    required this.lessonId,
    required this.lessonTitle,
    required this.questionText,
    required this.answerText,
    required this.occurrences,
    required this.lastSubmittedAt,
  });

  factory CourseAnalyticsWrongAnswerDto({
    required int taskId,
    required int lessonId,
    required String lessonTitle,
    required String questionText,
    required String answerText,
    required int occurrences,
    required DateTime lastSubmittedAt,
  }) = _CourseAnalyticsWrongAnswerDtoImpl;

  factory CourseAnalyticsWrongAnswerDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CourseAnalyticsWrongAnswerDto(
      taskId: jsonSerialization['taskId'] as int,
      lessonId: jsonSerialization['lessonId'] as int,
      lessonTitle: jsonSerialization['lessonTitle'] as String,
      questionText: jsonSerialization['questionText'] as String,
      answerText: jsonSerialization['answerText'] as String,
      occurrences: jsonSerialization['occurrences'] as int,
      lastSubmittedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastSubmittedAt'],
      ),
    );
  }

  int taskId;

  int lessonId;

  String lessonTitle;

  String questionText;

  String answerText;

  int occurrences;

  DateTime lastSubmittedAt;

  /// Returns a shallow copy of this [CourseAnalyticsWrongAnswerDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseAnalyticsWrongAnswerDto copyWith({
    int? taskId,
    int? lessonId,
    String? lessonTitle,
    String? questionText,
    String? answerText,
    int? occurrences,
    DateTime? lastSubmittedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseAnalyticsWrongAnswerDto',
      'taskId': taskId,
      'lessonId': lessonId,
      'lessonTitle': lessonTitle,
      'questionText': questionText,
      'answerText': answerText,
      'occurrences': occurrences,
      'lastSubmittedAt': lastSubmittedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseAnalyticsWrongAnswerDto',
      'taskId': taskId,
      'lessonId': lessonId,
      'lessonTitle': lessonTitle,
      'questionText': questionText,
      'answerText': answerText,
      'occurrences': occurrences,
      'lastSubmittedAt': lastSubmittedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CourseAnalyticsWrongAnswerDtoImpl extends CourseAnalyticsWrongAnswerDto {
  _CourseAnalyticsWrongAnswerDtoImpl({
    required int taskId,
    required int lessonId,
    required String lessonTitle,
    required String questionText,
    required String answerText,
    required int occurrences,
    required DateTime lastSubmittedAt,
  }) : super._(
         taskId: taskId,
         lessonId: lessonId,
         lessonTitle: lessonTitle,
         questionText: questionText,
         answerText: answerText,
         occurrences: occurrences,
         lastSubmittedAt: lastSubmittedAt,
       );

  /// Returns a shallow copy of this [CourseAnalyticsWrongAnswerDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseAnalyticsWrongAnswerDto copyWith({
    int? taskId,
    int? lessonId,
    String? lessonTitle,
    String? questionText,
    String? answerText,
    int? occurrences,
    DateTime? lastSubmittedAt,
  }) {
    return CourseAnalyticsWrongAnswerDto(
      taskId: taskId ?? this.taskId,
      lessonId: lessonId ?? this.lessonId,
      lessonTitle: lessonTitle ?? this.lessonTitle,
      questionText: questionText ?? this.questionText,
      answerText: answerText ?? this.answerText,
      occurrences: occurrences ?? this.occurrences,
      lastSubmittedAt: lastSubmittedAt ?? this.lastSubmittedAt,
    );
  }
}
