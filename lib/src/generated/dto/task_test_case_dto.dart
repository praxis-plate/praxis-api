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

abstract class TaskTestCaseDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TaskTestCaseDto._({
    required this.id,
    required this.taskId,
    required this.input,
    required this.expectedOutput,
    required this.isHidden,
    required this.orderIndex,
  });

  factory TaskTestCaseDto({
    required int id,
    required int taskId,
    required String input,
    required String expectedOutput,
    required bool isHidden,
    required int orderIndex,
  }) = _TaskTestCaseDtoImpl;

  factory TaskTestCaseDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return TaskTestCaseDto(
      id: jsonSerialization['id'] as int,
      taskId: jsonSerialization['taskId'] as int,
      input: jsonSerialization['input'] as String,
      expectedOutput: jsonSerialization['expectedOutput'] as String,
      isHidden: jsonSerialization['isHidden'] as bool,
      orderIndex: jsonSerialization['orderIndex'] as int,
    );
  }

  int id;

  int taskId;

  String input;

  String expectedOutput;

  bool isHidden;

  int orderIndex;

  /// Returns a shallow copy of this [TaskTestCaseDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskTestCaseDto copyWith({
    int? id,
    int? taskId,
    String? input,
    String? expectedOutput,
    bool? isHidden,
    int? orderIndex,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TaskTestCaseDto',
      'id': id,
      'taskId': taskId,
      'input': input,
      'expectedOutput': expectedOutput,
      'isHidden': isHidden,
      'orderIndex': orderIndex,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TaskTestCaseDto',
      'id': id,
      'taskId': taskId,
      'input': input,
      'expectedOutput': expectedOutput,
      'isHidden': isHidden,
      'orderIndex': orderIndex,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TaskTestCaseDtoImpl extends TaskTestCaseDto {
  _TaskTestCaseDtoImpl({
    required int id,
    required int taskId,
    required String input,
    required String expectedOutput,
    required bool isHidden,
    required int orderIndex,
  }) : super._(
         id: id,
         taskId: taskId,
         input: input,
         expectedOutput: expectedOutput,
         isHidden: isHidden,
         orderIndex: orderIndex,
       );

  /// Returns a shallow copy of this [TaskTestCaseDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskTestCaseDto copyWith({
    int? id,
    int? taskId,
    String? input,
    String? expectedOutput,
    bool? isHidden,
    int? orderIndex,
  }) {
    return TaskTestCaseDto(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      input: input ?? this.input,
      expectedOutput: expectedOutput ?? this.expectedOutput,
      isHidden: isHidden ?? this.isHidden,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }
}
