import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/task_service.dart';
import 'package:serverpod/serverpod.dart';

class GetTasksByLessonIdUseCase {
  final TaskService _taskService;

  GetTasksByLessonIdUseCase({required TaskService taskService})
    : _taskService = taskService;

  Future<List<TaskDto>> execute(Session session, int lessonId) {
    return _taskService.getTasksByLessonId(session, lessonId);
  }
}
