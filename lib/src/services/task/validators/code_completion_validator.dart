import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_feedback_type.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_result.dart';
import 'package:praxis_server/src/services/task/validators/task_validator.dart';

class CodeCompletionValidator implements TaskValidator {
  static const _legacyUserCodePlaceholder = '___';

  @override
  TaskAnswerResult validate(TaskDto task, String userAnswer) {
    final isCorrect = _matchesAnswerContract(task, userAnswer);

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
      feedbackMessage:
          task.fallbackExplanation ??
          'Code does not match the expected solution',
      xpEarned: 0,
    );
  }

  String _normalizeCode(String code) {
    return code.replaceAll(RegExp(r'\s+'), ' ').trim().toLowerCase();
  }

  bool _matchesAnswerContract(TaskDto task, String userAnswer) {
    final normalizedUserAnswer = _normalizeCode(userAnswer);
    final normalizedCorrectAnswer = _normalizeCode(task.correctAnswer);
    if (normalizedUserAnswer == normalizedCorrectAnswer) {
      return true;
    }

    final template = task.codeTemplate;
    if (template == null || !template.contains(_legacyUserCodePlaceholder)) {
      return false;
    }

    final renderedUserAnswer = _normalizeCode(
      template.replaceAll(_legacyUserCodePlaceholder, userAnswer),
    );
    if (renderedUserAnswer == normalizedCorrectAnswer) {
      return true;
    }

    final renderedCorrectAnswer = _normalizeCode(
      template.replaceAll(_legacyUserCodePlaceholder, task.correctAnswer),
    );
    return normalizedUserAnswer == renderedCorrectAnswer;
  }
}
