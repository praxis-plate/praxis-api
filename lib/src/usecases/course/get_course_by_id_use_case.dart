import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/course/course_service.dart';
import 'package:serverpod/serverpod.dart';

class GetCourseByIdUseCase {
  final CourseService _courseService;

  GetCourseByIdUseCase({required CourseService courseService})
    : _courseService = courseService;

  Future<CourseDetailDto> execute(Session session, int courseId) {
    return _courseService.getCourseById(session, courseId);
  }
}
