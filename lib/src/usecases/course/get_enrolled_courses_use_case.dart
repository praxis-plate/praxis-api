import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/course/course_service.dart';
import 'package:serverpod/serverpod.dart';

class GetEnrolledCoursesUseCase {
  final CourseService _courseService;

  GetEnrolledCoursesUseCase({required CourseService courseService})
    : _courseService = courseService;

  Future<List<CourseDto>> execute(
    Session session, {
    required UuidValue authUserId,
  }) {
    return _courseService.getEnrolledCourses(
      session,
      authUserId: authUserId,
    );
  }
}
