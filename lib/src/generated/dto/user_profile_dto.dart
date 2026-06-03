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

abstract class UserProfileDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UserProfileDto._({
    required this.authUserId,
    required this.email,
    this.fullName,
    required this.displayName,
    this.avatarUrl,
    required this.createdAt,
    required this.canChangeFullName,
    this.nextFullNameChangeAt,
  });

  factory UserProfileDto({
    required String authUserId,
    required String email,
    String? fullName,
    required String displayName,
    String? avatarUrl,
    required DateTime createdAt,
    required bool canChangeFullName,
    DateTime? nextFullNameChangeAt,
  }) = _UserProfileDtoImpl;

  factory UserProfileDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfileDto(
      authUserId: jsonSerialization['authUserId'] as String,
      email: jsonSerialization['email'] as String,
      fullName: jsonSerialization['fullName'] as String?,
      displayName: jsonSerialization['displayName'] as String,
      avatarUrl: jsonSerialization['avatarUrl'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      canChangeFullName: jsonSerialization['canChangeFullName'] as bool,
      nextFullNameChangeAt: jsonSerialization['nextFullNameChangeAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['nextFullNameChangeAt'],
            ),
    );
  }

  String authUserId;

  String email;

  String? fullName;

  String displayName;

  String? avatarUrl;

  DateTime createdAt;

  bool canChangeFullName;

  DateTime? nextFullNameChangeAt;

  /// Returns a shallow copy of this [UserProfileDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserProfileDto copyWith({
    String? authUserId,
    String? email,
    String? fullName,
    String? displayName,
    String? avatarUrl,
    DateTime? createdAt,
    bool? canChangeFullName,
    DateTime? nextFullNameChangeAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserProfileDto',
      'authUserId': authUserId,
      'email': email,
      if (fullName != null) 'fullName': fullName,
      'displayName': displayName,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'createdAt': createdAt.toJson(),
      'canChangeFullName': canChangeFullName,
      if (nextFullNameChangeAt != null)
        'nextFullNameChangeAt': nextFullNameChangeAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserProfileDto',
      'authUserId': authUserId,
      'email': email,
      if (fullName != null) 'fullName': fullName,
      'displayName': displayName,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'createdAt': createdAt.toJson(),
      'canChangeFullName': canChangeFullName,
      if (nextFullNameChangeAt != null)
        'nextFullNameChangeAt': nextFullNameChangeAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileDtoImpl extends UserProfileDto {
  _UserProfileDtoImpl({
    required String authUserId,
    required String email,
    String? fullName,
    required String displayName,
    String? avatarUrl,
    required DateTime createdAt,
    required bool canChangeFullName,
    DateTime? nextFullNameChangeAt,
  }) : super._(
         authUserId: authUserId,
         email: email,
         fullName: fullName,
         displayName: displayName,
         avatarUrl: avatarUrl,
         createdAt: createdAt,
         canChangeFullName: canChangeFullName,
         nextFullNameChangeAt: nextFullNameChangeAt,
       );

  /// Returns a shallow copy of this [UserProfileDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserProfileDto copyWith({
    String? authUserId,
    String? email,
    Object? fullName = _Undefined,
    String? displayName,
    Object? avatarUrl = _Undefined,
    DateTime? createdAt,
    bool? canChangeFullName,
    Object? nextFullNameChangeAt = _Undefined,
  }) {
    return UserProfileDto(
      authUserId: authUserId ?? this.authUserId,
      email: email ?? this.email,
      fullName: fullName is String? ? fullName : this.fullName,
      displayName: displayName ?? this.displayName,
      avatarUrl: avatarUrl is String? ? avatarUrl : this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
      canChangeFullName: canChangeFullName ?? this.canChangeFullName,
      nextFullNameChangeAt: nextFullNameChangeAt is DateTime?
          ? nextFullNameChangeAt
          : this.nextFullNameChangeAt,
    );
  }
}
