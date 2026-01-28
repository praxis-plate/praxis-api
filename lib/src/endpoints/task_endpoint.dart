import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/task_option_data_source.dart';
import 'package:praxis_server/src/datasources/task_test_case_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/task_service.dart';
import 'package:serverpod/serverpod.dart';

class TaskEndpoint extends Endpoint {
  TaskEndpoint()
    : _taskService = TaskService(
        taskDataSource: const TaskDataSource(),
        taskOptionDataSource: const TaskOptionDataSource(),
        taskTestCaseDataSource: const TaskTestCaseDataSource(),
      );

  final TaskService _taskService;

  Future<List<TaskDto>> getByLessonId(Session session, int lessonId) {
    return _taskService.getTasksByLessonId(session, lessonId);
  }
}
