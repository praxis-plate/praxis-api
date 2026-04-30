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

abstract class UploadCmsMediaRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UploadCmsMediaRequest._({
    required this.fileName,
    required this.mimeType,
    required this.dataBase64,
  });

  factory UploadCmsMediaRequest({
    required String fileName,
    required String mimeType,
    required String dataBase64,
  }) = _UploadCmsMediaRequestImpl;

  factory UploadCmsMediaRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UploadCmsMediaRequest(
      fileName: jsonSerialization['fileName'] as String,
      mimeType: jsonSerialization['mimeType'] as String,
      dataBase64: jsonSerialization['dataBase64'] as String,
    );
  }

  String fileName;

  String mimeType;

  String dataBase64;

  /// Returns a shallow copy of this [UploadCmsMediaRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UploadCmsMediaRequest copyWith({
    String? fileName,
    String? mimeType,
    String? dataBase64,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UploadCmsMediaRequest',
      'fileName': fileName,
      'mimeType': mimeType,
      'dataBase64': dataBase64,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UploadCmsMediaRequest',
      'fileName': fileName,
      'mimeType': mimeType,
      'dataBase64': dataBase64,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UploadCmsMediaRequestImpl extends UploadCmsMediaRequest {
  _UploadCmsMediaRequestImpl({
    required String fileName,
    required String mimeType,
    required String dataBase64,
  }) : super._(
         fileName: fileName,
         mimeType: mimeType,
         dataBase64: dataBase64,
       );

  /// Returns a shallow copy of this [UploadCmsMediaRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UploadCmsMediaRequest copyWith({
    String? fileName,
    String? mimeType,
    String? dataBase64,
  }) {
    return UploadCmsMediaRequest(
      fileName: fileName ?? this.fileName,
      mimeType: mimeType ?? this.mimeType,
      dataBase64: dataBase64 ?? this.dataBase64,
    );
  }
}
