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
import '../dto/lesson_content_block_dto.dart' as _i2;
import 'package:praxis_server/src/generated/protocol.dart' as _i3;

abstract class LessonContentDocumentDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LessonContentDocumentDto._({
    required this.schemaVersion,
    required this.blocks,
  });

  factory LessonContentDocumentDto({
    required int schemaVersion,
    required List<_i2.LessonContentBlockDto> blocks,
  }) = _LessonContentDocumentDtoImpl;

  factory LessonContentDocumentDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return LessonContentDocumentDto(
      schemaVersion: jsonSerialization['schemaVersion'] as int,
      blocks: _i3.Protocol().deserialize<List<_i2.LessonContentBlockDto>>(
        jsonSerialization['blocks'],
      ),
    );
  }

  int schemaVersion;

  List<_i2.LessonContentBlockDto> blocks;

  /// Returns a shallow copy of this [LessonContentDocumentDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LessonContentDocumentDto copyWith({
    int? schemaVersion,
    List<_i2.LessonContentBlockDto>? blocks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LessonContentDocumentDto',
      'schemaVersion': schemaVersion,
      'blocks': blocks.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LessonContentDocumentDto',
      'schemaVersion': schemaVersion,
      'blocks': blocks.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LessonContentDocumentDtoImpl extends LessonContentDocumentDto {
  _LessonContentDocumentDtoImpl({
    required int schemaVersion,
    required List<_i2.LessonContentBlockDto> blocks,
  }) : super._(
         schemaVersion: schemaVersion,
         blocks: blocks,
       );

  /// Returns a shallow copy of this [LessonContentDocumentDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LessonContentDocumentDto copyWith({
    int? schemaVersion,
    List<_i2.LessonContentBlockDto>? blocks,
  }) {
    return LessonContentDocumentDto(
      schemaVersion: schemaVersion ?? this.schemaVersion,
      blocks: blocks ?? this.blocks.map((e0) => e0.copyWith()).toList(),
    );
  }
}
