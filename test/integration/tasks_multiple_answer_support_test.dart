import 'dart:convert';

import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/app_usecases.dart';
import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Multiple-answer task support', (sessionBuilder, endpoints) {
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

    test(
      'accepts exact multiple-answer selections and rejects partial or invalid payloads',
      () async {
        final course = await endpoints.courseAdmin.create(
          cmsSession,
          CreateCourseRequest(
            title: 'Multiple-answer course',
            description: 'Course for multiple-answer support',
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
            taskType: TaskType.multipleAnswer,
            questionText: 'Select all correct options',
            topic: 'collections',
          ),
        );
        await endpoints.taskAdmin.upsertOptions(
          cmsSession,
          UpsertTaskOptionsRequest(
            taskId: task.id,
            options: [
              CmsTaskOptionInputDto(optionText: 'List', isCorrect: true),
              CmsTaskOptionInputDto(optionText: 'Map', isCorrect: true),
              CmsTaskOptionInputDto(optionText: 'Class', isCorrect: false),
            ],
          ),
        );
        await endpoints.courseAdmin.publish(cmsSession, course.id);

        final correctResult = await endpoints.task.answer(
          learnerSession,
          task.id,
          jsonEncode(['Map', 'List']),
        );
        expect(correctResult.isCorrect, isTrue);
        expect(correctResult.feedbackType, 'correct');

        final partialResult = await endpoints.task.answer(
          learnerSession,
          task.id,
          jsonEncode(['List']),
        );
        expect(partialResult.isCorrect, isFalse);
        expect(partialResult.feedbackType, 'incorrect');

        final invalidFormatResult = await endpoints.task.answer(
          learnerSession,
          task.id,
          'List',
        );
        expect(invalidFormatResult.isCorrect, isFalse);
        expect(invalidFormatResult.feedbackType, 'invalidFormat');
      },
    );

    test(
      'rejects multiple-answer cms configuration with fewer than two correct options',
      () async {
        final course = await endpoints.courseAdmin.create(
          cmsSession,
          CreateCourseRequest(
            title: 'Invalid multiple-answer course',
            description: 'Course for validation',
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
            taskType: TaskType.multipleAnswer,
            questionText: 'Select all correct options',
            topic: 'collections',
          ),
        );

        await expectLater(
          endpoints.taskAdmin.upsertOptions(
            cmsSession,
            UpsertTaskOptionsRequest(
              taskId: task.id,
              options: [
                CmsTaskOptionInputDto(optionText: 'List', isCorrect: true),
                CmsTaskOptionInputDto(optionText: 'Map', isCorrect: false),
              ],
            ),
          ),
          throwsA(isA<ValidationException>()),
        );
      },
    );
  });
}
