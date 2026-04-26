import 'dart:convert';

import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_feedback_type.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_result.dart';
import 'package:praxis_server/src/services/task/validators/task_validator.dart';

class MultipleAnswerValidator implements TaskValidator {
  @override
  TaskAnswerResult validate(TaskDto task, String userAnswer) {
    final correctAnswers = _parseAnswers(task.correctAnswer);
    final submittedAnswers = _parseAnswers(userAnswer);

    if (correctAnswers == null || submittedAnswers == null) {
      return TaskAnswerResult(
        isCorrect: false,
        feedbackType: TaskAnswerFeedbackType.invalidFormat,
        feedbackMessage:
            'Invalid answer format. Expected a JSON array of answers',
        xpEarned: 0,
      );
    }

    final isCorrect =
        submittedAnswers.length == correctAnswers.length &&
        submittedAnswers.containsAll(correctAnswers);

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
          'One or more selected answers are incorrect',
      xpEarned: 0,
    );
  }

  Set<String>? _parseAnswers(String rawJson) {
    try {
      final decoded = jsonDecode(rawJson);
      if (decoded is! List) {
        return null;
      }

      final normalizedAnswers = <String>{};
      for (final value in decoded) {
        if (value is! String) {
          return null;
        }

        final normalized = value.trim();
        if (normalized.isEmpty || !normalizedAnswers.add(normalized)) {
          return null;
        }
      }

      if (normalizedAnswers.isEmpty) {
        return null;
      }

      return normalizedAnswers;
    } catch (_) {
      return null;
    }
  }
}
