import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/app_usecases.dart';
import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Course recommendations', (sessionBuilder, endpoints) {
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
    final coldStartLearner = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(
        const Uuid().v7obj().toString(),
        {Scope('learner.access')},
      ),
    );

    test('requires authentication', () async {
      await expectLater(
        endpoints.course.getRecommendations(sessionBuilder, limit: 5),
        throwsA(isA<ServerpodUnauthenticatedException>()),
      );
    });

    test(
      'falls back to popular top-rated published courses for cold start users',
      () async {
        final popularCourse = await _createPublishedCourse(
          endpoints,
          cmsSession,
          title: 'Popular Python',
          category: 'Python',
          rating: 4.9,
        );
        final nicheCourse = await _createPublishedCourse(
          endpoints,
          cmsSession,
          title: 'Niche Rust',
          category: 'Rust',
          rating: 4.8,
        );

        await endpoints.course.enroll(learnerOne, popularCourse.id);
        await endpoints.course.enroll(learnerTwo, popularCourse.id);

        final recommendations = await endpoints.course.getRecommendations(
          coldStartLearner,
          limit: 5,
        );

        expect(recommendations, isNotEmpty);
        expect(recommendations.first.course.id, popularCourse.id);
        expect(recommendations.first.reason, 'Popular among learners');
        expect(
          recommendations.any((item) => item.course.id == nicheCourse.id),
          isTrue,
        );
      },
    );

    test(
      'prioritizes collaborative matches and excludes enrolled or draft courses',
      () async {
        final enrolledPython = await _createPublishedCourse(
          endpoints,
          cmsSession,
          title: 'Python Basics',
          category: 'Python',
          rating: 4.0,
        );
        final collaborativeMatch = await _createPublishedCourse(
          endpoints,
          cmsSession,
          title: 'Rust Through Practice',
          category: 'Rust',
          rating: 3.7,
        );
        final higherRatedOther = await _createPublishedCourse(
          endpoints,
          cmsSession,
          title: 'Java Mastery',
          category: 'Java',
          rating: 5.0,
        );
        final draftPython = await endpoints.courseAdmin.create(
          cmsSession,
          CreateCourseRequest(
            title: 'Draft Python',
            description: 'Draft course',
            author: 'Author',
            category: 'Python',
            rating: 5.0,
          ),
        );

        await endpoints.course.enroll(learnerOne, enrolledPython.id);
        await endpoints.course.enroll(learnerTwo, enrolledPython.id);

        final enrolledStructure = await endpoints.course.getById(
          learnerOne,
          enrolledPython.id,
        );
        final learnerTwoStructure = await endpoints.course.getById(
          learnerTwo,
          enrolledPython.id,
        );
        await endpoints.lesson.markComplete(
          learnerOne,
          enrolledStructure.lessons.first.id,
          timeSpentSeconds: 180,
        );
        await endpoints.lesson.markComplete(
          learnerTwo,
          learnerTwoStructure.lessons.first.id,
          timeSpentSeconds: 120,
        );
        await endpoints.course.enroll(learnerTwo, collaborativeMatch.id);

        final collaborativeStructure = await endpoints.course.getById(
          learnerTwo,
          collaborativeMatch.id,
        );
        await endpoints.lesson.markComplete(
          learnerTwo,
          collaborativeStructure.lessons.first.id,
          timeSpentSeconds: 160,
        );

        final recommendations = await endpoints.course.getRecommendations(
          learnerOne,
          limit: 5,
        );

        expect(recommendations, isNotEmpty);
        expect(recommendations.first.course.id, collaborativeMatch.id);
        expect(
          recommendations.first.reason,
          'Based on similar learners progress',
        );
        expect(
          recommendations.any((item) => item.course.id == enrolledPython.id),
          isFalse,
        );
        expect(
          recommendations.any((item) => item.course.id == draftPython.id),
          isFalse,
        );
        expect(
          recommendations.any((item) => item.course.id == higherRatedOther.id),
          isTrue,
        );
      },
    );
  });
}

Future<CourseDto> _createPublishedCourse(
  TestEndpoints endpoints,
  TestSessionBuilder cmsSession, {
  required String title,
  required String category,
  required double rating,
}) async {
  final course = await endpoints.courseAdmin.create(
    cmsSession,
    CreateCourseRequest(
      title: title,
      description: '$title description',
      author: 'Author',
      category: category,
      rating: rating,
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
  final lesson = await endpoints.lessonAdmin.create(
    cmsSession,
    CreateLessonRequest(
      moduleId: module.id,
      title: '$title lesson',
      contentText: 'Lesson content',
      durationMinutes: 15,
    ),
  );
  await endpoints.taskAdmin.create(
    cmsSession,
    CreateTaskRequest(
      lessonId: lesson.id,
      taskType: TaskType.textInput,
      questionText: '$title question',
      correctAnswer: 'answer',
      topic: category.toLowerCase(),
    ),
  );
  return endpoints.courseAdmin.publish(cmsSession, course.id);
}
