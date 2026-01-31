import 'dart:convert';

import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_feedback_type.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_result.dart';
import 'package:praxis_server/src/services/task/entities/validation_options.dart';
import 'package:praxis_server/src/services/task/validators/task_validator.dart';

class TextInputValidator implements TaskValidator {
  @override
  TaskAnswerResult validate(TaskDto task, String userAnswer) {
    final options = _parseOptions(task.optionsJson);
    final isCorrect = _isAnswerCorrect(
      userAnswer,
      task.correctAnswer,
      options,
    );

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
      feedbackMessage: 'Incorrect answer',
      xpEarned: 0,
    );
  }

  ValidationOptions _parseOptions(String? optionsJson) {
    if (optionsJson == null) {
      return const ValidationOptions();
    }

    try {
      final options = jsonDecode(optionsJson) as Map<String, dynamic>;
      return ValidationOptions(
        caseSensitive: options['caseSensitive'] as bool? ?? false,
        exactMatch: options['exactMatch'] as bool? ?? false,
        acceptableAnswers: (options['acceptableAnswers'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
      );
    } catch (e) {
      return const ValidationOptions();
    }
  }

  bool _isAnswerCorrect(
    String userAnswer,
    String correctAnswer,
    ValidationOptions options,
  ) {
    final processedUserAnswer = _processAnswer(
      userAnswer,
      options.caseSensitive,
    );
    final processedCorrectAnswer = _processAnswer(
      correctAnswer,
      options.caseSensitive,
    );

    // Check main correct answer
    if (_matchesAnswer(
      processedUserAnswer,
      processedCorrectAnswer,
      options.exactMatch,
    )) {
      return true;
    }

    // Check acceptable alternatives
    return _checkAcceptableAnswers(processedUserAnswer, options);
  }

  String _processAnswer(String answer, bool caseSensitive) {
    return caseSensitive ? answer.trim() : answer.trim().toLowerCase();
  }

  bool _matchesAnswer(
    String userAnswer,
    String correctAnswer,
    bool exactMatch,
  ) {
    if (exactMatch) {
      return userAnswer == correctAnswer;
    }
    return userAnswer.contains(correctAnswer) ||
        correctAnswer.contains(userAnswer);
  }

  bool _checkAcceptableAnswers(
    String processedUserAnswer,
    ValidationOptions options,
  ) {
    if (options.acceptableAnswers == null) {
      return false;
    }

    for (final acceptable in options.acceptableAnswers!) {
      final processedAcceptable = _processAnswer(
        acceptable,
        options.caseSensitive,
      );

      if (_matchesAnswer(
        processedUserAnswer,
        processedAcceptable,
        options.exactMatch,
      )) {
        return true;
      }
    }

    return false;
  }
}
