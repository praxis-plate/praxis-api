import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

class UserSeedService {
  final EmailIdpConfig _emailIdpConfig;

  static const _testUserEmailKey = 'testUserEmail';
  static const _testUserPasswordKey = 'testUserPassword';

  const UserSeedService({required EmailIdpConfig emailIdpConfig})
    : _emailIdpConfig = emailIdpConfig;

  Future<void> createTestUser(Serverpod pod) async {
    if (!_shouldSeedForRunMode(pod.runMode)) {
      return;
    }

    final email = pod.getPassword(_testUserEmailKey);
    final password = pod.getPassword(_testUserPasswordKey);
    if (email == null || password == null) {
      return;
    }

    final session = await pod.createSession(enableLogging: false);
    try {
      final admin = EmailIdpAdmin(
        utils: EmailIdpUtils(config: _emailIdpConfig),
      );
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
        return;
      }

      await admin.setPassword(
        session,
        email: email,
        password: password,
      );
    } finally {
      await session.close();
    }
  }

  bool _shouldSeedForRunMode(String runMode) {
    return runMode == ServerpodRunMode.test ||
        runMode == ServerpodRunMode.development;
  }
}
