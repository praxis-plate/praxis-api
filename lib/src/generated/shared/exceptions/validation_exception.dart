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

abstract class ValidationException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  ValidationException._({
    required this.message,
    this.field,
  });

  factory ValidationException({
    required String message,
    String? field,
  }) = _ValidationExceptionImpl;

  factory ValidationException.fromJson(Map<String, dynamic> jsonSerialization) {
    return ValidationException(
      message: jsonSerialization['message'] as String,
      field: jsonSerialization['field'] as String?,
    );
  }

  String message;

  String? field;

  /// Returns a shallow copy of this [ValidationException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ValidationException copyWith({
    String? message,
    String? field,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ValidationException',
      'message': message,
      if (field != null) 'field': field,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ValidationException',
      'message': message,
      if (field != null) 'field': field,
    };
  }

  @override
  String toString() {
    return 'ValidationException(message: $message, field: $field)';
  }
}

class _Undefined {}

class _ValidationExceptionImpl extends ValidationException {
  _ValidationExceptionImpl({
    required String message,
    String? field,
  }) : super._(
         message: message,
         field: field,
       );

  /// Returns a shallow copy of this [ValidationException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ValidationException copyWith({
    String? message,
    Object? field = _Undefined,
  }) {
    return ValidationException(
      message: message ?? this.message,
      field: field is String? ? field : this.field,
    );
  }
}
