import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/app_usecases.dart';
import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('External integration admin', (sessionBuilder, endpoints) {
    setUpAll(() {
      Serverpod.instance.server.services = AppServices.build(
        Serverpod.instance,
      );
      Serverpod.instance.server.useCases = AppUseCases.build(
        Serverpod.instance,
        Serverpod.instance.server.services,
      );
    });

    final cmsSession = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(
        const Uuid().v7obj().toString(),
        {Scope('content.manage')},
      ),
    );

    final learnerSession = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(
        const Uuid().v7obj().toString(),
        {Scope('learner.access')},
      ),
    );

    test('lists supported lms and video providers for cms', () async {
      final providers = await endpoints.externalIntegrationAdmin.listProviders(
        cmsSession,
      );

      expect(providers, hasLength(4));
      expect(
        providers.any(
          (provider) =>
              provider.provider == ExternalIntegrationProvider.moodle &&
              provider.kind == ExternalIntegrationKind.lms,
        ),
        isTrue,
      );
      expect(
        providers.any(
          (provider) =>
              provider.provider == ExternalIntegrationProvider.zoom &&
              provider.kind == ExternalIntegrationKind.videoConferencing,
        ),
        isTrue,
      );

      await expectLater(
        endpoints.externalIntegrationAdmin.listProviders(learnerSession),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
    });

    test(
      'syncs course to external lms provider with deterministic export summary',
      () async {
        final lesson = await _createCourseGraph(cmsSession, endpoints);

        final synced = await endpoints.externalIntegrationAdmin.syncCourse(
          cmsSession,
          SyncCourseToExternalProviderRequest(
            provider: ExternalIntegrationProvider.moodle,
            baseUrl: 'https://moodle.example.edu',
            accessToken: 'token-123',
            accountIdentifier: 'author@university.edu',
            courseId: lesson.courseId,
          ),
        );

        expect(synced.provider, ExternalIntegrationProvider.moodle);
        expect(synced.kind, ExternalIntegrationKind.lms);
        expect(synced.courseId, lesson.courseId);
        expect(synced.contentStatus, ContentStatus.draft);
        expect(synced.externalCourseId, contains('moodle-${lesson.courseId}-'));
        expect(
          synced.externalCourseUrl,
          'https://moodle.example.edu/courses/${synced.externalCourseId}',
        );
        expect(synced.exportedModules, 1);
        expect(synced.exportedLessons, 1);
        expect(synced.exportedTasks, 1);
      },
    );

    test(
      'provisions external video session and updates lesson videoUrl',
      () async {
        final lesson = await _createCourseGraph(cmsSession, endpoints);

        final session = await endpoints.externalIntegrationAdmin
            .provisionLessonVideoSession(
              cmsSession,
              ProvisionExternalVideoSessionRequest(
                provider: ExternalIntegrationProvider.zoom,
                baseUrl: 'https://video.example.edu',
                accessToken: 'oauth-token',
                accountIdentifier: 'author@university.edu',
                lessonId: lesson.lessonId,
                sessionTitle: 'Live seminar',
              ),
            );

        expect(session.provider, ExternalIntegrationProvider.zoom);
        expect(session.kind, ExternalIntegrationKind.videoConferencing);
        expect(session.lessonId, lesson.lessonId);
        expect(session.lessonVideoUrl, contains('/join/'));
        expect(session.hostUrl, contains('/host/'));
        expect(session.meetingCode, contains('ZO-'));

        final lessons = await endpoints.lessonAdmin.list(
          cmsSession,
          lesson.moduleId,
        );
        final updatedLesson = lessons.firstWhere(
          (item) => item.id == lesson.lessonId,
        );
        expect(updatedLesson.videoUrl, session.lessonVideoUrl);
      },
    );

    test('rejects provider kind mismatch for lms sync', () async {
      final lesson = await _createCourseGraph(cmsSession, endpoints);

      await expectLater(
        endpoints.externalIntegrationAdmin.syncCourse(
          cmsSession,
          SyncCourseToExternalProviderRequest(
            provider: ExternalIntegrationProvider.zoom,
            baseUrl: 'https://video.example.edu',
            accessToken: 'oauth-token',
            courseId: lesson.courseId,
          ),
        ),
        throwsA(isA<ValidationException>()),
      );
    });
  });
}

Future<_CreatedLessonRefs> _createCourseGraph(
  dynamic cmsSession,
  dynamic endpoints,
) async {
  final course = await endpoints.courseAdmin.create(
    cmsSession,
    CreateCourseRequest(
      title: 'External integrations course',
      description: 'Course for external integration tests',
      author: 'Author',
      category: 'Programming',
    ),
  );
  final module = await endpoints.moduleAdmin.create(
    cmsSession,
    CreateModuleRequest(
      courseId: course.id,
      title: 'Module',
      description: 'Description',
    ),
  );
  final lesson = await endpoints.lessonAdmin.create(
    cmsSession,
    CreateLessonRequest(
      moduleId: module.id,
      title: 'Lesson',
      contentText: 'Lesson content',
      durationMinutes: 10,
    ),
  );
  await endpoints.taskAdmin.create(
    cmsSession,
    CreateTaskRequest(
      lessonId: lesson.id,
      taskType: TaskType.textInput,
      questionText: 'Question',
      correctAnswer: 'Answer',
      topic: 'basics',
    ),
  );

  return _CreatedLessonRefs(
    courseId: course.id,
    moduleId: module.id,
    lessonId: lesson.id,
  );
}

class _CreatedLessonRefs {
  final int courseId;
  final int moduleId;
  final int lessonId;

  const _CreatedLessonRefs({
    required this.courseId,
    required this.moduleId,
    required this.lessonId,
  });
}
