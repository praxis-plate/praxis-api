import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_result.dart';
import 'package:praxis_server/src/services/task/validators/task_validator_factory.dart';

class TaskAnswerValidationService {
  const TaskAnswerValidationService();

  TaskAnswerResult validateAnswer(TaskDto task, String userAnswer) {
    final validator = TaskValidatorFactory.getValidator(task.taskType);
    return validator.validate(task, userAnswer);
  }
}
