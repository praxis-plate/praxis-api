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
import '../enums/user_role.dart' as _i2;
import 'package:praxis_server/src/generated/protocol.dart' as _i3;

abstract class AccessProfileDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AccessProfileDto._({
    required this.authUserId,
    required this.roles,
    required this.scopes,
    required this.canAccessLearnerApi,
    required this.canAccessCms,
    required this.canManageContent,
    required this.canManageUsers,
  });

  factory AccessProfileDto({
    required _i1.UuidValue authUserId,
    required List<_i2.UserRole> roles,
    required List<String> scopes,
    required bool canAccessLearnerApi,
    required bool canAccessCms,
    required bool canManageContent,
    required bool canManageUsers,
  }) = _AccessProfileDtoImpl;

  factory AccessProfileDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return AccessProfileDto(
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      roles: _i3.Protocol().deserialize<List<_i2.UserRole>>(
        jsonSerialization['roles'],
      ),
      scopes: _i3.Protocol().deserialize<List<String>>(
        jsonSerialization['scopes'],
      ),
      canAccessLearnerApi: jsonSerialization['canAccessLearnerApi'] as bool,
      canAccessCms: jsonSerialization['canAccessCms'] as bool,
      canManageContent: jsonSerialization['canManageContent'] as bool,
      canManageUsers: jsonSerialization['canManageUsers'] as bool,
    );
  }

  _i1.UuidValue authUserId;

  List<_i2.UserRole> roles;

  List<String> scopes;

  bool canAccessLearnerApi;

  bool canAccessCms;

  bool canManageContent;

  bool canManageUsers;

  /// Returns a shallow copy of this [AccessProfileDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AccessProfileDto copyWith({
    _i1.UuidValue? authUserId,
    List<_i2.UserRole>? roles,
    List<String>? scopes,
    bool? canAccessLearnerApi,
    bool? canAccessCms,
    bool? canManageContent,
    bool? canManageUsers,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AccessProfileDto',
      'authUserId': authUserId.toJson(),
      'roles': roles.toJson(valueToJson: (v) => v.toJson()),
      'scopes': scopes.toJson(),
      'canAccessLearnerApi': canAccessLearnerApi,
      'canAccessCms': canAccessCms,
      'canManageContent': canManageContent,
      'canManageUsers': canManageUsers,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AccessProfileDto',
      'authUserId': authUserId.toJson(),
      'roles': roles.toJson(valueToJson: (v) => v.toJson()),
      'scopes': scopes.toJson(),
      'canAccessLearnerApi': canAccessLearnerApi,
      'canAccessCms': canAccessCms,
      'canManageContent': canManageContent,
      'canManageUsers': canManageUsers,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AccessProfileDtoImpl extends AccessProfileDto {
  _AccessProfileDtoImpl({
    required _i1.UuidValue authUserId,
    required List<_i2.UserRole> roles,
    required List<String> scopes,
    required bool canAccessLearnerApi,
    required bool canAccessCms,
    required bool canManageContent,
    required bool canManageUsers,
  }) : super._(
         authUserId: authUserId,
         roles: roles,
         scopes: scopes,
         canAccessLearnerApi: canAccessLearnerApi,
         canAccessCms: canAccessCms,
         canManageContent: canManageContent,
         canManageUsers: canManageUsers,
       );

  /// Returns a shallow copy of this [AccessProfileDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AccessProfileDto copyWith({
    _i1.UuidValue? authUserId,
    List<_i2.UserRole>? roles,
    List<String>? scopes,
    bool? canAccessLearnerApi,
    bool? canAccessCms,
    bool? canManageContent,
    bool? canManageUsers,
  }) {
    return AccessProfileDto(
      authUserId: authUserId ?? this.authUserId,
      roles: roles ?? this.roles.map((e0) => e0).toList(),
      scopes: scopes ?? this.scopes.map((e0) => e0).toList(),
      canAccessLearnerApi: canAccessLearnerApi ?? this.canAccessLearnerApi,
      canAccessCms: canAccessCms ?? this.canAccessCms,
      canManageContent: canManageContent ?? this.canManageContent,
      canManageUsers: canManageUsers ?? this.canManageUsers,
    );
  }
}
