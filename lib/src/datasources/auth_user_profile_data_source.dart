import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';
import 'dart:typed_data';

class AuthUserProfileDataSource {
  const AuthUserProfileDataSource();

  Future<UserProfileModel?> findByAuthUserId(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) {
    return AuthServices.instance.userProfiles.maybeFindUserProfileByUserId(
      session,
      authUserId,
      transaction: transaction,
    );
  }

  Future<UserProfileModel> create(
    Session session, {
    required UuidValue authUserId,
    required String email,
    Transaction? transaction,
  }) {
    return AuthServices.instance.userProfiles.createUserProfile(
      session,
      authUserId,
      UserProfileData(email: email),
      transaction: transaction,
    );
  }

  Future<UserProfileModel> updateFullName(
    Session session, {
    required UuidValue authUserId,
    required String? fullName,
    Transaction? transaction,
  }) {
    return AuthServices.instance.userProfiles.changeFullName(
      session,
      authUserId,
      fullName,
      transaction: transaction,
    );
  }

  Future<UserProfileModel> setImageFromBytes(
    Session session, {
    required UuidValue authUserId,
    required List<int> bytes,
    Transaction? transaction,
  }) {
    return AuthServices.instance.userProfiles.setUserImageFromBytes(
      session,
      authUserId,
      Uint8List.fromList(bytes),
      transaction: transaction,
    );
  }

  Future<UserProfileModel> removeImage(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) {
    return AuthServices.instance.userProfiles.removeUserImage(
      session,
      authUserId,
      transaction: transaction,
    );
  }
}
