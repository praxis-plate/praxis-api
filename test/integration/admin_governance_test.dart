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

    test('blocks and unblocks users through admin contract', () async {
      const email = 'governance-blocked@codium.app';
      final authUserId = await _createEmailUser(
        sessionBuilder,
        emailIdpConfig,
        email: email,
      );

      final blockedProfile = await endpoints.adminGovernance.blockUser(
        adminSession,
        authUserId,
      );
      expect(blockedProfile.authUserId, authUserId);
      expect(blockedProfile.blocked, isTrue);

      final blockedUser = (await endpoints.adminGovernance.listUsers(
        adminSession,
      )).firstWhere((item) => item.authUserId == authUserId);
      expect(blockedUser.blocked, isTrue);

      final unblockedProfile = await endpoints.adminGovernance.unblockUser(
        adminSession,
        authUserId,
      );
      expect(unblockedProfile.blocked, isFalse);
    });

    test('lists enrolled and authored courses for a managed user', () async {
      const email = 'governance-courses@codium.app';
      final authUserId = await _createEmailUser(
        sessionBuilder,
        emailIdpConfig,
        email: email,
      );
      final managedUserSession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          authUserId.toString(),
          {
            Scope('learner.access'),
            Scope('cms.access'),
            Scope('content.manage'),
          },
        ),
      );

      final authoredCourse = await _createPublishableCourse(
        endpoints,
        managedUserSession,
        title: 'Managed user authored course',
      );
      final enrolledCourse = await _createPublishableCourse(
        endpoints,
        authorSession,
        title: 'Managed user enrolled course',
      );
      await endpoints.courseAdmin.publish(authorSession, enrolledCourse.id);
      await endpoints.course.enroll(managedUserSession, enrolledCourse.id);

      final result = await endpoints.adminGovernance.listUserCourses(
        adminSession,
        authUserId,
      );

      expect(
        result.authoredCourses.any(
          (course) => course.courseId == authoredCourse.id,
        ),
        isTrue,
      );
      expect(
        result.enrolledCourses.any(
          (course) => course.courseId == enrolledCourse.id,
        ),
        isTrue,
      );
    });

    test('reviews publication queue and moderates published courses', () async {
      final course = await _createPublishableCourse(
        endpoints,
        authorSession,
        title: 'Governance Review Course',
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

    test('freezes and unfreezes courses through admin contract', () async {
      final course = await _createPublishableCourse(
        endpoints,
        authorSession,
        title: 'Governance Frozen Course',
      );

      await endpoints.courseAdmin.publish(authorSession, course.id);

      final frozen = await endpoints.adminGovernance.freezeCourse(
        adminSession,
        course.id,
      );
      expect(frozen.contentStatus, ContentStatus.frozen);
      expect(frozen.publishedAt, isNull);

      final frozenCourses = await endpoints.adminGovernance.listFrozenCourses(
        adminSession,
      );
      expect(frozenCourses.any((item) => item.id == course.id), isTrue);

      final unfrozen = await endpoints.adminGovernance.unfreezeCourse(
        adminSession,
        course.id,
      );
      expect(unfrozen.contentStatus, ContentStatus.draft);
    });
  });
}

Future<CourseDto> _createPublishableCourse(
  TestEndpoints endpoints,
  TestSessionBuilder session, {
  required String title,
}) async {
  final course = await endpoints.courseAdmin.create(
    session,
    CreateCourseRequest(
      title: title,
      description: 'Course for governance tests',
      author: 'Author',
      category: 'Programming',
    ),
  );
  final module = await endpoints.moduleAdmin.create(
    session,
    CreateModuleRequest(
      courseId: course.id,
      title: '$title module',
      description: 'Module for governance tests',
    ),
  );
  final lesson = await endpoints.lessonAdmin.create(
    session,
    CreateLessonRequest(
      moduleId: module.id,
      title: '$title lesson',
      contentText: 'Lesson content',
    ),
  );
  await endpoints.taskAdmin.create(
    session,
    CreateTaskRequest(
      lessonId: lesson.id,
      taskType: TaskType.textInput,
      questionText: 'Question',
      correctAnswer: 'Answer',
      topic: 'Governance',
    ),
  );

  return course;
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
