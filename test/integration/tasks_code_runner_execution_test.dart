import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/app_usecases.dart';
import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Code runner execution', (sessionBuilder, endpoints) {
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
      'executes code completion task against visible and hidden test cases',
      () async {
        final task = await _createExecutableCodeTask(
          cmsSession,
          endpoints,
          title: 'Executable code task',
        );

        final correctResult = await endpoints.task.answer(
          learnerSession,
          task.id,
          'input + 1',
        );
        expect(correctResult.isCorrect, isTrue);
        expect(correctResult.feedbackType, 'correct');
        expect(correctResult.passedTestCases, 2);
        expect(correctResult.totalTestCases, 2);
        expect(correctResult.testCaseResults, hasLength(2));
        expect(correctResult.testCaseResults!.first.actualOutput, '2');
        expect(correctResult.testCaseResults!.last.isHidden, isTrue);
        expect(correctResult.testCaseResults!.last.expectedOutput, isNull);

        final partialResult = await endpoints.task.answer(
          learnerSession,
          task.id,
          'input == 1 ? 2 : input',
        );
        expect(partialResult.isCorrect, isFalse);
        expect(partialResult.feedbackType, 'partiallyCorrect');
        expect(partialResult.passedTestCases, 1);
        expect(partialResult.totalTestCases, 2);

        final blockedResult = await endpoints.task.answer(
          learnerSession,
          task.id,
          "File('secret.txt').readAsStringSync()",
        );
        expect(blockedResult.isCorrect, isFalse);
        expect(blockedResult.feedbackType, 'executionError');
      },
    );

    test(
      'rejects cms test cases when executable template placeholders are missing',
      () async {
        final course = await endpoints.courseAdmin.create(
          cmsSession,
          CreateCourseRequest(
            title: 'Invalid executable template course',
            description: 'Course for invalid template validation',
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
            taskType: TaskType.codeCompletion,
            questionText: 'Write code',
            correctAnswer: 'input + 1',
            codeTemplate: 'void main() { print(___); }',
            programmingLanguage: 'dart',
            topic: 'dart',
          ),
        );

        await expectLater(
          endpoints.taskAdmin.upsertTestCases(
            cmsSession,
            UpsertTaskTestCasesRequest(
              taskId: task.id,
              testCases: [
                CmsTaskTestCaseInputDto(
                  input: '1',
                  expectedOutput: '2',
                  isHidden: false,
                ),
              ],
            ),
          ),
          throwsA(isA<ValidationException>()),
        );
      },
    );
  });
}

Future<TaskDto> _createExecutableCodeTask(
  dynamic cmsSession,
  dynamic endpoints, {
  required String title,
}) async {
  final course = await endpoints.courseAdmin.create(
    cmsSession,
    CreateCourseRequest(
      title: title,
      description: 'Course for executable code validation',
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
      taskType: TaskType.codeCompletion,
      questionText: 'Return input plus one',
      correctAnswer: 'input + 1',
      codeTemplate: '''
void main() {
  final input = {{INPUT}};
  final result = ___;
  print(result);
}
''',
      programmingLanguage: 'dart',
      topic: 'dart',
    ),
  );
  await endpoints.taskAdmin.upsertTestCases(
    cmsSession,
    UpsertTaskTestCasesRequest(
      taskId: task.id,
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
  await endpoints.courseAdmin.publish(cmsSession, course.id);
  return task;
}
