import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/app_usecases.dart';
import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('CMS admin API', (sessionBuilder, endpoints) {
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

    test('rejects users without content.manage', () async {
      await expectLater(
        endpoints.courseAdmin.list(learnerSession),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
      await expectLater(
        endpoints.moduleAdmin.list(learnerSession, 1),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
      await expectLater(
        endpoints.lessonAdmin.list(learnerSession, 1),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
      await expectLater(
        endpoints.taskAdmin.list(learnerSession, 1),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
    });

    test(
      'draft course stays hidden for learner API until publish and after unpublish',
      () async {
        final course = await endpoints.courseAdmin.create(
          cmsSession,
          CreateCourseRequest(
            title: 'Draft CMS Course',
            description: 'Hidden until published',
            author: 'Author',
            category: 'Programming',
          ),
        );
        final module = await endpoints.moduleAdmin.create(
          cmsSession,
          CreateModuleRequest(
            courseId: course.id,
            title: 'Module',
            description: 'Module description',
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
            topic: 'Basics',
          ),
        );

        expect(course.contentStatus, ContentStatus.draft);
        expect(course.publishedAt, isNull);

        final learnerCourses = await endpoints.course.get(
          sessionBuilder,
          limit: 50,
          offset: 0,
        );
        expect(learnerCourses.any((item) => item.id == course.id), isFalse);
        await expectLater(
          endpoints.course.getById(sessionBuilder, course.id),
          throwsA(isA<NotFoundException>()),
        );
        expect(await endpoints.module.get(sessionBuilder, course.id), isEmpty);
        expect(
          await endpoints.lesson.getByCourseId(sessionBuilder, course.id),
          isEmpty,
        );
        expect(
          await endpoints.task.getByLessonId(sessionBuilder, lesson.id),
          isEmpty,
        );

        final publishedCourse = await endpoints.courseAdmin.publish(
          cmsSession,
          course.id,
        );
        expect(publishedCourse.contentStatus, ContentStatus.published);
        expect(publishedCourse.publishedAt, isNotNull);

        final visibleCourses = await endpoints.course.get(
          sessionBuilder,
          limit: 50,
          offset: 0,
        );
        expect(visibleCourses.any((item) => item.id == course.id), isTrue);
        expect(
          await endpoints.module.get(sessionBuilder, course.id),
          isNotEmpty,
        );
        expect(
          await endpoints.lesson.getByCourseId(sessionBuilder, course.id),
          isNotEmpty,
        );
        expect(
          await endpoints.task.getByLessonId(sessionBuilder, lesson.id),
          isNotEmpty,
        );

        final unpublishedCourse = await endpoints.courseAdmin.unpublish(
          cmsSession,
          course.id,
        );
        expect(unpublishedCourse.contentStatus, ContentStatus.draft);
        expect(unpublishedCourse.publishedAt, isNull);
        expect(await endpoints.module.get(sessionBuilder, course.id), isEmpty);
        expect(
          await endpoints.lesson.getByCourseId(sessionBuilder, course.id),
          isEmpty,
        );
        expect(
          await endpoints.task.getByLessonId(sessionBuilder, lesson.id),
          isEmpty,
        );
      },
    );

    test(
      'supports course updates, reorder, and upsert flows for cms content',
      () async {
        final createdCourse = await endpoints.courseAdmin.create(
          cmsSession,
          CreateCourseRequest(
            title: 'CMS Course',
            description: 'Description',
            author: 'Author',
            category: 'Backend',
            thumbnailUrl: 'https://example.com/thumb.png',
          ),
        );
        final updatedCourse = await endpoints.courseAdmin.update(
          cmsSession,
          UpdateCourseRequest(
            id: createdCourse.id,
            title: 'CMS Course Updated',
            description: 'Updated description',
            author: 'Updated Author',
            category: 'API',
            priceInCoins: 25,
            durationMinutes: 120,
            rating: 4.8,
            thumbnailUrl: 'https://example.com/thumb-updated.png',
            coverImage: 'https://example.com/cover.png',
          ),
        );
        expect(updatedCourse.title, 'CMS Course Updated');
        expect(
          updatedCourse.updatedAt.isBefore(createdCourse.updatedAt),
          isFalse,
        );

        final firstModule = await endpoints.moduleAdmin.create(
          cmsSession,
          CreateModuleRequest(
            courseId: createdCourse.id,
            title: 'First module',
            description: 'First description',
          ),
        );
        final secondModule = await endpoints.moduleAdmin.create(
          cmsSession,
          CreateModuleRequest(
            courseId: createdCourse.id,
            title: 'Second module',
            description: 'Second description',
          ),
        );
        final reorderedModules = await endpoints.moduleAdmin.reorder(
          cmsSession,
          ReorderModulesRequest(
            courseId: createdCourse.id,
            orderedModuleIds: [secondModule.id, firstModule.id],
          ),
        );
        expect(reorderedModules.map((item) => item.id), [
          secondModule.id,
          firstModule.id,
        ]);
        expect(reorderedModules.map((item) => item.orderIndex), [0, 1]);

        final firstLesson = await endpoints.lessonAdmin.create(
          cmsSession,
          CreateLessonRequest(
            moduleId: secondModule.id,
            title: 'First lesson',
            contentText: 'Content 1',
            durationMinutes: 15,
          ),
        );
        final secondLesson = await endpoints.lessonAdmin.create(
          cmsSession,
          CreateLessonRequest(
            moduleId: secondModule.id,
            title: 'Second lesson',
            contentText: 'Content 2',
            durationMinutes: 20,
          ),
        );
        final reorderedLessons = await endpoints.lessonAdmin.reorder(
          cmsSession,
          ReorderLessonsRequest(
            moduleId: secondModule.id,
            orderedLessonIds: [secondLesson.id, firstLesson.id],
          ),
        );
        expect(reorderedLessons.map((item) => item.id), [
          secondLesson.id,
          firstLesson.id,
        ]);
        expect(reorderedLessons.map((item) => item.orderIndex), [0, 1]);

        final multipleChoiceTask = await endpoints.taskAdmin.create(
          cmsSession,
          CreateTaskRequest(
            lessonId: secondLesson.id,
            taskType: TaskType.multipleChoice,
            questionText: 'Pick the right answer',
            topic: 'quiz',
          ),
        );
        final codeTask = await endpoints.taskAdmin.create(
          cmsSession,
          CreateTaskRequest(
            lessonId: secondLesson.id,
            taskType: TaskType.codeCompletion,
            questionText: 'Write code',
            correctAnswer: 'return 42;',
            topic: 'code',
          ),
        );

        final initialOptions = await endpoints.taskAdmin.upsertOptions(
          cmsSession,
          UpsertTaskOptionsRequest(
            taskId: multipleChoiceTask.id,
            options: [
              CmsTaskOptionInputDto(optionText: 'Wrong', isCorrect: false),
              CmsTaskOptionInputDto(optionText: 'Correct', isCorrect: true),
            ],
          ),
        );
        final replacedOptions = await endpoints.taskAdmin.upsertOptions(
          cmsSession,
          UpsertTaskOptionsRequest(
            taskId: multipleChoiceTask.id,
            options: [
              CmsTaskOptionInputDto(
                id: initialOptions[1].id,
                optionText: 'Correct updated',
                isCorrect: true,
              ),
              CmsTaskOptionInputDto(
                optionText: 'Another wrong',
                isCorrect: false,
              ),
            ],
          ),
        );
        expect(replacedOptions, hasLength(2));
        expect(replacedOptions.first.optionText, 'Correct updated');
        expect(replacedOptions.first.orderIndex, 0);

        final initialTestCases = await endpoints.taskAdmin.upsertTestCases(
          cmsSession,
          UpsertTaskTestCasesRequest(
            taskId: codeTask.id,
            testCases: [
              CmsTaskTestCaseInputDto(
                input: '1',
                expectedOutput: '2',
                isHidden: false,
              ),
              CmsTaskTestCaseInputDto(
                input: '2',
                expectedOutput: '3',
                isHidden: true,
              ),
            ],
          ),
        );
        final replacedTestCases = await endpoints.taskAdmin.upsertTestCases(
          cmsSession,
          UpsertTaskTestCasesRequest(
            taskId: codeTask.id,
            testCases: [
              CmsTaskTestCaseInputDto(
                id: initialTestCases.first.id,
                input: '10',
                expectedOutput: '11',
                isHidden: false,
              ),
            ],
          ),
        );
        expect(replacedTestCases, hasLength(1));
        expect(replacedTestCases.first.input, '10');
        expect(replacedTestCases.first.orderIndex, 0);

        final reorderedTasks = await endpoints.taskAdmin.reorder(
          cmsSession,
          ReorderTasksRequest(
            lessonId: secondLesson.id,
            orderedTaskIds: [codeTask.id, multipleChoiceTask.id],
          ),
        );
        expect(reorderedTasks.map((item) => item.id), [
          codeTask.id,
          multipleChoiceTask.id,
        ]);
        expect(reorderedTasks.map((item) => item.orderIndex), [0, 1]);

        final cmsCourses = await endpoints.courseAdmin.list(
          cmsSession,
          status: ContentStatus.draft,
          query: 'Updated',
        );
        expect(cmsCourses.any((item) => item.id == createdCourse.id), isTrue);

        await expectLater(
          endpoints.moduleAdmin.reorder(
            cmsSession,
            ReorderModulesRequest(
              courseId: createdCourse.id,
              orderedModuleIds: [firstModule.id],
            ),
          ),
          throwsA(isA<ValidationException>()),
        );
      },
    );
  });
}
