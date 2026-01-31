import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TaskEndpoint extends Endpoint {
  Future<TaskDto> getById(Session session, int taskId) {
    return session.server.useCases.getTaskByIdUseCase.execute(
      session,
      taskId,
    );
  }

  Future<List<TaskDto>> getByLessonId(Session session, int lessonId) {
    return session.server.useCases.getTasksByLessonIdUseCase.execute(
      session,
      lessonId,
    );
  }

  Future<Map<String, dynamic>> answer(
    Session session,
    int taskId,
    String userAnswer,
  ) async {
    final result = await session.server.useCases.taskAnswerUseCase.execute(
      session,
      taskId,
      userAnswer,
    );
    return result.toJson();
  }
}
