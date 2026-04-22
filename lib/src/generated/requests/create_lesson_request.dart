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

abstract class CreateLessonRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateLessonRequest._({
    required this.moduleId,
    required this.title,
    required this.contentText,
    this.videoUrl,
    this.imageUrls,
    this.durationMinutes,
  });

  factory CreateLessonRequest({
    required int moduleId,
    required String title,
    required String contentText,
    String? videoUrl,
    String? imageUrls,
    int? durationMinutes,
  }) = _CreateLessonRequestImpl;

  factory CreateLessonRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateLessonRequest(
      moduleId: jsonSerialization['moduleId'] as int,
      title: jsonSerialization['title'] as String,
      contentText: jsonSerialization['contentText'] as String,
      videoUrl: jsonSerialization['videoUrl'] as String?,
      imageUrls: jsonSerialization['imageUrls'] as String?,
      durationMinutes: jsonSerialization['durationMinutes'] as int?,
    );
  }

  int moduleId;

  String title;

  String contentText;

  String? videoUrl;

  String? imageUrls;

  int? durationMinutes;

  /// Returns a shallow copy of this [CreateLessonRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateLessonRequest copyWith({
    int? moduleId,
    String? title,
    String? contentText,
    String? videoUrl,
    String? imageUrls,
    int? durationMinutes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateLessonRequest',
      'moduleId': moduleId,
      'title': title,
      'contentText': contentText,
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls,
      if (durationMinutes != null) 'durationMinutes': durationMinutes,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreateLessonRequest',
      'moduleId': moduleId,
      'title': title,
      'contentText': contentText,
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls,
      if (durationMinutes != null) 'durationMinutes': durationMinutes,
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
    String? videoUrl,
    String? imageUrls,
    int? durationMinutes,
  }) : super._(
         moduleId: moduleId,
         title: title,
         contentText: contentText,
         videoUrl: videoUrl,
         imageUrls: imageUrls,
         durationMinutes: durationMinutes,
       );

  /// Returns a shallow copy of this [CreateLessonRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateLessonRequest copyWith({
    int? moduleId,
    String? title,
    String? contentText,
    Object? videoUrl = _Undefined,
    Object? imageUrls = _Undefined,
    Object? durationMinutes = _Undefined,
  }) {
    return CreateLessonRequest(
      moduleId: moduleId ?? this.moduleId,
      title: title ?? this.title,
      contentText: contentText ?? this.contentText,
      videoUrl: videoUrl is String? ? videoUrl : this.videoUrl,
      imageUrls: imageUrls is String? ? imageUrls : this.imageUrls,
      durationMinutes: durationMinutes is int?
          ? durationMinutes
          : this.durationMinutes,
    );
  }
}
