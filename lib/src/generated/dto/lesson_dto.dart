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

abstract class LessonDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LessonDto._({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.contentText,
    this.videoUrl,
    this.imageUrls,
    required this.orderIndex,
    required this.durationMinutes,
    required this.createdAt,
  });

  factory LessonDto({
    required int id,
    required int moduleId,
    required String title,
    required String contentText,
    String? videoUrl,
    String? imageUrls,
    required int orderIndex,
    required int durationMinutes,
    required DateTime createdAt,
  }) = _LessonDtoImpl;

  factory LessonDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return LessonDto(
      id: jsonSerialization['id'] as int,
      moduleId: jsonSerialization['moduleId'] as int,
      title: jsonSerialization['title'] as String,
      contentText: jsonSerialization['contentText'] as String,
      videoUrl: jsonSerialization['videoUrl'] as String?,
      imageUrls: jsonSerialization['imageUrls'] as String?,
      orderIndex: jsonSerialization['orderIndex'] as int,
      durationMinutes: jsonSerialization['durationMinutes'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  int id;

  int moduleId;

  String title;

  String contentText;

  String? videoUrl;

  String? imageUrls;

  int orderIndex;

  int durationMinutes;

  DateTime createdAt;

  /// Returns a shallow copy of this [LessonDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LessonDto copyWith({
    int? id,
    int? moduleId,
    String? title,
    String? contentText,
    String? videoUrl,
    String? imageUrls,
    int? orderIndex,
    int? durationMinutes,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LessonDto',
      'id': id,
      'moduleId': moduleId,
      'title': title,
      'contentText': contentText,
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls,
      'orderIndex': orderIndex,
      'durationMinutes': durationMinutes,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LessonDto',
      'id': id,
      'moduleId': moduleId,
      'title': title,
      'contentText': contentText,
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls,
      'orderIndex': orderIndex,
      'durationMinutes': durationMinutes,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LessonDtoImpl extends LessonDto {
  _LessonDtoImpl({
    required int id,
    required int moduleId,
    required String title,
    required String contentText,
    String? videoUrl,
    String? imageUrls,
    required int orderIndex,
    required int durationMinutes,
    required DateTime createdAt,
  }) : super._(
         id: id,
         moduleId: moduleId,
         title: title,
         contentText: contentText,
         videoUrl: videoUrl,
         imageUrls: imageUrls,
         orderIndex: orderIndex,
         durationMinutes: durationMinutes,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [LessonDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LessonDto copyWith({
    int? id,
    int? moduleId,
    String? title,
    String? contentText,
    Object? videoUrl = _Undefined,
    Object? imageUrls = _Undefined,
    int? orderIndex,
    int? durationMinutes,
    DateTime? createdAt,
  }) {
    return LessonDto(
      id: id ?? this.id,
      moduleId: moduleId ?? this.moduleId,
      title: title ?? this.title,
      contentText: contentText ?? this.contentText,
      videoUrl: videoUrl is String? ? videoUrl : this.videoUrl,
      imageUrls: imageUrls is String? ? imageUrls : this.imageUrls,
      orderIndex: orderIndex ?? this.orderIndex,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
