import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/code_execution_service.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_result.dart';
import 'package:praxis_server/src/services/task/validators/task_validator_factory.dart';

class TaskAnswerValidationService {
  final CodeExecutionService _codeExecutionService;

  const TaskAnswerValidationService({
    required CodeExecutionService codeExecutionService,
  }) : _codeExecutionService = codeExecutionService;

  Future<TaskAnswerResult> validateAnswer(
    TaskDto task,
    String userAnswer,
  ) async {
    if (_usesExecutableValidation(task)) {
      return _codeExecutionService.validateAnswer(task, userAnswer);
    }

    final validator = TaskValidatorFactory.getValidator(task.taskType);
    return validator.validate(task, userAnswer);
  }

  bool _usesExecutableValidation(TaskDto task) {
    return task.taskType == TaskType.codeCompletion &&
        task.testCases.isNotEmpty &&
        (task.codeTemplate?.trim().isNotEmpty ?? false);
  }
}
