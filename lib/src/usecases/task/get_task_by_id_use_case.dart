import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/task_service.dart';
import 'package:serverpod/serverpod.dart';

class GetTaskByIdUseCase {
  final TaskService _taskService;

  GetTaskByIdUseCase({required TaskService taskService})
    : _taskService = taskService;

  Future<TaskDto> execute(Session session, int taskId) {
    return _taskService.getTaskById(session, taskId);
  }
}
