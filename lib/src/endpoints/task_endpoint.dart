import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TaskEndpoint extends Endpoint {
  Future<List<TaskDto>> getByLessonId(Session session, int lessonId) {
    return session.server.services.taskService.getTasksByLessonId(
      session,
      lessonId,
    );
  }
}
