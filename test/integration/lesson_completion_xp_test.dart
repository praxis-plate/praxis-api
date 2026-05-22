import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/app_usecases.dart';
import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Lesson completion XP', (sessionBuilder, endpoints) {
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

    test('adds authored lesson XP only on first completion', () async {
      final lesson = await _createPublishedLesson(
        endpoints,
        cmsSession,
        completionXp: 25,
      );
      final request = CompleteLessonSessionRequest(
        lessonId: lesson.id,
        totalXpEarned: 40,
        bonusXp: 5,
        timeSpentSeconds: 90,
        totalTasks: 2,
        correctTasks: 2,
      );

      final firstCompletion = await endpoints.lesson.complete(
        learnerSession,
        request,
      );
      final repeatedCompletion = await endpoints.lesson.complete(
        learnerSession,
        request,
      );

      expect(firstCompletion.lessonCompletionXp, 25);
      expect(firstCompletion.totalXpWithBonus, 70);
      expect(firstCompletion.experiencePoints, 70);
      expect(repeatedCompletion.lessonCompletionXp, 0);
      expect(repeatedCompletion.totalXpWithBonus, 45);
      expect(repeatedCompletion.experiencePoints, 115);
    });
  });
}

Future<LessonDto> _createPublishedLesson(
  TestEndpoints endpoints,
  TestSessionBuilder cmsSession, {
  required int completionXp,
}) async {
  final course = await endpoints.courseAdmin.create(
    cmsSession,
    CreateCourseRequest(
      title: 'Completion XP course',
      description: 'Course for completion XP',
      author: 'Author',
      category: 'Dart',
    ),
  );
  final module = await endpoints.moduleAdmin.create(
    cmsSession,
    CreateModuleRequest(
      courseId: course.id,
      title: 'Completion XP module',
      description: 'Module description',
    ),
  );
  final lesson = await endpoints.lessonAdmin.create(
    cmsSession,
    CreateLessonRequest(
      moduleId: module.id,
      title: 'Completion XP lesson',
      contentText: 'Lesson content',
      completionXp: completionXp,
    ),
  );
  await endpoints.taskAdmin.create(
    cmsSession,
    CreateTaskRequest(
      lessonId: lesson.id,
      taskType: TaskType.textInput,
      questionText: 'Answer this',
      correctAnswer: 'answer',
    ),
  );
  await endpoints.courseAdmin.publish(cmsSession, course.id);
  return lesson;
}
