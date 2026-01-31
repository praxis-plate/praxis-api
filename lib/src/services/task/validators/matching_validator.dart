import 'dart:convert';

import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_feedback_type.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_result.dart';
import 'package:praxis_server/src/services/task/validators/task_validator.dart';

class MatchingValidator implements TaskValidator {
  @override
  TaskAnswerResult validate(TaskDto task, String userAnswer) {
    try {
      final userMatches = jsonDecode(userAnswer) as Map<String, dynamic>;
      final correctMatches =
          jsonDecode(task.correctAnswer) as Map<String, dynamic>;

      final isCorrect = _compareMaps(userMatches, correctMatches);

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
        feedbackMessage: 'Some matches are incorrect',
        xpEarned: 0,
      );
    } catch (e) {
      return TaskAnswerResult(
        isCorrect: false,
        feedbackType: TaskAnswerFeedbackType.invalidFormat,
        feedbackMessage: 'Invalid answer format. Expected JSON format',
        xpEarned: 0,
      );
    }
  }

  bool _compareMaps(Map<String, dynamic> map1, Map<String, dynamic> map2) {
    if (map1.length != map2.length) return false;

    for (final key in map1.keys) {
      if (!map2.containsKey(key) || map1[key] != map2[key]) {
        return false;
      }
    }

    return true;
  }
}
