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
import '../dto/task_option_dto.dart' as _i3;
import '../dto/task_test_case_dto.dart' as _i4;
import 'package:praxis_server/src/generated/protocol.dart' as _i5;

abstract class TaskDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TaskDto._({
    required this.id,
    required this.lessonId,
    required this.taskType,
    required this.questionText,
    required this.correctAnswer,
    this.optionsJson,
    this.codeTemplate,
    this.testCasesJson,
    this.programmingLanguage,
    required this.difficultyLevel,
    required this.xpValue,
    required this.orderIndex,
    this.fallbackHint,
    this.fallbackExplanation,
    required this.topic,
    required this.createdAt,
    required this.updatedAt,
    required this.options,
    required this.testCases,
  });

  factory TaskDto({
    required int id,
    required int lessonId,
    required _i2.TaskType taskType,
    required String questionText,
    required String correctAnswer,
    String? optionsJson,
    String? codeTemplate,
    String? testCasesJson,
    String? programmingLanguage,
    required int difficultyLevel,
    required int xpValue,
    required int orderIndex,
    String? fallbackHint,
    String? fallbackExplanation,
    required String topic,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<_i3.TaskOptionDto> options,
    required List<_i4.TaskTestCaseDto> testCases,
  }) = _TaskDtoImpl;

  factory TaskDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return TaskDto(
      id: jsonSerialization['id'] as int,
      lessonId: jsonSerialization['lessonId'] as int,
      taskType: _i2.TaskType.fromJson(
        (jsonSerialization['taskType'] as String),
      ),
      questionText: jsonSerialization['questionText'] as String,
      correctAnswer: jsonSerialization['correctAnswer'] as String,
      optionsJson: jsonSerialization['optionsJson'] as String?,
      codeTemplate: jsonSerialization['codeTemplate'] as String?,
      testCasesJson: jsonSerialization['testCasesJson'] as String?,
      programmingLanguage: jsonSerialization['programmingLanguage'] as String?,
      difficultyLevel: jsonSerialization['difficultyLevel'] as int,
      xpValue: jsonSerialization['xpValue'] as int,
      orderIndex: jsonSerialization['orderIndex'] as int,
      fallbackHint: jsonSerialization['fallbackHint'] as String?,
      fallbackExplanation: jsonSerialization['fallbackExplanation'] as String?,
      topic: jsonSerialization['topic'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      options: _i5.Protocol().deserialize<List<_i3.TaskOptionDto>>(
        jsonSerialization['options'],
      ),
      testCases: _i5.Protocol().deserialize<List<_i4.TaskTestCaseDto>>(
        jsonSerialization['testCases'],
      ),
    );
  }

  int id;

  int lessonId;

  _i2.TaskType taskType;

  String questionText;

  String correctAnswer;

  String? optionsJson;

  String? codeTemplate;

  String? testCasesJson;

  String? programmingLanguage;

  int difficultyLevel;

  int xpValue;

  int orderIndex;

  String? fallbackHint;

  String? fallbackExplanation;

  String topic;

  DateTime createdAt;

  DateTime updatedAt;

  List<_i3.TaskOptionDto> options;

  List<_i4.TaskTestCaseDto> testCases;

  /// Returns a shallow copy of this [TaskDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskDto copyWith({
    int? id,
    int? lessonId,
    _i2.TaskType? taskType,
    String? questionText,
    String? correctAnswer,
    String? optionsJson,
    String? codeTemplate,
    String? testCasesJson,
    String? programmingLanguage,
    int? difficultyLevel,
    int? xpValue,
    int? orderIndex,
    String? fallbackHint,
    String? fallbackExplanation,
    String? topic,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i3.TaskOptionDto>? options,
    List<_i4.TaskTestCaseDto>? testCases,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TaskDto',
      'id': id,
      'lessonId': lessonId,
      'taskType': taskType.toJson(),
      'questionText': questionText,
      'correctAnswer': correctAnswer,
      if (optionsJson != null) 'optionsJson': optionsJson,
      if (codeTemplate != null) 'codeTemplate': codeTemplate,
      if (testCasesJson != null) 'testCasesJson': testCasesJson,
      if (programmingLanguage != null)
        'programmingLanguage': programmingLanguage,
      'difficultyLevel': difficultyLevel,
      'xpValue': xpValue,
      'orderIndex': orderIndex,
      if (fallbackHint != null) 'fallbackHint': fallbackHint,
      if (fallbackExplanation != null)
        'fallbackExplanation': fallbackExplanation,
      'topic': topic,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'options': options.toJson(valueToJson: (v) => v.toJson()),
      'testCases': testCases.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TaskDto',
      'id': id,
      'lessonId': lessonId,
      'taskType': taskType.toJson(),
      'questionText': questionText,
      'correctAnswer': correctAnswer,
      if (optionsJson != null) 'optionsJson': optionsJson,
      if (codeTemplate != null) 'codeTemplate': codeTemplate,
      if (testCasesJson != null) 'testCasesJson': testCasesJson,
      if (programmingLanguage != null)
        'programmingLanguage': programmingLanguage,
      'difficultyLevel': difficultyLevel,
      'xpValue': xpValue,
      'orderIndex': orderIndex,
      if (fallbackHint != null) 'fallbackHint': fallbackHint,
      if (fallbackExplanation != null)
        'fallbackExplanation': fallbackExplanation,
      'topic': topic,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'options': options.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'testCases': testCases.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskDtoImpl extends TaskDto {
  _TaskDtoImpl({
    required int id,
    required int lessonId,
    required _i2.TaskType taskType,
    required String questionText,
    required String correctAnswer,
    String? optionsJson,
    String? codeTemplate,
    String? testCasesJson,
    String? programmingLanguage,
    required int difficultyLevel,
    required int xpValue,
    required int orderIndex,
    String? fallbackHint,
    String? fallbackExplanation,
    required String topic,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<_i3.TaskOptionDto> options,
    required List<_i4.TaskTestCaseDto> testCases,
  }) : super._(
         id: id,
         lessonId: lessonId,
         taskType: taskType,
         questionText: questionText,
         correctAnswer: correctAnswer,
         optionsJson: optionsJson,
         codeTemplate: codeTemplate,
         testCasesJson: testCasesJson,
         programmingLanguage: programmingLanguage,
         difficultyLevel: difficultyLevel,
         xpValue: xpValue,
         orderIndex: orderIndex,
         fallbackHint: fallbackHint,
         fallbackExplanation: fallbackExplanation,
         topic: topic,
         createdAt: createdAt,
         updatedAt: updatedAt,
         options: options,
         testCases: testCases,
       );

  /// Returns a shallow copy of this [TaskDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskDto copyWith({
    int? id,
    int? lessonId,
    _i2.TaskType? taskType,
    String? questionText,
    String? correctAnswer,
    Object? optionsJson = _Undefined,
    Object? codeTemplate = _Undefined,
    Object? testCasesJson = _Undefined,
    Object? programmingLanguage = _Undefined,
    int? difficultyLevel,
    int? xpValue,
    int? orderIndex,
    Object? fallbackHint = _Undefined,
    Object? fallbackExplanation = _Undefined,
    String? topic,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i3.TaskOptionDto>? options,
    List<_i4.TaskTestCaseDto>? testCases,
  }) {
    return TaskDto(
      id: id ?? this.id,
      lessonId: lessonId ?? this.lessonId,
      taskType: taskType ?? this.taskType,
      questionText: questionText ?? this.questionText,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      optionsJson: optionsJson is String? ? optionsJson : this.optionsJson,
      codeTemplate: codeTemplate is String? ? codeTemplate : this.codeTemplate,
      testCasesJson: testCasesJson is String?
          ? testCasesJson
          : this.testCasesJson,
      programmingLanguage: programmingLanguage is String?
          ? programmingLanguage
          : this.programmingLanguage,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      xpValue: xpValue ?? this.xpValue,
      orderIndex: orderIndex ?? this.orderIndex,
      fallbackHint: fallbackHint is String? ? fallbackHint : this.fallbackHint,
      fallbackExplanation: fallbackExplanation is String?
          ? fallbackExplanation
          : this.fallbackExplanation,
      topic: topic ?? this.topic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      options: options ?? this.options.map((e0) => e0.copyWith()).toList(),
      testCases:
          testCases ?? this.testCases.map((e0) => e0.copyWith()).toList(),
    );
  }
}
