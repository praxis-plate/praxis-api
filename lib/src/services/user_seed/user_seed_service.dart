import 'package:praxis_server/src/shared/constants/auth_scopes.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

class UserSeedService {
  final EmailIdpConfig _emailIdpConfig;

  static const _testUserEmailKey = 'testUserEmail';
  static const _testUserPasswordKey = 'testUserPassword';
  static const _developmentAuthorEmail = 'author@codium.app';
  static const _developmentAuthorPassword = 'password';
  static const _developmentAdminEmail = 'admin@codium.app';
  static const _developmentAdminPassword = 'password';
  static const _developmentAuthorScopes = {
    AuthScopes.learnerAccess,
    AuthScopes.cmsAccess,
    AuthScopes.contentManage,
  };
  static const _developmentAdminScopes = {
    AuthScopes.learnerAccess,
    AuthScopes.cmsAccess,
    AuthScopes.contentManage,
    AuthScopes.adminAccess,
    AuthScopes.usersManage,
  };

  const UserSeedService({required EmailIdpConfig emailIdpConfig})
    : _emailIdpConfig = emailIdpConfig;

  Future<void> createTestUser(Serverpod pod) async {
    if (!_shouldSeedForRunMode(pod.runMode)) {
      return;
    }

    final email = pod.getPassword(_testUserEmailKey);
    final password = pod.getPassword(_testUserPasswordKey);

    final session = await pod.createSession(enableLogging: false);
    try {
      final admin = EmailIdpAdmin(
        utils: EmailIdpUtils(config: _emailIdpConfig),
      );
      if (email != null && password != null) {
        final existingAccount = await admin.findAccount(
          session,
          email: email,
        );

        if (existingAccount == null) {
          final authUser = await AuthUsers().create(session);
          await admin.createEmailAuthentication(
            session,
            authUserId: authUser.id,
            email: email,
            password: password,
          );
        } else {
          await admin.setPassword(
            session,
            email: email,
            password: password,
          );
        }
      }
      await _upsertDevelopmentAccount(
        session,
        admin,
        email: _developmentAuthorEmail,
        password: _developmentAuthorPassword,
        scopes: _developmentAuthorScopes,
      );
      await _upsertDevelopmentAccount(
        session,
        admin,
        email: _developmentAdminEmail,
        password: _developmentAdminPassword,
        scopes: _developmentAdminScopes,
      );
    } finally {
      await session.close();
    }
  }

  Future<void> _upsertDevelopmentAccount(
    Session session,
    EmailIdpAdmin admin, {
    required String email,
    required String password,
    required Set<String> scopes,
  }) async {
    final existingAccount = await admin.findAccount(session, email: email);
    final serverpodScopes = scopes.map((scope) => Scope(scope)).toSet();

    if (existingAccount == null) {
      final authUser = await AuthUsers().create(
        session,
        scopes: serverpodScopes,
      );
      await admin.createEmailAuthentication(
        session,
        authUserId: authUser.id,
        email: email,
        password: password,
      );
      return;
    }

    await AuthUser.db.updateRow(
      session,
      (await AuthUser.db.findById(
        session,
        existingAccount.authUserId,
      ))!.copyWith(scopeNames: scopes),
    );
    await admin.setPassword(session, email: email, password: password);
  }

  bool _shouldSeedForRunMode(String runMode) {
    return runMode == ServerpodRunMode.test ||
        runMode == ServerpodRunMode.development;
  }
}
