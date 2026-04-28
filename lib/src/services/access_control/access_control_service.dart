import 'package:praxis_server/src/datasources/auth_user_data_source.dart';
import 'package:praxis_server/src/datasources/email_account_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/auth_scopes.dart';
import 'package:praxis_server/src/shared/utils/user_role_scope_resolver.dart';
import 'package:serverpod/serverpod.dart';

class AccessControlService {
  final AuthUserDataSource _authUserDataSource;
  final EmailAccountDataSource _emailAccountDataSource;
  final Set<String> _bootstrapAuthorEmails;
  final Set<String> _bootstrapAdminEmails;

  const AccessControlService({
    required AuthUserDataSource authUserDataSource,
    required EmailAccountDataSource emailAccountDataSource,
    required Set<String> bootstrapAuthorEmails,
    required Set<String> bootstrapAdminEmails,
  }) : _authUserDataSource = authUserDataSource,
       _emailAccountDataSource = emailAccountDataSource,
       _bootstrapAuthorEmails = bootstrapAuthorEmails,
       _bootstrapAdminEmails = bootstrapAdminEmails;

  Future<AccessProfileDto> getAccessProfile(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) async {
    final authUser = await _authUserDataSource.findById(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );

    return _toAccessProfile(authUserId, authUser.scopeNames);
  }

  Future<List<GovernanceUserDto>> listGovernanceUsers(
    Session session, {
    Transaction? transaction,
  }) async {
    final authUsers = await _authUserDataSource.list(
      session,
      transaction: transaction,
    );
    final emailAccounts = await _emailAccountDataSource.listByAuthUserIds(
      session,
      authUserIds: authUsers.map((user) => user.id).toSet(),
      transaction: transaction,
    );
    final emailsByAuthUserId = <UuidValue, String>{};
    for (final account in emailAccounts) {
      emailsByAuthUserId.putIfAbsent(account.authUserId, () => account.email);
    }

    final users = authUsers.map((authUser) {
      final profile = _toAccessProfile(authUser.id, authUser.scopeNames);
      return GovernanceUserDto(
        authUserId: profile.authUserId,
        email: emailsByAuthUserId[authUser.id],
        createdAt: authUser.createdAt,
        blocked: authUser.blocked,
        roles: profile.roles,
        scopes: profile.scopes,
        canAccessLearnerApi: profile.canAccessLearnerApi,
        canAccessCms: profile.canAccessCms,
        canManageContent: profile.canManageContent,
        canManageUsers: profile.canManageUsers,
      );
    }).toList();

    users.sort((a, b) {
      final left = a.email ?? a.authUserId.toString();
      final right = b.email ?? b.authUserId.toString();
      return left.compareTo(right);
    });
    return users;
  }

  Future<AccessProfileDto> assignRole(
    Session session, {
    required UuidValue authUserId,
    required UserRole role,
    Transaction? transaction,
  }) async {
    return _updateRoles(
      session,
      authUserId: authUserId,
      transaction: transaction,
      transform: (roles) => {...roles, role},
    );
  }

  Future<AccessProfileDto> revokeRole(
    Session session, {
    required UuidValue authUserId,
    required UserRole role,
    Transaction? transaction,
  }) async {
    return _updateRoles(
      session,
      authUserId: authUserId,
      transaction: transaction,
      transform: (roles) => roles..remove(role),
    );
  }

  Future<void> initializeRolesForNewAccount(
    Session session, {
    required UuidValue authUserId,
    required String email,
    Transaction? transaction,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();
    final roles = <UserRole>{UserRole.learner};

    if (_bootstrapAuthorEmails.contains(normalizedEmail)) {
      roles.add(UserRole.author);
    }
    if (_bootstrapAdminEmails.contains(normalizedEmail)) {
      roles.add(UserRole.admin);
    }

    final scopes = UserRoleScopeResolver.toServerpodScopes(
      UserRoleScopeResolver.scopesForRoles(roles),
    );

    await _authUserDataSource.updateScopes(
      session,
      authUserId: authUserId,
      scopes: scopes,
      transaction: transaction,
    );
  }

  AccessProfileDto buildAuthenticatedAccessProfile(Session session) {
    final authInfo = session.authenticated!;
    final scopes = authInfo.scopes.map((scope) => scope.name!).toSet();
    final roles = UserRoleScopeResolver.rolesFromScopes(scopes);

    return _toAccessProfile(
      UuidValue.fromString(authInfo.userIdentifier),
      scopes,
      roles: roles,
    );
  }

  Future<AccessProfileDto> _updateRoles(
    Session session, {
    required UuidValue authUserId,
    required Set<UserRole> Function(Set<UserRole> roles) transform,
    Transaction? transaction,
  }) async {
    final authUser = await _authUserDataSource.findById(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );
    final currentRoles = UserRoleScopeResolver.rolesFromScopes(
      authUser.scopeNames,
    ).toSet();
    final nextRoles = UserRoleScopeResolver.expandRoles(
      transform({...currentRoles}),
    );
    final nextScopes = UserRoleScopeResolver.mergeManagedScopes(
      currentScopes: authUser.scopeNames,
      roles: nextRoles,
    );

    await _authUserDataSource.updateScopes(
      session,
      authUserId: authUserId,
      scopes: UserRoleScopeResolver.toServerpodScopes(nextScopes),
      transaction: transaction,
    );
    await session.messages.authenticationRevoked(
      authUserId.toString(),
      RevokedAuthenticationUser(),
    );

    return _toAccessProfile(
      authUserId,
      nextScopes,
      roles: UserRoleScopeResolver.rolesFromScopes(nextScopes),
    );
  }

  AccessProfileDto _toAccessProfile(
    UuidValue authUserId,
    Iterable<String> scopes, {
    List<UserRole>? roles,
  }) {
    final sortedScopes = scopes.toSet().toList()..sort();
    final resolvedRoles =
        roles ?? UserRoleScopeResolver.rolesFromScopes(sortedScopes);

    return AccessProfileDto(
      authUserId: authUserId,
      roles: resolvedRoles,
      scopes: sortedScopes,
      canAccessLearnerApi: sortedScopes.contains(AuthScopes.learnerAccess),
      canAccessCms: sortedScopes.contains(AuthScopes.cmsAccess),
      canManageContent: sortedScopes.contains(AuthScopes.contentManage),
      canManageUsers: sortedScopes.contains(AuthScopes.usersManage),
    );
  }
}
