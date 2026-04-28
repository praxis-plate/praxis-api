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

abstract class LessonDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LessonDto._({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.contentText,
    this.contentDocument,
    this.videoUrl,
    this.imageUrls,
    required this.orderIndex,
    required this.durationMinutes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LessonDto({
    required int id,
    required int moduleId,
    required String title,
    required String contentText,
    _i2.LessonContentDocumentDto? contentDocument,
    String? videoUrl,
    String? imageUrls,
    required int orderIndex,
    required int durationMinutes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _LessonDtoImpl;

  factory LessonDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return LessonDto(
      id: jsonSerialization['id'] as int,
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
      orderIndex: jsonSerialization['orderIndex'] as int,
      durationMinutes: jsonSerialization['durationMinutes'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  int id;

  int moduleId;

  String title;

  String contentText;

  _i2.LessonContentDocumentDto? contentDocument;

  String? videoUrl;

  String? imageUrls;

  int orderIndex;

  int durationMinutes;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [LessonDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LessonDto copyWith({
    int? id,
    int? moduleId,
    String? title,
    String? contentText,
    _i2.LessonContentDocumentDto? contentDocument,
    String? videoUrl,
    String? imageUrls,
    int? orderIndex,
    int? durationMinutes,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LessonDto',
      'id': id,
      'moduleId': moduleId,
      'title': title,
      'contentText': contentText,
      if (contentDocument != null) 'contentDocument': contentDocument?.toJson(),
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls,
      'orderIndex': orderIndex,
      'durationMinutes': durationMinutes,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
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
      if (contentDocument != null)
        'contentDocument': contentDocument?.toJsonForProtocol(),
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls,
      'orderIndex': orderIndex,
      'durationMinutes': durationMinutes,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
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
    _i2.LessonContentDocumentDto? contentDocument,
    String? videoUrl,
    String? imageUrls,
    required int orderIndex,
    required int durationMinutes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         moduleId: moduleId,
         title: title,
         contentText: contentText,
         contentDocument: contentDocument,
         videoUrl: videoUrl,
         imageUrls: imageUrls,
         orderIndex: orderIndex,
         durationMinutes: durationMinutes,
         createdAt: createdAt,
         updatedAt: updatedAt,
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
    Object? contentDocument = _Undefined,
    Object? videoUrl = _Undefined,
    Object? imageUrls = _Undefined,
    int? orderIndex,
    int? durationMinutes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LessonDto(
      id: id ?? this.id,
      moduleId: moduleId ?? this.moduleId,
      title: title ?? this.title,
      contentText: contentText ?? this.contentText,
      contentDocument: contentDocument is _i2.LessonContentDocumentDto?
          ? contentDocument
          : this.contentDocument?.copyWith(),
      videoUrl: videoUrl is String? ? videoUrl : this.videoUrl,
      imageUrls: imageUrls is String? ? imageUrls : this.imageUrls,
      orderIndex: orderIndex ?? this.orderIndex,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
