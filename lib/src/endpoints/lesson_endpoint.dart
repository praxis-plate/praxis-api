import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class LessonEndpoint extends Endpoint {
  Future<List<LessonDto>> getByCourseId(
    Session session,
    int courseId,
  ) {
    return session.server.useCases.getLessonsByCourseIdUseCase.execute(
      session,
      courseId,
    );
  }

  Future<List<LessonDto>> getByModuleId(
    Session session,
    int moduleId,
  ) {
    return session.server.useCases.getLessonsByModuleIdUseCase.execute(
      session,
      moduleId,
    );
  }

  Future<LessonDto> getById(
    Session session,
    int lessonId,
  ) {
    return session.server.useCases.getLessonByIdUseCase.execute(
      session,
      lessonId,
    );
  }

  Future<List<LessonProgressDto>> getProgressByCourseId(
    Session session,
    int courseId,
  ) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.getCourseLessonProgressUseCase.execute(
      session,
      authUserId: authUserId,
      courseId: courseId,
    );
  }

  Future<void> markComplete(
    Session session,
    int lessonId, {
    int timeSpentSeconds = 0,
  }) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.markLessonCompleteUseCase.execute(
      session,
      authUserId: authUserId,
      lessonId: lessonId,
      timeSpentSeconds: timeSpentSeconds,
    );
  }

  Future<LessonCompletionResultDto> complete(
    Session session,
    CompleteLessonSessionRequest request,
  ) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.completeLessonUseCase.execute(
      session,
      request,
      authUserId: authUserId,
    );
  }
}
