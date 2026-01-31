import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/course/course_service.dart';
import 'package:serverpod/serverpod.dart';

class GetCourseTableOfContentsUseCase {
  final CourseService _courseService;

  GetCourseTableOfContentsUseCase({required CourseService courseService})
    : _courseService = courseService;

  Future<CourseStructureDto> execute(Session session, int courseId) {
    return _courseService.getCourseStructure(session, courseId);
  }
}
