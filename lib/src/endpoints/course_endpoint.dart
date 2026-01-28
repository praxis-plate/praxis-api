import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class CourseEndpoint extends Endpoint {
  Future<List<CourseDto>> get(
    Session session, {
    required int limit,
    required int offset,
  }) {
    return session.server.services.courseService.getCourses(
      session,
      limit: limit,
      offset: offset,
    );
  }

  Future<CourseDetailDto> getById(Session session, int courseId) {
    return session.server.services.courseService.getCourseById(
      session,
      courseId,
    );
  }

  Future<List<CourseDto>> getEnrolled(Session session) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.services.courseService.getEnrolledCourses(
      session,
      authUserId: authUserId,
    );
  }

  Future<void> enroll(Session session, int courseId) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.services.courseService.enroll(
      session,
      courseId,
      authUserId: authUserId,
    );
  }

  Future<void> unenroll(Session session, int courseId) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.services.courseService.unenroll(
      session,
      courseId,
      authUserId: authUserId,
    );
  }

  Future<CourseStructureDto> getTableOfContents(Session session, int courseId) {
    return session.server.services.courseService.getCourseStructure(
      session,
      courseId,
    );
  }
}
