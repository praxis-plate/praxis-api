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

abstract class AiResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AiResponse._({
    required this.content,
    required this.success,
    this.error,
  });

  factory AiResponse({
    required String content,
    required bool success,
    String? error,
  }) = _AiResponseImpl;

  factory AiResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return AiResponse(
      content: jsonSerialization['content'] as String,
      success: jsonSerialization['success'] as bool,
      error: jsonSerialization['error'] as String?,
    );
  }

  String content;

  bool success;

  String? error;

  /// Returns a shallow copy of this [AiResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AiResponse copyWith({
    String? content,
    bool? success,
    String? error,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AiResponse',
      'content': content,
      'success': success,
      if (error != null) 'error': error,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AiResponse',
      'content': content,
      'success': success,
      if (error != null) 'error': error,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AiResponseImpl extends AiResponse {
  _AiResponseImpl({
    required String content,
    required bool success,
    String? error,
  }) : super._(
         content: content,
         success: success,
         error: error,
       );

  /// Returns a shallow copy of this [AiResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AiResponse copyWith({
    String? content,
    bool? success,
    Object? error = _Undefined,
  }) {
    return AiResponse(
      content: content ?? this.content,
      success: success ?? this.success,
      error: error is String? ? error : this.error,
    );
  }
}
