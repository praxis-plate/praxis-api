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
import '../dto/lesson_content_document_dto.dart' as _i2;
import '../dto/course_import_task_dto.dart' as _i3;
import 'package:praxis_server/src/generated/protocol.dart' as _i4;

abstract class CourseImportLessonDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseImportLessonDto._({
    required this.title,
    this.contentText,
    this.contentDocument,
    this.videoUrl,
    this.imageUrls,
    this.completionXp,
    this.tasks,
  });

  factory CourseImportLessonDto({
    required String title,
    String? contentText,
    _i2.LessonContentDocumentDto? contentDocument,
    String? videoUrl,
    List<String>? imageUrls,
    int? completionXp,
    List<_i3.CourseImportTaskDto>? tasks,
  }) = _CourseImportLessonDtoImpl;

  factory CourseImportLessonDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CourseImportLessonDto(
      title: jsonSerialization['title'] as String,
      contentText: jsonSerialization['contentText'] as String?,
      contentDocument: jsonSerialization['contentDocument'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.LessonContentDocumentDto>(
              jsonSerialization['contentDocument'],
            ),
      videoUrl: jsonSerialization['videoUrl'] as String?,
      imageUrls: jsonSerialization['imageUrls'] == null
          ? null
          : _i4.Protocol().deserialize<List<String>>(
              jsonSerialization['imageUrls'],
            ),
      completionXp: jsonSerialization['completionXp'] as int?,
      tasks: jsonSerialization['tasks'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.CourseImportTaskDto>>(
              jsonSerialization['tasks'],
            ),
    );
  }

  String title;

  String? contentText;

  _i2.LessonContentDocumentDto? contentDocument;

  String? videoUrl;

  List<String>? imageUrls;

  int? completionXp;

  List<_i3.CourseImportTaskDto>? tasks;

  /// Returns a shallow copy of this [CourseImportLessonDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseImportLessonDto copyWith({
    String? title,
    String? contentText,
    _i2.LessonContentDocumentDto? contentDocument,
    String? videoUrl,
    List<String>? imageUrls,
    int? completionXp,
    List<_i3.CourseImportTaskDto>? tasks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseImportLessonDto',
      'title': title,
      if (contentText != null) 'contentText': contentText,
      if (contentDocument != null) 'contentDocument': contentDocument?.toJson(),
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls?.toJson(),
      if (completionXp != null) 'completionXp': completionXp,
      if (tasks != null) 'tasks': tasks?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseImportLessonDto',
      'title': title,
      if (contentText != null) 'contentText': contentText,
      if (contentDocument != null)
        'contentDocument': contentDocument?.toJsonForProtocol(),
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls?.toJson(),
      if (completionXp != null) 'completionXp': completionXp,
      if (tasks != null)
        'tasks': tasks?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseImportLessonDtoImpl extends CourseImportLessonDto {
  _CourseImportLessonDtoImpl({
    required String title,
    String? contentText,
    _i2.LessonContentDocumentDto? contentDocument,
    String? videoUrl,
    List<String>? imageUrls,
    int? completionXp,
    List<_i3.CourseImportTaskDto>? tasks,
  }) : super._(
         title: title,
         contentText: contentText,
         contentDocument: contentDocument,
         videoUrl: videoUrl,
         imageUrls: imageUrls,
         completionXp: completionXp,
         tasks: tasks,
       );

  /// Returns a shallow copy of this [CourseImportLessonDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseImportLessonDto copyWith({
    String? title,
    Object? contentText = _Undefined,
    Object? contentDocument = _Undefined,
    Object? videoUrl = _Undefined,
    Object? imageUrls = _Undefined,
    Object? completionXp = _Undefined,
    Object? tasks = _Undefined,
  }) {
    return CourseImportLessonDto(
      title: title ?? this.title,
      contentText: contentText is String? ? contentText : this.contentText,
      contentDocument: contentDocument is _i2.LessonContentDocumentDto?
          ? contentDocument
          : this.contentDocument?.copyWith(),
      videoUrl: videoUrl is String? ? videoUrl : this.videoUrl,
      imageUrls: imageUrls is List<String>?
          ? imageUrls
          : this.imageUrls?.map((e0) => e0).toList(),
      completionXp: completionXp is int? ? completionXp : this.completionXp,
      tasks: tasks is List<_i3.CourseImportTaskDto>?
          ? tasks
          : this.tasks?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
