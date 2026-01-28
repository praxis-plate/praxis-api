import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class LessonEndpoint extends Endpoint {
  Future<List<LessonDto>> getByCourseId(
    Session session,
    int courseId,
  ) {
    return session.server.services.lessonService.getByCourseId(
      session,
      courseId,
    );
  }

  Future<List<LessonDto>> getByModuleId(
    Session session,
    int moduleId,
  ) {
    return session.server.services.lessonService.getByModuleId(
      session,
      moduleId,
    );
  }

  Future<void> markComplete(
    Session session,
    int lessonId, {
    int timeSpentSeconds = 0,
  }) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.services.lessonService.markComplete(
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
    return session.server.services.lessonService.complete(
      session,
      request,
      authUserId: authUserId,
    );
  }
}
