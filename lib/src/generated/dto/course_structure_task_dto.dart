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

abstract class CourseStructureTaskDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseStructureTaskDto._({
    required this.id,
    required this.taskType,
    required this.questionText,
    required this.orderIndex,
  });

  factory CourseStructureTaskDto({
    required int id,
    required String taskType,
    required String questionText,
    required int orderIndex,
  }) = _CourseStructureTaskDtoImpl;

  factory CourseStructureTaskDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CourseStructureTaskDto(
      id: jsonSerialization['id'] as int,
      taskType: jsonSerialization['taskType'] as String,
      questionText: jsonSerialization['questionText'] as String,
      orderIndex: jsonSerialization['orderIndex'] as int,
    );
  }

  int id;

  String taskType;

  String questionText;

  int orderIndex;

  /// Returns a shallow copy of this [CourseStructureTaskDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseStructureTaskDto copyWith({
    int? id,
    String? taskType,
    String? questionText,
    int? orderIndex,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseStructureTaskDto',
      'id': id,
      'taskType': taskType,
      'questionText': questionText,
      'orderIndex': orderIndex,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseStructureTaskDto',
      'id': id,
      'taskType': taskType,
      'questionText': questionText,
      'orderIndex': orderIndex,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CourseStructureTaskDtoImpl extends CourseStructureTaskDto {
  _CourseStructureTaskDtoImpl({
    required int id,
    required String taskType,
    required String questionText,
    required int orderIndex,
  }) : super._(
         id: id,
         taskType: taskType,
         questionText: questionText,
         orderIndex: orderIndex,
       );

  /// Returns a shallow copy of this [CourseStructureTaskDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseStructureTaskDto copyWith({
    int? id,
    String? taskType,
    String? questionText,
    int? orderIndex,
  }) {
    return CourseStructureTaskDto(
      id: id ?? this.id,
      taskType: taskType ?? this.taskType,
      questionText: questionText ?? this.questionText,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }
}
