import 'package:praxis_server/src/services/course/course_service.dart';
import 'package:serverpod/serverpod.dart';

class EnrollCourseUseCase {
  final CourseService _courseService;

  EnrollCourseUseCase({required CourseService courseService})
    : _courseService = courseService;

  Future<void> execute(
    Session session,
    int courseId, {
    required UuidValue authUserId,
  }) {
    return _courseService.enroll(
      session,
      courseId,
      authUserId: authUserId,
    );
  }
}
