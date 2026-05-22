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
  withServerpod('Access control', (sessionBuilder, endpoints) {
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

    test('newly created account receives learner access scope', () async {
      const email = 'learner-role@codium.app';
      const password = 'Password123!';
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

      expect(authSuccess.scopeNames, contains('learner.access'));
      expect(authSuccess.scopeNames, isNot(contains('cms.access')));
    });

    test('learner cannot access cms or admin endpoints', () async {
      final learnerSession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          const Uuid().v7obj().toString(),
          {Scope('learner.access')},
        ),
      );

      await expectLater(
        endpoints.accessControl.getCmsAccess(learnerSession),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
      await expectLater(
        endpoints.accessControl.getAdminAccess(learnerSession),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
    });

    test('author can access cms endpoint but not admin endpoint', () async {
      final authorAuthUserId = const Uuid().v7obj();
      final session = sessionBuilder.build();
      try {
        await AuthUser.db.insertRow(
          session,
          AuthUser(
            id: authorAuthUserId,
            scopeNames: {'learner.access', 'cms.access', 'content.manage'},
            blocked: false,
          ),
        );
      } finally {
        await session.close();
      }

      final authorSession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          authorAuthUserId.toString(),
          {
            Scope('learner.access'),
            Scope('cms.access'),
            Scope('content.manage'),
          },
        ),
      );

      final profile = await endpoints.accessControl.getCmsAccess(authorSession);

      expect(profile.canAccessCms, isTrue);
      expect(profile.canManageContent, isTrue);
      expect(profile.canManageUsers, isFalse);
      expect(profile.roles, contains(UserRole.author));

      await expectLater(
        endpoints.accessControl.getAdminAccess(authorSession),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
    });

    test(
      'admin can assign author role and new login receives author scopes',
      () async {
        const email = 'author-role@codium.app';
        const password = 'Password123!';
        late UuidValue authUserId;

        final session = sessionBuilder.build();
        try {
          final authUser = await AuthUser.db.insertRow(
            session,
            AuthUser(
              scopeNames: {},
              blocked: false,
            ),
          );
          authUserId = authUser.id!;

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

        final adminSession = sessionBuilder.copyWith(
          authentication: AuthenticationOverride.authenticationInfo(
            const Uuid().v7obj().toString(),
            {
              Scope('learner.access'),
              Scope('cms.access'),
              Scope('content.manage'),
              Scope('admin.access'),
              Scope('users.manage'),
            },
          ),
        );

        final updatedProfile = await endpoints.accessControl.assignRole(
          adminSession,
          authUserId: authUserId,
          role: UserRole.author,
        );

        expect(
          updatedProfile.roles,
          containsAll([UserRole.learner, UserRole.author]),
        );
        expect(
          updatedProfile.scopes,
          containsAll(['cms.access', 'content.manage']),
        );

        final authSuccess = await endpoints.emailIdp.login(
          sessionBuilder,
          email: email,
          password: password,
        );

        expect(
          authSuccess.scopeNames,
          containsAll(['learner.access', 'cms.access', 'content.manage']),
        );
        expect(authSuccess.scopeNames, isNot(contains('admin.access')));
      },
    );
  });
}
