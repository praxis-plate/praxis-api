import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_result.dart';

abstract class TaskValidator {
  TaskAnswerResult validate(TaskDto task, String userAnswer);
}
