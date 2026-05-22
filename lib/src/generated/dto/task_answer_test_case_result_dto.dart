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

abstract class TaskAnswerTestCaseResultDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TaskAnswerTestCaseResultDto._({
    required this.passed,
    required this.isHidden,
    this.input,
    this.expectedOutput,
    this.actualOutput,
    this.message,
  });

  factory TaskAnswerTestCaseResultDto({
    required bool passed,
    required bool isHidden,
    String? input,
    String? expectedOutput,
    String? actualOutput,
    String? message,
  }) = _TaskAnswerTestCaseResultDtoImpl;

  factory TaskAnswerTestCaseResultDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TaskAnswerTestCaseResultDto(
      passed: jsonSerialization['passed'] as bool,
      isHidden: jsonSerialization['isHidden'] as bool,
      input: jsonSerialization['input'] as String?,
      expectedOutput: jsonSerialization['expectedOutput'] as String?,
      actualOutput: jsonSerialization['actualOutput'] as String?,
      message: jsonSerialization['message'] as String?,
    );
  }

  bool passed;

  bool isHidden;

  String? input;

  String? expectedOutput;

  String? actualOutput;

  String? message;

  /// Returns a shallow copy of this [TaskAnswerTestCaseResultDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskAnswerTestCaseResultDto copyWith({
    bool? passed,
    bool? isHidden,
    String? input,
    String? expectedOutput,
    String? actualOutput,
    String? message,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TaskAnswerTestCaseResultDto',
      'passed': passed,
      'isHidden': isHidden,
      if (input != null) 'input': input,
      if (expectedOutput != null) 'expectedOutput': expectedOutput,
      if (actualOutput != null) 'actualOutput': actualOutput,
      if (message != null) 'message': message,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TaskAnswerTestCaseResultDto',
      'passed': passed,
      'isHidden': isHidden,
      if (input != null) 'input': input,
      if (expectedOutput != null) 'expectedOutput': expectedOutput,
      if (actualOutput != null) 'actualOutput': actualOutput,
      if (message != null) 'message': message,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskAnswerTestCaseResultDtoImpl extends TaskAnswerTestCaseResultDto {
  _TaskAnswerTestCaseResultDtoImpl({
    required bool passed,
    required bool isHidden,
    String? input,
    String? expectedOutput,
    String? actualOutput,
    String? message,
  }) : super._(
         passed: passed,
         isHidden: isHidden,
         input: input,
         expectedOutput: expectedOutput,
         actualOutput: actualOutput,
         message: message,
       );

  /// Returns a shallow copy of this [TaskAnswerTestCaseResultDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskAnswerTestCaseResultDto copyWith({
    bool? passed,
    bool? isHidden,
    Object? input = _Undefined,
    Object? expectedOutput = _Undefined,
    Object? actualOutput = _Undefined,
    Object? message = _Undefined,
  }) {
    return TaskAnswerTestCaseResultDto(
      passed: passed ?? this.passed,
      isHidden: isHidden ?? this.isHidden,
      input: input is String? ? input : this.input,
      expectedOutput: expectedOutput is String?
          ? expectedOutput
          : this.expectedOutput,
      actualOutput: actualOutput is String? ? actualOutput : this.actualOutput,
      message: message is String? ? message : this.message,
    );
  }
}
