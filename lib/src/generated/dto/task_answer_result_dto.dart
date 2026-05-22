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
import '../dto/task_answer_test_case_result_dto.dart' as _i2;
import 'package:praxis_server/src/generated/protocol.dart' as _i3;

abstract class TaskAnswerResultDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TaskAnswerResultDto._({
    required this.isCorrect,
    required this.feedbackType,
    this.feedbackMessage,
    this.xpEarned,
    this.passedTestCases,
    this.totalTestCases,
    this.testCaseResults,
  });

  factory TaskAnswerResultDto({
    required bool isCorrect,
    required String feedbackType,
    String? feedbackMessage,
    int? xpEarned,
    int? passedTestCases,
    int? totalTestCases,
    List<_i2.TaskAnswerTestCaseResultDto>? testCaseResults,
  }) = _TaskAnswerResultDtoImpl;

  factory TaskAnswerResultDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return TaskAnswerResultDto(
      isCorrect: jsonSerialization['isCorrect'] as bool,
      feedbackType: jsonSerialization['feedbackType'] as String,
      feedbackMessage: jsonSerialization['feedbackMessage'] as String?,
      xpEarned: jsonSerialization['xpEarned'] as int?,
      passedTestCases: jsonSerialization['passedTestCases'] as int?,
      totalTestCases: jsonSerialization['totalTestCases'] as int?,
      testCaseResults: jsonSerialization['testCaseResults'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.TaskAnswerTestCaseResultDto>>(
              jsonSerialization['testCaseResults'],
            ),
    );
  }

  bool isCorrect;

  String feedbackType;

  String? feedbackMessage;

  int? xpEarned;

  int? passedTestCases;

  int? totalTestCases;

  List<_i2.TaskAnswerTestCaseResultDto>? testCaseResults;

  /// Returns a shallow copy of this [TaskAnswerResultDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskAnswerResultDto copyWith({
    bool? isCorrect,
    String? feedbackType,
    String? feedbackMessage,
    int? xpEarned,
    int? passedTestCases,
    int? totalTestCases,
    List<_i2.TaskAnswerTestCaseResultDto>? testCaseResults,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TaskAnswerResultDto',
      'isCorrect': isCorrect,
      'feedbackType': feedbackType,
      if (feedbackMessage != null) 'feedbackMessage': feedbackMessage,
      if (xpEarned != null) 'xpEarned': xpEarned,
      if (passedTestCases != null) 'passedTestCases': passedTestCases,
      if (totalTestCases != null) 'totalTestCases': totalTestCases,
      if (testCaseResults != null)
        'testCaseResults': testCaseResults?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TaskAnswerResultDto',
      'isCorrect': isCorrect,
      'feedbackType': feedbackType,
      if (feedbackMessage != null) 'feedbackMessage': feedbackMessage,
      if (xpEarned != null) 'xpEarned': xpEarned,
      if (passedTestCases != null) 'passedTestCases': passedTestCases,
      if (totalTestCases != null) 'totalTestCases': totalTestCases,
      if (testCaseResults != null)
        'testCaseResults': testCaseResults?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskAnswerResultDtoImpl extends TaskAnswerResultDto {
  _TaskAnswerResultDtoImpl({
    required bool isCorrect,
    required String feedbackType,
    String? feedbackMessage,
    int? xpEarned,
    int? passedTestCases,
    int? totalTestCases,
    List<_i2.TaskAnswerTestCaseResultDto>? testCaseResults,
  }) : super._(
         isCorrect: isCorrect,
         feedbackType: feedbackType,
         feedbackMessage: feedbackMessage,
         xpEarned: xpEarned,
         passedTestCases: passedTestCases,
         totalTestCases: totalTestCases,
         testCaseResults: testCaseResults,
       );

  /// Returns a shallow copy of this [TaskAnswerResultDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskAnswerResultDto copyWith({
    bool? isCorrect,
    String? feedbackType,
    Object? feedbackMessage = _Undefined,
    Object? xpEarned = _Undefined,
    Object? passedTestCases = _Undefined,
    Object? totalTestCases = _Undefined,
    Object? testCaseResults = _Undefined,
  }) {
    return TaskAnswerResultDto(
      isCorrect: isCorrect ?? this.isCorrect,
      feedbackType: feedbackType ?? this.feedbackType,
      feedbackMessage: feedbackMessage is String?
          ? feedbackMessage
          : this.feedbackMessage,
      xpEarned: xpEarned is int? ? xpEarned : this.xpEarned,
      passedTestCases: passedTestCases is int?
          ? passedTestCases
          : this.passedTestCases,
      totalTestCases: totalTestCases is int?
          ? totalTestCases
          : this.totalTestCases,
      testCaseResults: testCaseResults is List<_i2.TaskAnswerTestCaseResultDto>?
          ? testCaseResults
          : this.testCaseResults?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
