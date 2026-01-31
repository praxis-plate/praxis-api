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
import '../dto/course_structure_module_dto.dart' as _i2;
import 'package:praxis_server/src/generated/protocol.dart' as _i3;

abstract class CourseStructureDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseStructureDto._({
    required this.courseId,
    required this.title,
    required this.modules,
  });

  factory CourseStructureDto({
    required int courseId,
    required String title,
    required List<_i2.CourseStructureModuleDto> modules,
  }) = _CourseStructureDtoImpl;

  factory CourseStructureDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CourseStructureDto(
      courseId: jsonSerialization['courseId'] as int,
      title: jsonSerialization['title'] as String,
      modules: _i3.Protocol().deserialize<List<_i2.CourseStructureModuleDto>>(
        jsonSerialization['modules'],
      ),
    );
  }

  int courseId;

  String title;

  List<_i2.CourseStructureModuleDto> modules;

  /// Returns a shallow copy of this [CourseStructureDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseStructureDto copyWith({
    int? courseId,
    String? title,
    List<_i2.CourseStructureModuleDto>? modules,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseStructureDto',
      'courseId': courseId,
      'title': title,
      'modules': modules.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseStructureDto',
      'courseId': courseId,
      'title': title,
      'modules': modules.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CourseStructureDtoImpl extends CourseStructureDto {
  _CourseStructureDtoImpl({
    required int courseId,
    required String title,
    required List<_i2.CourseStructureModuleDto> modules,
  }) : super._(
         courseId: courseId,
         title: title,
         modules: modules,
       );

  /// Returns a shallow copy of this [CourseStructureDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseStructureDto copyWith({
    int? courseId,
    String? title,
    List<_i2.CourseStructureModuleDto>? modules,
  }) {
    return CourseStructureDto(
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      modules: modules ?? this.modules.map((e0) => e0.copyWith()).toList(),
    );
  }
}
