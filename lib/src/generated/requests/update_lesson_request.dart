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

abstract class UpdateLessonRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UpdateLessonRequest._({
    required this.id,
    required this.title,
    required this.contentText,
    this.videoUrl,
    this.imageUrls,
    required this.durationMinutes,
  });

  factory UpdateLessonRequest({
    required int id,
    required String title,
    required String contentText,
    String? videoUrl,
    String? imageUrls,
    required int durationMinutes,
  }) = _UpdateLessonRequestImpl;

  factory UpdateLessonRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return UpdateLessonRequest(
      id: jsonSerialization['id'] as int,
      title: jsonSerialization['title'] as String,
      contentText: jsonSerialization['contentText'] as String,
      videoUrl: jsonSerialization['videoUrl'] as String?,
      imageUrls: jsonSerialization['imageUrls'] as String?,
      durationMinutes: jsonSerialization['durationMinutes'] as int,
    );
  }

  int id;

  String title;

  String contentText;

  String? videoUrl;

  String? imageUrls;

  int durationMinutes;

  /// Returns a shallow copy of this [UpdateLessonRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateLessonRequest copyWith({
    int? id,
    String? title,
    String? contentText,
    String? videoUrl,
    String? imageUrls,
    int? durationMinutes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateLessonRequest',
      'id': id,
      'title': title,
      'contentText': contentText,
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls,
      'durationMinutes': durationMinutes,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UpdateLessonRequest',
      'id': id,
      'title': title,
      'contentText': contentText,
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls,
      'durationMinutes': durationMinutes,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UpdateLessonRequestImpl extends UpdateLessonRequest {
  _UpdateLessonRequestImpl({
    required int id,
    required String title,
    required String contentText,
    String? videoUrl,
    String? imageUrls,
    required int durationMinutes,
  }) : super._(
         id: id,
         title: title,
         contentText: contentText,
         videoUrl: videoUrl,
         imageUrls: imageUrls,
         durationMinutes: durationMinutes,
       );

  /// Returns a shallow copy of this [UpdateLessonRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateLessonRequest copyWith({
    int? id,
    String? title,
    String? contentText,
    Object? videoUrl = _Undefined,
    Object? imageUrls = _Undefined,
    int? durationMinutes,
  }) {
    return UpdateLessonRequest(
      id: id ?? this.id,
      title: title ?? this.title,
      contentText: contentText ?? this.contentText,
      videoUrl: videoUrl is String? ? videoUrl : this.videoUrl,
      imageUrls: imageUrls is String? ? imageUrls : this.imageUrls,
      durationMinutes: durationMinutes ?? this.durationMinutes,
    );
  }
}
