import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/app_usecases.dart';
import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Matching task authoring', (sessionBuilder, endpoints) {
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

    test('stores learner matching pairs from task updates', () async {
      final course = await endpoints.courseAdmin.create(
        cmsSession,
        CreateCourseRequest(
          title: 'Matching course',
          description: 'Course for matching authoring',
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
      final task = await endpoints.taskAdmin.create(
        cmsSession,
        CreateTaskRequest(
          lessonId: lesson.id,
          taskType: TaskType.matching,
          questionText: 'Match terms',
          topic: 'collections',
        ),
      );

      final updated = await endpoints.taskAdmin.update(
        cmsSession,
        UpdateTaskRequest(
          id: task.id,
          taskType: TaskType.matching,
          questionText: task.questionText,
          correctAnswer: '{"List":"Ordered values","Map":"Key value entries"}',
          optionsJson:
              '{"pairs":[{"left":"List","right":"Ordered values"},{"left":"Map","right":"Key value entries"}]}',
          codeTemplate: null,
          programmingLanguage: null,
          difficultyLevel: task.difficultyLevel,
          xpValue: task.xpValue,
          fallbackHint: null,
          fallbackExplanation: null,
          topic: task.topic,
        ),
      );

      expect(updated.optionsJson, contains('"pairs"'));

      await endpoints.courseAdmin.publish(cmsSession, course.id);
      final result = await endpoints.task.answer(
        learnerSession,
        task.id,
        '{"Map":"Key value entries","List":"Ordered values"}',
      );

      expect(result.isCorrect, isTrue);
    });

    test('rejects publishing matching tasks without pair data', () async {
      final course = await endpoints.courseAdmin.create(
        cmsSession,
        CreateCourseRequest(
          title: 'Invalid matching course',
          description: 'Course for matching validation',
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
          taskType: TaskType.matching,
          questionText: 'Match terms',
          topic: 'collections',
        ),
      );

      await expectLater(
        endpoints.courseAdmin.publish(cmsSession, course.id),
        throwsA(isA<ValidationException>()),
      );
    });
  });
}
