import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class CourseEndpoint extends Endpoint {
  Future<List<CourseDto>> get(
    Session session, {
    required int limit,
    required int offset,
  }) {
    return session.server.useCases.getCoursesUseCase.execute(
      session,
      limit: limit,
      offset: offset,
    );
  }

  Future<CourseDetailDto> getById(Session session, int courseId) {
    return session.server.useCases.getCourseByIdUseCase.execute(
      session,
      courseId,
    );
  }

  Future<List<CourseDto>> getEnrolled(Session session) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.getEnrolledCoursesUseCase.execute(
      session,
      authUserId: authUserId,
    );
  }

  Future<void> enroll(Session session, int courseId) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.enrollCourseUseCase.execute(
      session,
      courseId,
      authUserId: authUserId,
    );
  }

  Future<void> unenroll(Session session, int courseId) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.unenrollCourseUseCase.execute(
      session,
      courseId,
      authUserId: authUserId,
    );
  }

  Future<List<CourseRecommendationDto>> getRecommendations(
    Session session, {
    int limit = 5,
  }) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.getPersonalizedRecommendationsUseCase
        .execute(
          session,
          authUserId: authUserId,
          limit: limit,
        );
  }

  Future<CourseStructureDto> getTableOfContents(Session session, int courseId) {
    return session.server.useCases.getCourseTableOfContentsUseCase.execute(
      session,
      courseId,
    );
  }
}
