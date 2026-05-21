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

abstract class UpdateTaskRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UpdateTaskRequest._({
    required this.id,
    required this.taskType,
    required this.questionText,
    required this.correctAnswer,
    this.optionsJson,
    this.codeTemplate,
    this.programmingLanguage,
    required this.difficultyLevel,
    required this.xpValue,
    this.fallbackHint,
    this.fallbackExplanation,
    required this.topic,
  });

  factory UpdateTaskRequest({
    required int id,
    required _i2.TaskType taskType,
    required String questionText,
    required String correctAnswer,
    String? optionsJson,
    String? codeTemplate,
    String? programmingLanguage,
    required int difficultyLevel,
    required int xpValue,
    String? fallbackHint,
    String? fallbackExplanation,
    required String topic,
  }) = _UpdateTaskRequestImpl;

  factory UpdateTaskRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return UpdateTaskRequest(
      id: jsonSerialization['id'] as int,
      taskType: _i2.TaskType.fromJson(
        (jsonSerialization['taskType'] as String),
      ),
      questionText: jsonSerialization['questionText'] as String,
      correctAnswer: jsonSerialization['correctAnswer'] as String,
      optionsJson: jsonSerialization['optionsJson'] as String?,
      codeTemplate: jsonSerialization['codeTemplate'] as String?,
      programmingLanguage: jsonSerialization['programmingLanguage'] as String?,
      difficultyLevel: jsonSerialization['difficultyLevel'] as int,
      xpValue: jsonSerialization['xpValue'] as int,
      fallbackHint: jsonSerialization['fallbackHint'] as String?,
      fallbackExplanation: jsonSerialization['fallbackExplanation'] as String?,
      topic: jsonSerialization['topic'] as String,
    );
  }

  int id;

  _i2.TaskType taskType;

  String questionText;

  String correctAnswer;

  String? optionsJson;

  String? codeTemplate;

  String? programmingLanguage;

  int difficultyLevel;

  int xpValue;

  String? fallbackHint;

  String? fallbackExplanation;

  String topic;

  /// Returns a shallow copy of this [UpdateTaskRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateTaskRequest copyWith({
    int? id,
    _i2.TaskType? taskType,
    String? questionText,
    String? correctAnswer,
    String? optionsJson,
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
      '__className__': 'UpdateTaskRequest',
      'id': id,
      'taskType': taskType.toJson(),
      'questionText': questionText,
      'correctAnswer': correctAnswer,
      if (optionsJson != null) 'optionsJson': optionsJson,
      if (codeTemplate != null) 'codeTemplate': codeTemplate,
      if (programmingLanguage != null)
        'programmingLanguage': programmingLanguage,
      'difficultyLevel': difficultyLevel,
      'xpValue': xpValue,
      if (fallbackHint != null) 'fallbackHint': fallbackHint,
      if (fallbackExplanation != null)
        'fallbackExplanation': fallbackExplanation,
      'topic': topic,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UpdateTaskRequest',
      'id': id,
      'taskType': taskType.toJson(),
      'questionText': questionText,
      'correctAnswer': correctAnswer,
      if (optionsJson != null) 'optionsJson': optionsJson,
      if (codeTemplate != null) 'codeTemplate': codeTemplate,
      if (programmingLanguage != null)
        'programmingLanguage': programmingLanguage,
      'difficultyLevel': difficultyLevel,
      'xpValue': xpValue,
      if (fallbackHint != null) 'fallbackHint': fallbackHint,
      if (fallbackExplanation != null)
        'fallbackExplanation': fallbackExplanation,
      'topic': topic,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UpdateTaskRequestImpl extends UpdateTaskRequest {
  _UpdateTaskRequestImpl({
    required int id,
    required _i2.TaskType taskType,
    required String questionText,
    required String correctAnswer,
    String? optionsJson,
    String? codeTemplate,
    String? programmingLanguage,
    required int difficultyLevel,
    required int xpValue,
    String? fallbackHint,
    String? fallbackExplanation,
    required String topic,
  }) : super._(
         id: id,
         taskType: taskType,
         questionText: questionText,
         correctAnswer: correctAnswer,
         optionsJson: optionsJson,
         codeTemplate: codeTemplate,
         programmingLanguage: programmingLanguage,
         difficultyLevel: difficultyLevel,
         xpValue: xpValue,
         fallbackHint: fallbackHint,
         fallbackExplanation: fallbackExplanation,
         topic: topic,
       );

  /// Returns a shallow copy of this [UpdateTaskRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateTaskRequest copyWith({
    int? id,
    _i2.TaskType? taskType,
    String? questionText,
    String? correctAnswer,
    Object? optionsJson = _Undefined,
    Object? codeTemplate = _Undefined,
    Object? programmingLanguage = _Undefined,
    int? difficultyLevel,
    int? xpValue,
    Object? fallbackHint = _Undefined,
    Object? fallbackExplanation = _Undefined,
    String? topic,
  }) {
    return UpdateTaskRequest(
      id: id ?? this.id,
      taskType: taskType ?? this.taskType,
      questionText: questionText ?? this.questionText,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      optionsJson: optionsJson is String? ? optionsJson : this.optionsJson,
      codeTemplate: codeTemplate is String? ? codeTemplate : this.codeTemplate,
      programmingLanguage: programmingLanguage is String?
          ? programmingLanguage
          : this.programmingLanguage,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      xpValue: xpValue ?? this.xpValue,
      fallbackHint: fallbackHint is String? ? fallbackHint : this.fallbackHint,
      fallbackExplanation: fallbackExplanation is String?
          ? fallbackExplanation
          : this.fallbackExplanation,
      topic: topic ?? this.topic,
    );
  }
}
