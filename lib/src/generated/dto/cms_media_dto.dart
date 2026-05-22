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

abstract class CmsMediaDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CmsMediaDto._({
    required this.fileName,
    required this.mimeType,
    required this.url,
    required this.sizeBytes,
  });

  factory CmsMediaDto({
    required String fileName,
    required String mimeType,
    required String url,
    required int sizeBytes,
  }) = _CmsMediaDtoImpl;

  factory CmsMediaDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CmsMediaDto(
      fileName: jsonSerialization['fileName'] as String,
      mimeType: jsonSerialization['mimeType'] as String,
      url: jsonSerialization['url'] as String,
      sizeBytes: jsonSerialization['sizeBytes'] as int,
    );
  }

  String fileName;

  String mimeType;

  String url;

  int sizeBytes;

  /// Returns a shallow copy of this [CmsMediaDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CmsMediaDto copyWith({
    String? fileName,
    String? mimeType,
    String? url,
    int? sizeBytes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CmsMediaDto',
      'fileName': fileName,
      'mimeType': mimeType,
      'url': url,
      'sizeBytes': sizeBytes,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CmsMediaDto',
      'fileName': fileName,
      'mimeType': mimeType,
      'url': url,
      'sizeBytes': sizeBytes,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CmsMediaDtoImpl extends CmsMediaDto {
  _CmsMediaDtoImpl({
    required String fileName,
    required String mimeType,
    required String url,
    required int sizeBytes,
  }) : super._(
         fileName: fileName,
         mimeType: mimeType,
         url: url,
         sizeBytes: sizeBytes,
       );

  /// Returns a shallow copy of this [CmsMediaDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CmsMediaDto copyWith({
    String? fileName,
    String? mimeType,
    String? url,
    int? sizeBytes,
  }) {
    return CmsMediaDto(
      fileName: fileName ?? this.fileName,
      mimeType: mimeType ?? this.mimeType,
      url: url ?? this.url,
      sizeBytes: sizeBytes ?? this.sizeBytes,
    );
  }
}
