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
  withServerpod('Admin governance', (sessionBuilder, endpoints) {
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

    final authorSession = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(
        const Uuid().v7obj().toString(),
        {
          Scope('learner.access'),
          Scope('cms.access'),
          Scope('content.manage'),
        },
      ),
    );
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

    test('rejects author access to governance workspace', () async {
      await expectLater(
        endpoints.adminGovernance.listUsers(authorSession),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
      await expectLater(
        endpoints.adminGovernance.listPublicationQueue(authorSession),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
    });

    test('lists users and updates roles through admin contract', () async {
      const email = 'governance-user@codium.app';
      final authUserId = await _createEmailUser(
        sessionBuilder,
        emailIdpConfig,
        email: email,
      );

      final users = await endpoints.adminGovernance.listUsers(adminSession);
      final user = users.firstWhere((item) => item.authUserId == authUserId);

      expect(user.email, email);
      expect(user.roles, isEmpty);
      expect(user.canManageContent, isFalse);

      final authorProfile = await endpoints.adminGovernance.assignRole(
        adminSession,
        authUserId: authUserId,
        role: UserRole.author,
      );

      expect(authorProfile.roles, contains(UserRole.author));
      expect(authorProfile.canManageContent, isTrue);

      final learnerProfile = await endpoints.adminGovernance.revokeRole(
        adminSession,
        authUserId: authUserId,
        role: UserRole.author,
      );

      expect(learnerProfile.roles, contains(UserRole.learner));
      expect(learnerProfile.canManageContent, isFalse);
    });

    test('reviews publication queue and moderates published courses', () async {
      final course = await endpoints.courseAdmin.create(
        authorSession,
        CreateCourseRequest(
          title: 'Governance Review Course',
          description: 'Course for publication review',
          author: 'Author',
          category: 'Programming',
        ),
      );

      final queue = await endpoints.adminGovernance.listPublicationQueue(
        adminSession,
      );
      expect(queue.any((item) => item.id == course.id), isTrue);

      final published = await endpoints.adminGovernance.approvePublication(
        adminSession,
        course.id,
      );
      expect(published.contentStatus, ContentStatus.published);

      final publishedCourses = await endpoints.adminGovernance
          .listPublishedCourses(adminSession);
      expect(publishedCourses.any((item) => item.id == course.id), isTrue);

      final draft = await endpoints.adminGovernance.unpublishCourse(
        adminSession,
        course.id,
      );
      expect(draft.contentStatus, ContentStatus.draft);
    });
  }, applyMigrations: false);
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
