import 'dart:convert';

import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/validators/text_input_validator.dart';
import 'package:test/test.dart';

void main() {
  final validator = TextInputValidator();

  test('uses legacy partial case-insensitive matching without options', () {
    final task = _task();

    expect(validator.validate(task, 'A list value').isCorrect, isTrue);
    expect(validator.validate(task, 'LIST').isCorrect, isTrue);
  });

  test('applies exact case-sensitive acceptable answer settings', () {
    final task = _task(
      optionsJson: jsonEncode({
        'caseSensitive': true,
        'exactMatch': true,
        'acceptableAnswers': ['ArrayList'],
      }),
    );

    expect(validator.validate(task, 'List').isCorrect, isTrue);
    expect(validator.validate(task, 'ArrayList').isCorrect, isTrue);
    expect(validator.validate(task, 'list').isCorrect, isFalse);
    expect(validator.validate(task, 'A List value').isCorrect, isFalse);
  });
}

TaskDto _task({String? optionsJson}) {
  final now = DateTime(2026, 5, 22);
  return TaskDto(
    id: 1,
    lessonId: 1,
    taskType: TaskType.textInput,
    questionText: 'Name a collection',
    correctAnswer: 'List',
    optionsJson: optionsJson,
    difficultyLevel: 1,
    xpValue: 10,
    orderIndex: 0,
    topic: 'collections',
    createdAt: now,
    updatedAt: now,
    options: const [],
    testCases: const [],
  );
}
