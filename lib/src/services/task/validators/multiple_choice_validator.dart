import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_feedback_type.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_result.dart';
import 'package:praxis_server/src/services/task/validators/task_validator.dart';

class MultipleChoiceValidator implements TaskValidator {
  @override
  TaskAnswerResult validate(TaskDto task, String userAnswer) {
    final isCorrect = userAnswer.trim() == task.correctAnswer.trim();

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
      feedbackMessage: 'The correct answer is: ${task.correctAnswer}',
      xpEarned: 0,
    );
  }
}
