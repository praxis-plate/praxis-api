import 'dart:convert';

import 'package:praxis_server/src/datasources/auth_user_data_source.dart';
import 'package:praxis_server/src/datasources/auth_user_profile_data_source.dart';
import 'package:praxis_server/src/datasources/email_account_data_source.dart';
import 'package:praxis_server/src/datasources/user_profile_metadata_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as auth;

class UserProfileService {
  static const _fullNameCooldown = Duration(days: 30);

  final AuthUserDataSource _authUserDataSource;
  final AuthUserProfileDataSource _authUserProfileDataSource;
  final EmailAccountDataSource _emailAccountDataSource;
  final UserProfileMetadataDataSource _metadataDataSource;

  const UserProfileService({
    required AuthUserDataSource authUserDataSource,
    required AuthUserProfileDataSource authUserProfileDataSource,
    required EmailAccountDataSource emailAccountDataSource,
    required UserProfileMetadataDataSource metadataDataSource,
  }) : _authUserDataSource = authUserDataSource,
       _authUserProfileDataSource = authUserProfileDataSource,
       _emailAccountDataSource = emailAccountDataSource,
       _metadataDataSource = metadataDataSource;

  Future<void> ensureProfile(
    Session session, {
    required UuidValue authUserId,
    required String email,
    Transaction? transaction,
  }) async {
    final existing = await _authUserProfileDataSource.findByAuthUserId(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );
    if (existing != null) {
      return;
    }

    await _authUserProfileDataSource.create(
      session,
      authUserId: authUserId,
      email: email,
      transaction: transaction,
    );
  }

  Future<UserProfileDto> getCurrentProfile(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) async {
    return _buildProfileDto(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );
  }

  Future<UserProfileDto> updateCurrentProfile(
    Session session, {
    required UuidValue authUserId,
    required UpdateUserProfileRequest request,
    Transaction? transaction,
  }) async {
    final normalizedFullName = _normalizeFullName(request.fullName);
    final current = await _buildProfileParts(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );

    if (normalizedFullName == current.profile.fullName) {
      return _toDto(
        authUser: current.authUser,
        profile: current.profile,
        metadata: current.metadata,
      );
    }

    _validateFullNameChangeWindow(
      metadata: current.metadata,
      nextFullName: normalizedFullName,
    );

    final updatedProfile = await _authUserProfileDataSource.updateFullName(
      session,
      authUserId: authUserId,
      fullName: normalizedFullName,
      transaction: transaction,
    );

    final metadata = normalizedFullName == null
        ? current.metadata
        : await _metadataDataSource.upsertFullNameChangedAt(
            session,
            authUserId: authUserId,
            changedAt: DateTime.now(),
            transaction: transaction,
          );

    return _toDto(
      authUser: current.authUser,
      profile: updatedProfile,
      metadata: metadata,
    );
  }

  Future<UserProfileDto> uploadAvatar(
    Session session, {
    required UuidValue authUserId,
    required UploadUserAvatarRequest request,
    Transaction? transaction,
  }) async {
    if (!request.mimeType.startsWith('image/')) {
      throw ValidationException(
        message: 'Avatar upload expects an image mime type',
        field: 'mimeType',
      );
    }

    final bytes = _decodeImageBytes(request.dataBase64);
    if (bytes.isEmpty) {
      throw ValidationException(
        message: 'Avatar image is empty',
        field: 'dataBase64',
      );
    }

    final current = await _buildProfileParts(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );
    final updatedProfile = await _authUserProfileDataSource.setImageFromBytes(
      session,
      authUserId: authUserId,
      bytes: bytes,
      transaction: transaction,
    );

    return _toDto(
      authUser: current.authUser,
      profile: updatedProfile,
      metadata: current.metadata,
    );
  }

  Future<UserProfileDto> removeAvatar(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) async {
    final current = await _buildProfileParts(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );
    final updatedProfile = await _authUserProfileDataSource.removeImage(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );

    return _toDto(
      authUser: current.authUser,
      profile: updatedProfile,
      metadata: current.metadata,
    );
  }

  Future<String> resolveDisplayName(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) async {
    try {
      final snapshot = await _buildProfileSnapshot(
        session,
        authUserId: authUserId,
        transaction: transaction,
      );
      return _displayName(profile: snapshot.profile, email: snapshot.email);
    } on NotFoundException {
      return 'Learner';
    }
  }

  Future<String?> resolveAvatarUrl(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) async {
    try {
      final snapshot = await _buildProfileSnapshot(
        session,
        authUserId: authUserId,
        transaction: transaction,
      );
      return snapshot.profile.imageUrl?.toString();
    } on NotFoundException {
      return null;
    }
  }

