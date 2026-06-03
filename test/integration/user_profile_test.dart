import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/app_usecases.dart';
import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('User profile', (sessionBuilder, endpoints) {
    late EmailIdpConfig emailIdpConfig;

    setUpAll(() {
      emailIdpConfig = EmailIdpConfigFromPasswords();
      Serverpod.instance.server.services = AppServices.build(
        Serverpod.instance,
      );
      Serverpod.instance.server.useCases = AppUseCases.build(
        Serverpod.instance,
        Serverpod.instance.server.services,
      );
      Serverpod.instance.initializeAuthServices(
        tokenManagerBuilders: [JwtConfigFromPasswords()],
        identityProviderBuilders: [emailIdpConfig],
      );
    });

    test('updates full name and enforces cooldown window', () async {
      const email = 'profile-full-name@codium.app';
      final authUserId = await _createEmailUser(
        sessionBuilder,
        emailIdpConfig,
        email: email,
      );
      final learnerSession = _learnerSession(sessionBuilder, authUserId);

      final initialProfile = await endpoints.userProfile.getMyProfile(
        learnerSession,
      );
      expect(initialProfile.fullName, isNull);
      expect(initialProfile.displayName, 'profile-full-name');
      expect(initialProfile.canChangeFullName, isTrue);

      final updatedProfile = await endpoints.userProfile.update(
        learnerSession,
        UpdateUserProfileRequest(fullName: 'Jane Doe'),
      );
      expect(updatedProfile.fullName, 'Jane Doe');
      expect(updatedProfile.displayName, 'Jane Doe');
      expect(updatedProfile.canChangeFullName, isFalse);
      expect(updatedProfile.nextFullNameChangeAt, isNotNull);

      await expectLater(
        endpoints.userProfile.update(
          learnerSession,
          UpdateUserProfileRequest(fullName: 'Janet Doe'),
        ),
        throwsA(
          isA<ValidationException>().having(
            (error) => error.field,
            'field',
            'fullName',
          ),
        ),
      );
    });

  });
}

TestSessionBuilder _learnerSession(
  TestSessionBuilder sessionBuilder,
  UuidValue authUserId,
) {
  return sessionBuilder.copyWith(
    authentication: AuthenticationOverride.authenticationInfo(
      authUserId.toString(),
      {Scope('learner.access')},
    ),
  );
}

Future<UuidValue> _createEmailUser(
  TestSessionBuilder sessionBuilder,
  EmailIdpConfig emailIdpConfig, {
  required String email,
}) async {
  late UuidValue authUserId;
  final session = sessionBuilder.build();
  try {
    final authUser = await const AuthUsers().create(
      session,
      transaction: session.transaction,
    );
    authUserId = authUser.id;

    await Serverpod.instance.server.services.accessControlService
        .initializeRolesForNewAccount(
          session,
          authUserId: authUserId,
          email: email,
          transaction: session.transaction,
        );
    await Serverpod.instance.server.services.userProfileService.ensureProfile(
      session,
      authUserId: authUserId,
      email: email,
      transaction: session.transaction,
    );

    final admin = EmailIdpAdmin(
      utils: EmailIdpUtils(config: emailIdpConfig),
    );
    await admin.createEmailAuthentication(
      session,
      authUserId: authUserId,
      email: email,
      password: 'Password123!',
      transaction: session.transaction,
    );
  } finally {
    await session.close();
  }
  return authUserId;
}
