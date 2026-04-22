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

abstract class CreateTaskRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateTaskRequest._({
    required this.lessonId,
    required this.taskType,
    required this.questionText,
    this.correctAnswer,
    this.codeTemplate,
    this.programmingLanguage,
    this.difficultyLevel,
    this.xpValue,
    this.fallbackHint,
    this.fallbackExplanation,
    this.topic,
  });

  factory CreateTaskRequest({
    required int lessonId,
    required _i2.TaskType taskType,
    required String questionText,
    String? correctAnswer,
    String? codeTemplate,
    String? programmingLanguage,
    int? difficultyLevel,
    int? xpValue,
    String? fallbackHint,
    String? fallbackExplanation,
    String? topic,
  }) = _CreateTaskRequestImpl;

  factory CreateTaskRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateTaskRequest(
      lessonId: jsonSerialization['lessonId'] as int,
      taskType: _i2.TaskType.fromJson(
        (jsonSerialization['taskType'] as String),
      ),
      questionText: jsonSerialization['questionText'] as String,
      correctAnswer: jsonSerialization['correctAnswer'] as String?,
      codeTemplate: jsonSerialization['codeTemplate'] as String?,
      programmingLanguage: jsonSerialization['programmingLanguage'] as String?,
      difficultyLevel: jsonSerialization['difficultyLevel'] as int?,
      xpValue: jsonSerialization['xpValue'] as int?,
      fallbackHint: jsonSerialization['fallbackHint'] as String?,
      fallbackExplanation: jsonSerialization['fallbackExplanation'] as String?,
      topic: jsonSerialization['topic'] as String?,
    );
  }

  int lessonId;

  _i2.TaskType taskType;

  String questionText;

  String? correctAnswer;

  String? codeTemplate;

  String? programmingLanguage;

  int? difficultyLevel;

  int? xpValue;

  String? fallbackHint;

  String? fallbackExplanation;

  String? topic;

  /// Returns a shallow copy of this [CreateTaskRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateTaskRequest copyWith({
    int? lessonId,
    _i2.TaskType? taskType,
    String? questionText,
    String? correctAnswer,
    String? codeTemplate,
    String? programmingLanguage,
    int? difficultyLevel,
    int? xpValue,
    String? fallbackHint,
    String? fallbackExplanation,
    String? topic,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateTaskRequest',
      'lessonId': lessonId,
      'taskType': taskType.toJson(),
      'questionText': questionText,
      if (correctAnswer != null) 'correctAnswer': correctAnswer,
      if (codeTemplate != null) 'codeTemplate': codeTemplate,
      if (programmingLanguage != null)
        'programmingLanguage': programmingLanguage,
      if (difficultyLevel != null) 'difficultyLevel': difficultyLevel,
      if (xpValue != null) 'xpValue': xpValue,
      if (fallbackHint != null) 'fallbackHint': fallbackHint,
      if (fallbackExplanation != null)
        'fallbackExplanation': fallbackExplanation,
      if (topic != null) 'topic': topic,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreateTaskRequest',
      'lessonId': lessonId,
      'taskType': taskType.toJson(),
      'questionText': questionText,
      if (correctAnswer != null) 'correctAnswer': correctAnswer,
      if (codeTemplate != null) 'codeTemplate': codeTemplate,
      if (programmingLanguage != null)
        'programmingLanguage': programmingLanguage,
      if (difficultyLevel != null) 'difficultyLevel': difficultyLevel,
      if (xpValue != null) 'xpValue': xpValue,
      if (fallbackHint != null) 'fallbackHint': fallbackHint,
      if (fallbackExplanation != null)
        'fallbackExplanation': fallbackExplanation,
      if (topic != null) 'topic': topic,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateTaskRequestImpl extends CreateTaskRequest {
  _CreateTaskRequestImpl({
    required int lessonId,
    required _i2.TaskType taskType,
    required String questionText,
    String? correctAnswer,
    String? codeTemplate,
    String? programmingLanguage,
    int? difficultyLevel,
    int? xpValue,
    String? fallbackHint,
    String? fallbackExplanation,
    String? topic,
  }) : super._(
         lessonId: lessonId,
         taskType: taskType,
         questionText: questionText,
         correctAnswer: correctAnswer,
         codeTemplate: codeTemplate,
         programmingLanguage: programmingLanguage,
         difficultyLevel: difficultyLevel,
         xpValue: xpValue,
         fallbackHint: fallbackHint,
         fallbackExplanation: fallbackExplanation,
         topic: topic,
       );

  /// Returns a shallow copy of this [CreateTaskRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateTaskRequest copyWith({
    int? lessonId,
    _i2.TaskType? taskType,
    String? questionText,
    Object? correctAnswer = _Undefined,
    Object? codeTemplate = _Undefined,
    Object? programmingLanguage = _Undefined,
    Object? difficultyLevel = _Undefined,
    Object? xpValue = _Undefined,
    Object? fallbackHint = _Undefined,
    Object? fallbackExplanation = _Undefined,
    Object? topic = _Undefined,
  }) {
    return CreateTaskRequest(
      lessonId: lessonId ?? this.lessonId,
      taskType: taskType ?? this.taskType,
      questionText: questionText ?? this.questionText,
      correctAnswer: correctAnswer is String?
          ? correctAnswer
          : this.correctAnswer,
      codeTemplate: codeTemplate is String? ? codeTemplate : this.codeTemplate,
      programmingLanguage: programmingLanguage is String?
          ? programmingLanguage
          : this.programmingLanguage,
      difficultyLevel: difficultyLevel is int?
          ? difficultyLevel
          : this.difficultyLevel,
      xpValue: xpValue is int? ? xpValue : this.xpValue,
      fallbackHint: fallbackHint is String? ? fallbackHint : this.fallbackHint,
      fallbackExplanation: fallbackExplanation is String?
          ? fallbackExplanation
          : this.fallbackExplanation,
      topic: topic is String? ? topic : this.topic,
    );
  }
}
