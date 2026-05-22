import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/validators/code_completion_validator.dart';
import 'package:praxis_server/src/services/task/validators/matching_validator.dart';
import 'package:praxis_server/src/services/task/validators/multiple_answer_validator.dart';
import 'package:praxis_server/src/services/task/validators/multiple_choice_validator.dart';
import 'package:praxis_server/src/services/task/validators/task_validator.dart';
import 'package:praxis_server/src/services/task/validators/text_input_validator.dart';

class TaskValidatorFactory {
  static final Map<TaskType, TaskValidator> _validators = {
    TaskType.multipleChoice: MultipleChoiceValidator(),
    TaskType.multipleAnswer: MultipleAnswerValidator(),
    TaskType.codeCompletion: CodeCompletionValidator(),
    TaskType.matching: MatchingValidator(),
    TaskType.textInput: TextInputValidator(),
  };

  static TaskValidator getValidator(TaskType taskType) {
    final validator = _validators[taskType];
    if (validator == null) {
      throw ArgumentError(
        'No validator found for task type: ${taskType.name}',
      );
    }
    return validator;
  }
}
