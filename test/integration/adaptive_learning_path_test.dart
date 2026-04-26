import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/app_usecases.dart';
import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Adaptive learning path', (sessionBuilder, endpoints) {
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

    test('returns remedial next step for weak upcoming topic', () async {
      final course = await _createCourseWithLessonTopics(
        endpoints,
        cmsSession,
        title: 'Remedial Path Course',
        lessonTopics: const [
          ['basics'],
          ['loops'],
          ['collections'],
        ],
      );

      await endpoints.course.enroll(learnerSession, course.id);

      final courseDetail = await endpoints.course.getById(
        learnerSession,
        course.id,
      );
      final firstLesson = courseDetail.lessons[0];
      final secondLesson = courseDetail.lessons[1];

      await endpoints.task.answer(
        learnerSession,
        courseDetail.tasks
            .firstWhere((task) => task.lessonId == firstLesson.id)
            .id,
        'correct-basics',
      );
      await endpoints.lesson.markComplete(
        learnerSession,
        firstLesson.id,
        timeSpentSeconds: 120,
      );

      await endpoints.task.answer(
        learnerSession,
        courseDetail.tasks
            .firstWhere((task) => task.lessonId == secondLesson.id)
            .id,
        'wrong-answer',
      );
      await endpoints.task.answer(
        learnerSession,
        courseDetail.tasks
            .firstWhere((task) => task.lessonId == secondLesson.id)
            .id,
        'still-wrong',
      );

      final adaptivePath = await endpoints.course.getAdaptiveLearningPath(
        learnerSession,
        course.id,
      );

      expect(adaptivePath.pathType, AdaptiveLearningPathType.remedial);
      expect(adaptivePath.recommendedLessonId, secondLesson.id);
      expect(adaptivePath.focusTopic, 'loops');
      expect(
        adaptivePath.reason,
        contains('Low mastery in loops'),
      );
    });

    test('returns accelerated next step for strong upcoming topic', () async {
      final course = await _createCourseWithLessonTopics(
        endpoints,
        cmsSession,
        title: 'Accelerated Path Course',
        lessonTopics: const [
          ['basics'],
          ['basics'],
          ['functions'],
        ],
      );

      await endpoints.course.enroll(learnerSession, course.id);

      final courseDetail = await endpoints.course.getById(
        learnerSession,
        course.id,
      );
      final firstLesson = courseDetail.lessons[0];
      final secondLesson = courseDetail.lessons[1];
      final thirdLesson = courseDetail.lessons[2];

      await endpoints.task.answer(
        learnerSession,
        courseDetail.tasks
            .firstWhere((task) => task.lessonId == firstLesson.id)
            .id,
        'correct-basics',
      );
      await endpoints.lesson.markComplete(
        learnerSession,
        firstLesson.id,
        timeSpentSeconds: 120,
      );

      await endpoints.task.answer(
        learnerSession,
        courseDetail.tasks
            .firstWhere((task) => task.lessonId == secondLesson.id)
            .id,
        'correct-basics',
      );
      await endpoints.task.answer(
        learnerSession,
        courseDetail.tasks
            .firstWhere((task) => task.lessonId == secondLesson.id)
            .id,
        'correct-basics',
      );

      final adaptivePath = await endpoints.course.getAdaptiveLearningPath(
        learnerSession,
        course.id,
      );

      expect(adaptivePath.pathType, AdaptiveLearningPathType.accelerated);
      expect(adaptivePath.recommendedLessonId, thirdLesson.id);
      expect(adaptivePath.supportingLessonId, secondLesson.id);
      expect(
        adaptivePath.reason,
        contains('High mastery in upcoming topics'),
      );
    });
  });
}

Future<CourseDto> _createCourseWithLessonTopics(
  TestEndpoints endpoints,
  TestSessionBuilder cmsSession, {
  required String title,
  required List<List<String>> lessonTopics,
}) async {
  final course = await endpoints.courseAdmin.create(
    cmsSession,
    CreateCourseRequest(
      title: title,
      description: '$title description',
      author: 'Author',
      category: 'Dart',
      rating: 4.8,
    ),
  );
  final module = await endpoints.moduleAdmin.create(
    cmsSession,
    CreateModuleRequest(
      courseId: course.id,
      title: '$title module',
      description: 'Module description',
    ),
  );

  for (var lessonIndex = 0; lessonIndex < lessonTopics.length; lessonIndex++) {
    final lesson = await endpoints.lessonAdmin.create(
      cmsSession,
      CreateLessonRequest(
        moduleId: module.id,
        title: '$title lesson ${lessonIndex + 1}',
        contentText: 'Lesson content',
        durationMinutes: 15,
      ),
    );

    final topics = lessonTopics[lessonIndex];
    for (var taskIndex = 0; taskIndex < topics.length; taskIndex++) {
      final topic = topics[taskIndex];
      await endpoints.taskAdmin.create(
        cmsSession,
        CreateTaskRequest(
          lessonId: lesson.id,
          taskType: TaskType.textInput,
          questionText: '$title question ${lessonIndex + 1}.$taskIndex',
          correctAnswer: 'correct-$topic',
          topic: topic,
        ),
      );
    }
  }

  return endpoints.courseAdmin.publish(cmsSession, course.id);
}
