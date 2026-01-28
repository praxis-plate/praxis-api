import 'package:praxis_server/src/services/course/course_service.dart';
import 'package:serverpod/serverpod.dart';

class UnenrollCourseUseCase {
  final CourseService _courseService;

  UnenrollCourseUseCase({required CourseService courseService})
    : _courseService = courseService;

  Future<void> execute(
    Session session,
    int courseId, {
    required UuidValue authUserId,
  }) {
    return _courseService.unenroll(
      session,
      courseId,
      authUserId: authUserId,
    );
  }
}
