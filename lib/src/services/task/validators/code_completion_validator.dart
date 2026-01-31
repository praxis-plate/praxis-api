import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_feedback_type.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_result.dart';
import 'package:praxis_server/src/services/task/validators/task_validator.dart';

class CodeCompletionValidator implements TaskValidator {
  @override
  TaskAnswerResult validate(TaskDto task, String userAnswer) {
    final isCorrect =
        _normalizeCode(userAnswer) == _normalizeCode(task.correctAnswer);

    if (isCorrect) {
      return TaskAnswerResult(
        isCorrect: true,
        feedbackType: TaskAnswerFeedbackType.correct,
        xpEarned: task.xpValue,
      );
    }

    return TaskAnswerResult(
      isCorrect: false,
      feedbackType: TaskAnswerFeedbackType.incorrect,
      feedbackMessage: 'Code does not match the expected solution',
      xpEarned: 0,
    );
  }

  String _normalizeCode(String code) {
    return code.replaceAll(RegExp(r'\s+'), ' ').trim().toLowerCase();
  }
}
