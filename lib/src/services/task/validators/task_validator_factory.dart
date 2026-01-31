import 'package:praxis_server/src/services/task/task_type.dart';
import 'package:praxis_server/src/services/task/validators/code_completion_validator.dart';
import 'package:praxis_server/src/services/task/validators/matching_validator.dart';
import 'package:praxis_server/src/services/task/validators/multiple_choice_validator.dart';
import 'package:praxis_server/src/services/task/validators/task_validator.dart';
import 'package:praxis_server/src/services/task/validators/text_input_validator.dart';

class TaskValidatorFactory {
  static final Map<TaskType, TaskValidator> _validators = {
    TaskType.multipleChoice: MultipleChoiceValidator(),
    TaskType.codeCompletion: CodeCompletionValidator(),
    TaskType.matching: MatchingValidator(),
    TaskType.textInput: TextInputValidator(),
  };

  static TaskValidator getValidator(TaskType taskType) {
    final validator = _validators[taskType];
    if (validator == null) {
      throw ArgumentError(
        'No validator found for task type: ${taskType.value}',
      );
    }
    return validator;
  }
}
