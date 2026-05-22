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
import '../enums/lesson_content_block_type.dart' as _i2;

abstract class LessonContentBlockDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LessonContentBlockDto._({
    required this.type,
    this.text,
    this.level,
    this.language,
    this.url,
    this.caption,
  });

  factory LessonContentBlockDto({
    required _i2.LessonContentBlockType type,
    String? text,
    int? level,
    String? language,
    String? url,
    String? caption,
  }) = _LessonContentBlockDtoImpl;

  factory LessonContentBlockDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return LessonContentBlockDto(
      type: _i2.LessonContentBlockType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      text: jsonSerialization['text'] as String?,
      level: jsonSerialization['level'] as int?,
      language: jsonSerialization['language'] as String?,
      url: jsonSerialization['url'] as String?,
      caption: jsonSerialization['caption'] as String?,
    );
  }

  _i2.LessonContentBlockType type;

  String? text;

  int? level;

  String? language;

  String? url;

  String? caption;

  /// Returns a shallow copy of this [LessonContentBlockDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LessonContentBlockDto copyWith({
    _i2.LessonContentBlockType? type,
    String? text,
    int? level,
    String? language,
    String? url,
    String? caption,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LessonContentBlockDto',
      'type': type.toJson(),
      if (text != null) 'text': text,
      if (level != null) 'level': level,
      if (language != null) 'language': language,
      if (url != null) 'url': url,
      if (caption != null) 'caption': caption,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LessonContentBlockDto',
      'type': type.toJson(),
      if (text != null) 'text': text,
      if (level != null) 'level': level,
      if (language != null) 'language': language,
      if (url != null) 'url': url,
      if (caption != null) 'caption': caption,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LessonContentBlockDtoImpl extends LessonContentBlockDto {
  _LessonContentBlockDtoImpl({
    required _i2.LessonContentBlockType type,
    String? text,
    int? level,
    String? language,
    String? url,
    String? caption,
  }) : super._(
         type: type,
         text: text,
         level: level,
         language: language,
         url: url,
         caption: caption,
       );

  /// Returns a shallow copy of this [LessonContentBlockDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LessonContentBlockDto copyWith({
    _i2.LessonContentBlockType? type,
    Object? text = _Undefined,
    Object? level = _Undefined,
    Object? language = _Undefined,
    Object? url = _Undefined,
    Object? caption = _Undefined,
  }) {
    return LessonContentBlockDto(
      type: type ?? this.type,
      text: text is String? ? text : this.text,
      level: level is int? ? level : this.level,
      language: language is String? ? language : this.language,
      url: url is String? ? url : this.url,
      caption: caption is String? ? caption : this.caption,
    );
  }
}
