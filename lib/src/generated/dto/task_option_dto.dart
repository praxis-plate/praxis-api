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

abstract class TaskOptionDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TaskOptionDto._({
    required this.id,
    required this.taskId,
    required this.optionText,
    required this.isCorrect,
    required this.orderIndex,
  });

  factory TaskOptionDto({
    required int id,
    required int taskId,
    required String optionText,
    required bool isCorrect,
    required int orderIndex,
  }) = _TaskOptionDtoImpl;

  factory TaskOptionDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return TaskOptionDto(
      id: jsonSerialization['id'] as int,
      taskId: jsonSerialization['taskId'] as int,
      optionText: jsonSerialization['optionText'] as String,
      isCorrect: jsonSerialization['isCorrect'] as bool,
      orderIndex: jsonSerialization['orderIndex'] as int,
    );
  }

  int id;

  int taskId;

  String optionText;

  bool isCorrect;

  int orderIndex;

  /// Returns a shallow copy of this [TaskOptionDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskOptionDto copyWith({
    int? id,
    int? taskId,
    String? optionText,
    bool? isCorrect,
    int? orderIndex,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TaskOptionDto',
      'id': id,
      'taskId': taskId,
      'optionText': optionText,
      'isCorrect': isCorrect,
      'orderIndex': orderIndex,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TaskOptionDto',
      'id': id,
      'taskId': taskId,
      'optionText': optionText,
      'isCorrect': isCorrect,
      'orderIndex': orderIndex,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TaskOptionDtoImpl extends TaskOptionDto {
  _TaskOptionDtoImpl({
    required int id,
    required int taskId,
    required String optionText,
    required bool isCorrect,
    required int orderIndex,
  }) : super._(
         id: id,
         taskId: taskId,
         optionText: optionText,
         isCorrect: isCorrect,
         orderIndex: orderIndex,
       );

  /// Returns a shallow copy of this [TaskOptionDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskOptionDto copyWith({
    int? id,
    int? taskId,
    String? optionText,
    bool? isCorrect,
    int? orderIndex,
  }) {
    return TaskOptionDto(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      optionText: optionText ?? this.optionText,
      isCorrect: isCorrect ?? this.isCorrect,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }
}
