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
import 'package:praxis_server/src/generated/protocol.dart' as _i3;

abstract class CreateLessonRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateLessonRequest._({
    required this.moduleId,
    required this.title,
    required this.contentText,
    this.contentDocument,
    this.videoUrl,
    this.imageUrls,
    this.durationMinutes,
    this.completionXp,
  });

  factory CreateLessonRequest({
    required int moduleId,
    required String title,
    required String contentText,
    _i2.LessonContentDocumentDto? contentDocument,
    String? videoUrl,
    String? imageUrls,
    int? durationMinutes,
    int? completionXp,
  }) = _CreateLessonRequestImpl;

  factory CreateLessonRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateLessonRequest(
      moduleId: jsonSerialization['moduleId'] as int,
      title: jsonSerialization['title'] as String,
      contentText: jsonSerialization['contentText'] as String,
      contentDocument: jsonSerialization['contentDocument'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.LessonContentDocumentDto>(
              jsonSerialization['contentDocument'],
            ),
      videoUrl: jsonSerialization['videoUrl'] as String?,
      imageUrls: jsonSerialization['imageUrls'] as String?,
      durationMinutes: jsonSerialization['durationMinutes'] as int?,
      completionXp: jsonSerialization['completionXp'] as int?,
    );
  }

  int moduleId;

  String title;

  String contentText;

  _i2.LessonContentDocumentDto? contentDocument;

  String? videoUrl;

  String? imageUrls;

  int? durationMinutes;

  int? completionXp;

  /// Returns a shallow copy of this [CreateLessonRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateLessonRequest copyWith({
    int? moduleId,
    String? title,
    String? contentText,
    _i2.LessonContentDocumentDto? contentDocument,
    String? videoUrl,
    String? imageUrls,
    int? durationMinutes,
    int? completionXp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateLessonRequest',
      'moduleId': moduleId,
      'title': title,
      'contentText': contentText,
      if (contentDocument != null) 'contentDocument': contentDocument?.toJson(),
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls,
      if (durationMinutes != null) 'durationMinutes': durationMinutes,
      if (completionXp != null) 'completionXp': completionXp,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreateLessonRequest',
      'moduleId': moduleId,
      'title': title,
      'contentText': contentText,
      if (contentDocument != null)
        'contentDocument': contentDocument?.toJsonForProtocol(),
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls,
      if (durationMinutes != null) 'durationMinutes': durationMinutes,
      if (completionXp != null) 'completionXp': completionXp,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateLessonRequestImpl extends CreateLessonRequest {
  _CreateLessonRequestImpl({
    required int moduleId,
    required String title,
    required String contentText,
    _i2.LessonContentDocumentDto? contentDocument,
    String? videoUrl,
    String? imageUrls,
    int? durationMinutes,
    int? completionXp,
  }) : super._(
         moduleId: moduleId,
         title: title,
         contentText: contentText,
         contentDocument: contentDocument,
         videoUrl: videoUrl,
         imageUrls: imageUrls,
         durationMinutes: durationMinutes,
         completionXp: completionXp,
       );

  /// Returns a shallow copy of this [CreateLessonRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateLessonRequest copyWith({
    int? moduleId,
    String? title,
    String? contentText,
    Object? contentDocument = _Undefined,
    Object? videoUrl = _Undefined,
    Object? imageUrls = _Undefined,
    Object? durationMinutes = _Undefined,
    Object? completionXp = _Undefined,
  }) {
    return CreateLessonRequest(
      moduleId: moduleId ?? this.moduleId,
      title: title ?? this.title,
      contentText: contentText ?? this.contentText,
      contentDocument: contentDocument is _i2.LessonContentDocumentDto?
          ? contentDocument
          : this.contentDocument?.copyWith(),
      videoUrl: videoUrl is String? ? videoUrl : this.videoUrl,
      imageUrls: imageUrls is String? ? imageUrls : this.imageUrls,
      durationMinutes: durationMinutes is int?
          ? durationMinutes
          : this.durationMinutes,
      completionXp: completionXp is int? ? completionXp : this.completionXp,
    );
  }
}
