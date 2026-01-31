import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/course/course_service.dart';
import 'package:serverpod/serverpod.dart';

class GetCoursesUseCase {
  final CourseService _courseService;

  GetCoursesUseCase({required CourseService courseService})
    : _courseService = courseService;

  Future<List<CourseDto>> execute(
    Session session, {
    required int limit,
    required int offset,
  }) {
    return _courseService.getCourses(
      session,
      limit: limit,
      offset: offset,
    );
  }
}
