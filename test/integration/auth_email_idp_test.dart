import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Email IdP auth', (sessionBuilder, endpoints) {
    late EmailIdpConfig emailIdpConfig;

    setUpAll(() {
      emailIdpConfig = EmailIdpConfigFromPasswords();
      Serverpod.instance.initializeAuthServices(
        tokenManagerBuilders: [JwtConfigFromPasswords()],
        identityProviderBuilders: [emailIdpConfig],
      );
    });

    test('login succeeds for existing email account', () async {
      final session = sessionBuilder.build();
      const email = 'auth-test@codium.app';
      const password = 'Password123';
      late UuidValue authUserId;

      try {
        final authUser = await AuthUsers().create(
          session,
          transaction: session.transaction,
        );
        authUserId = authUser.id;

        final admin = EmailIdpAdmin(
          utils: EmailIdpUtils(config: emailIdpConfig),
        );
        await admin.createEmailAuthentication(
          session,
          authUserId: authUserId,
          email: email,
          password: password,
          transaction: session.transaction,
        );
      } finally {
        await session.close();
      }

      final authSuccess = await endpoints.emailIdp.login(
        sessionBuilder,
        email: email,
        password: password,
      );

      expect(authSuccess.authUserId, authUserId);
      expect(authSuccess.token, isNotEmpty);
    });

    test('login fails for invalid password', () async {
      final session = sessionBuilder.build();
      const email = 'auth-test-invalid@codium.app';
      const password = 'Password123';
      late UuidValue authUserId;

      try {
        final authUser = await AuthUsers().create(
          session,
          transaction: session.transaction,
        );
        authUserId = authUser.id;

        final admin = EmailIdpAdmin(
          utils: EmailIdpUtils(config: emailIdpConfig),
        );
        await admin.createEmailAuthentication(
          session,
          authUserId: authUserId,
          email: email,
          password: password,
          transaction: session.transaction,
        );
      } finally {
        await session.close();
      }

      await expectLater(
        endpoints.emailIdp.login(
          sessionBuilder,
          email: email,
          password: 'WrongPassword',
        ),
        throwsA(
          isA<EmailAccountLoginException>().having(
            (e) => e.reason,
            'reason',
            EmailAccountLoginExceptionReason.invalidCredentials,
          ),
        ),
      );
    });
  });
}
