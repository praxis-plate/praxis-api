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
import '../dto/course_import_lesson_dto.dart' as _i2;
import 'package:praxis_server/src/generated/protocol.dart' as _i3;

abstract class CourseImportModuleDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseImportModuleDto._({
    required this.title,
    this.description,
    this.lessons,
  });

  factory CourseImportModuleDto({
    required String title,
    String? description,
    List<_i2.CourseImportLessonDto>? lessons,
  }) = _CourseImportModuleDtoImpl;

  factory CourseImportModuleDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CourseImportModuleDto(
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String?,
      lessons: jsonSerialization['lessons'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.CourseImportLessonDto>>(
              jsonSerialization['lessons'],
            ),
    );
  }

  String title;

  String? description;

  List<_i2.CourseImportLessonDto>? lessons;

  /// Returns a shallow copy of this [CourseImportModuleDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseImportModuleDto copyWith({
    String? title,
    String? description,
    List<_i2.CourseImportLessonDto>? lessons,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseImportModuleDto',
      'title': title,
      if (description != null) 'description': description,
      if (lessons != null)
        'lessons': lessons?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseImportModuleDto',
      'title': title,
      if (description != null) 'description': description,
      if (lessons != null)
        'lessons': lessons?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseImportModuleDtoImpl extends CourseImportModuleDto {
  _CourseImportModuleDtoImpl({
    required String title,
    String? description,
    List<_i2.CourseImportLessonDto>? lessons,
  }) : super._(
         title: title,
         description: description,
         lessons: lessons,
       );

  /// Returns a shallow copy of this [CourseImportModuleDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseImportModuleDto copyWith({
    String? title,
    Object? description = _Undefined,
    Object? lessons = _Undefined,
  }) {
    return CourseImportModuleDto(
      title: title ?? this.title,
      description: description is String? ? description : this.description,
      lessons: lessons is List<_i2.CourseImportLessonDto>?
          ? lessons
          : this.lessons?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
