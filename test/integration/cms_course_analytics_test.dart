import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/app_usecases.dart';
import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('CMS course analytics', (sessionBuilder, endpoints) {
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
    final learnerOne = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(
        const Uuid().v7obj().toString(),
        {Scope('learner.access')},
      ),
    );
    final learnerTwo = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(
        const Uuid().v7obj().toString(),
        {Scope('learner.access')},
      ),
    );

    test('rejects users without content.manage', () async {
      await expectLater(
        endpoints.courseAnalyticsAdmin.getDashboard(
          learnerOne,
          1,
          commonWrongAnswersLimit: 10,
        ),
        throwsA(isA<ServerpodInsufficientAccessException>()),
      );
    });

    test(
      'builds aggregated dashboard from enrollments progress and attempts',
      () async {
        final course = await endpoints.courseAdmin.create(
          cmsSession,
          CreateCourseRequest(
            title: 'Analytics Course',
            description: 'Analytics description',
            author: 'Author',
            category: 'Analytics',
          ),
        );
        final module = await endpoints.moduleAdmin.create(
          cmsSession,
          CreateModuleRequest(
            courseId: course.id,
            title: 'Module A',
            description: 'Module description',
          ),
        );
        final lessonOne = await endpoints.lessonAdmin.create(
          cmsSession,
          CreateLessonRequest(
            moduleId: module.id,
            title: 'Lesson 1',
            contentText: 'Lesson 1 content',
            durationMinutes: 15,
          ),
        );
        final lessonTwo = await endpoints.lessonAdmin.create(
          cmsSession,
          CreateLessonRequest(
            moduleId: module.id,
            title: 'Lesson 2',
            contentText: 'Lesson 2 content',
            durationMinutes: 20,
          ),
        );
        final taskOne = await endpoints.taskAdmin.create(
          cmsSession,
          CreateTaskRequest(
            lessonId: lessonOne.id,
            taskType: TaskType.textInput,
            questionText: 'Capital of France?',
            correctAnswer: 'Paris',
            topic: 'geography',
          ),
        );
        final taskTwo = await endpoints.taskAdmin.create(
          cmsSession,
          CreateTaskRequest(
            lessonId: lessonTwo.id,
            taskType: TaskType.multipleChoice,
            questionText: '2 + 2 = ?',
            correctAnswer: '4',
            topic: 'math',
          ),
        );
        await endpoints.taskAdmin.upsertOptions(
          cmsSession,
          UpsertTaskOptionsRequest(
            taskId: taskTwo.id,
            options: [
              CmsTaskOptionInputDto(optionText: '3', isCorrect: false),
              CmsTaskOptionInputDto(optionText: '4', isCorrect: true),
            ],
          ),
        );
        await endpoints.courseAdmin.publish(cmsSession, course.id);

        await endpoints.course.enroll(learnerOne, course.id);
        await endpoints.course.enroll(learnerTwo, course.id);

        await endpoints.lesson.markComplete(
          learnerOne,
          lessonOne.id,
          timeSpentSeconds: 120,
        );
        await endpoints.lesson.markComplete(
          learnerOne,
          lessonTwo.id,
          timeSpentSeconds: 180,
        );
        await endpoints.lesson.markComplete(
          learnerTwo,
          lessonOne.id,
          timeSpentSeconds: 90,
        );

        await endpoints.task.answer(learnerOne, taskOne.id, 'London');
        await endpoints.task.answer(learnerTwo, taskOne.id, 'london');
        await endpoints.task.answer(learnerOne, taskOne.id, 'Paris');
        await endpoints.task.answer(learnerOne, taskTwo.id, '3');
        await endpoints.task.answer(learnerTwo, taskTwo.id, '4');

        final dashboard = await endpoints.courseAnalyticsAdmin.getDashboard(
          cmsSession,
          course.id,
          commonWrongAnswersLimit: 10,
        );

        expect(dashboard.summary.courseId, course.id);
        expect(dashboard.summary.enrollmentsCount, 2);
        expect(dashboard.summary.completedEnrollmentsCount, 1);
        expect(dashboard.summary.totalLessons, 2);
        expect(dashboard.summary.totalTasks, 2);
        expect(dashboard.summary.totalAttempts, 5);
        expect(dashboard.summary.incorrectAttempts, 3);
        expect(dashboard.summary.completionRate, 50);
        expect(dashboard.summary.averageLessonsCompleted, 1.5);
        expect(dashboard.summary.averageProgressPercentage, 75);
        expect(dashboard.summary.averageCompletionTimeSeconds, 300);

        final lessonOneAnalytics = dashboard.lessons.firstWhere(
          (lesson) => lesson.lessonId == lessonOne.id,
        );
        expect(lessonOneAnalytics.startedLearners, 2);
        expect(lessonOneAnalytics.completedLearners, 2);
        expect(lessonOneAnalytics.completionRate, 100);
        expect(lessonOneAnalytics.averageTimeSpentSeconds, 105);
        expect(lessonOneAnalytics.dropOffCount, 0);

        final lessonTwoAnalytics = dashboard.lessons.firstWhere(
          (lesson) => lesson.lessonId == lessonTwo.id,
        );
        expect(lessonTwoAnalytics.startedLearners, 1);
        expect(lessonTwoAnalytics.completedLearners, 1);
        expect(lessonTwoAnalytics.completionRate, 50);
        expect(lessonTwoAnalytics.averageTimeSpentSeconds, 180);
        expect(lessonTwoAnalytics.dropOffCount, 0);

        final taskOneAnalytics = dashboard.tasks.firstWhere(
          (task) => task.taskId == taskOne.id,
        );
        expect(taskOneAnalytics.totalAttempts, 3);
        expect(taskOneAnalytics.correctAttempts, 1);
        expect(taskOneAnalytics.incorrectAttempts, 2);
        expect(taskOneAnalytics.accuracyRate, closeTo(33.333, 0.01));

        final taskTwoAnalytics = dashboard.tasks.firstWhere(
          (task) => task.taskId == taskTwo.id,
        );
        expect(taskTwoAnalytics.totalAttempts, 2);
        expect(taskTwoAnalytics.correctAttempts, 1);
        expect(taskTwoAnalytics.incorrectAttempts, 1);
        expect(taskTwoAnalytics.accuracyRate, 50);

        expect(dashboard.commonWrongAnswers, isNotEmpty);
        expect(dashboard.commonWrongAnswers.first.taskId, taskOne.id);
        expect(dashboard.commonWrongAnswers.first.answerText, 'london');
        expect(dashboard.commonWrongAnswers.first.occurrences, 2);
      },
    );
  });
}
