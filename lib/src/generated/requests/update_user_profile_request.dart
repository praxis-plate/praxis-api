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

abstract class UpdateUserProfileRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UpdateUserProfileRequest._({this.fullName});

  factory UpdateUserProfileRequest({String? fullName}) =
      _UpdateUserProfileRequestImpl;

  factory UpdateUserProfileRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UpdateUserProfileRequest(
      fullName: jsonSerialization['fullName'] as String?,
    );
  }

  String? fullName;

  /// Returns a shallow copy of this [UpdateUserProfileRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateUserProfileRequest copyWith({String? fullName});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateUserProfileRequest',
      if (fullName != null) 'fullName': fullName,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UpdateUserProfileRequest',
      if (fullName != null) 'fullName': fullName,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UpdateUserProfileRequestImpl extends UpdateUserProfileRequest {
  _UpdateUserProfileRequestImpl({String? fullName})
    : super._(fullName: fullName);

  /// Returns a shallow copy of this [UpdateUserProfileRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateUserProfileRequest copyWith({Object? fullName = _Undefined}) {
    return UpdateUserProfileRequest(
      fullName: fullName is String? ? fullName : this.fullName,
    );
  }
}
