import 'package:praxis_server/src/services/task/entities/task_answer_result.dart';
import 'package:praxis_server/src/services/task/task_service.dart';
import 'package:serverpod/serverpod.dart';

class TaskAnswerUseCase {
  final TaskService _taskService;

  TaskAnswerUseCase({required TaskService taskService})
    : _taskService = taskService;

  Future<TaskAnswerResult> execute(
    Session session,
    int taskId,
    String userAnswer,
  ) async {
    final task = await _taskService.getTaskById(session, taskId);
    return _taskService.validateAnswer(task, userAnswer);
  }
}