  Future<_ProfileParts> _buildProfileParts(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) async {
    final authUser = await _authUserDataSource.findById(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );
    final snapshot = await _buildProfileSnapshot(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );
    final metadata = await _metadataDataSource.findByAuthUserId(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );

    return _ProfileParts(
      authUser: authUser,
      profile: snapshot.profile,
      email: snapshot.email,
      metadata: metadata,
    );
  }

  Future<_ProfileSnapshot> _buildProfileSnapshot(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) async {
    final emailAccount = await _emailAccountDataSource.findByAuthUserId(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );
    final email = emailAccount?.email;
    if (email == null || email.trim().isEmpty) {
      throw NotFoundException(message: 'Email account not found');
    }

    await ensureProfile(
      session,
      authUserId: authUserId,
      email: email,
      transaction: transaction,
    );

    final profile = await _authUserProfileDataSource.findByAuthUserId(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );
    if (profile == null) {
      throw NotFoundException(message: 'User profile not found');
    }

    return _ProfileSnapshot(profile: profile, email: email);
  }

  Future<UserProfileDto> _buildProfileDto(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) async {
    final parts = await _buildProfileParts(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );
    return _toDto(
      authUser: parts.authUser,
      profile: parts.profile,
      metadata: parts.metadata,
    );
  }

  UserProfileDto _toDto({
    required auth.AuthUserModel authUser,
    required auth.UserProfileModel profile,
    required UserProfileMetadata? metadata,
  }) {
    final email = profile.email?.trim() ?? '';
    final nextFullNameChangeAt = _nextFullNameChangeAt(metadata);
    final canChangeFullName =
        nextFullNameChangeAt == null ||
        !nextFullNameChangeAt.isAfter(DateTime.now());

    return UserProfileDto(
      authUserId: authUser.id.toString(),
      email: email,
      fullName: profile.fullName?.trim().isEmpty ?? true
          ? null
          : profile.fullName?.trim(),
      displayName: _displayName(profile: profile, email: email),
      avatarUrl: profile.imageUrl?.toString(),
      createdAt: authUser.createdAt,
      canChangeFullName: canChangeFullName,
      nextFullNameChangeAt: canChangeFullName ? null : nextFullNameChangeAt,
    );
  }

  void _validateFullNameChangeWindow({
    required UserProfileMetadata? metadata,
    required String? nextFullName,
  }) {
    if (nextFullName == null) {
      throw ValidationException(
        message: 'Full name cannot be empty',
        field: 'fullName',
      );
    }

    final nextAllowedAt = _nextFullNameChangeAt(metadata);
    if (nextAllowedAt == null) {
      return;
    }
    if (nextAllowedAt.isAfter(DateTime.now())) {
      throw ValidationException(
        message: 'Full name can only be changed once every 30 days',
        field: 'fullName',
      );
    }
  }

  DateTime? _nextFullNameChangeAt(UserProfileMetadata? metadata) {
    final lastChangedAt = metadata?.lastFullNameChangedAt;
    if (lastChangedAt == null) {
      return null;
    }
    return lastChangedAt.add(_fullNameCooldown);
  }

  String? _normalizeFullName(String? fullName) {
    final normalized = fullName?.trim();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }
    if (normalized.length < 2 || normalized.length > 80) {
      throw ValidationException(
        message: 'Full name must be between 2 and 80 characters',
        field: 'fullName',
      );
    }
    return normalized;
  }

  List<int> _decodeImageBytes(String dataBase64) {
    try {
      return base64Decode(dataBase64);
    } on FormatException {
      throw ValidationException(
        message: 'Avatar payload must be valid base64',
        field: 'dataBase64',
      );
    }
  }

  String _displayName({
    required auth.UserProfileModel profile,
    required String email,
  }) {
    final fullName = profile.fullName?.trim();
    if (fullName != null && fullName.isNotEmpty) {
      return fullName;
    }

    final localPart = email.split('@').first.trim();
    if (localPart.isEmpty) {
      return 'Learner';
    }

    return localPart;
  }
}

class _ProfileParts {
  final auth.AuthUserModel authUser;
  final auth.UserProfileModel profile;
  final String email;
  final UserProfileMetadata? metadata;

  const _ProfileParts({
    required this.authUser,
    required this.profile,
    required this.email,
    required this.metadata,
  });
}

class _ProfileSnapshot {
  final auth.UserProfileModel profile;
  final String email;

  const _ProfileSnapshot({
    required this.profile,
    required this.email,
  });
}
