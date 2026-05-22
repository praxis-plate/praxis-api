import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/validators/code_completion_validator.dart';
import 'package:test/test.dart';

void main() {
  final validator = CodeCompletionValidator();

  test('accepts placeholder answer when correct answer is a snippet', () {
    final result = validator.validate(
      _task(
        correctAnswer: 'return a + b;',
        codeTemplate: 'int add(int a, int b) { ___ }',
      ),
      'return a + b;',
    );

    expect(result.isCorrect, isTrue);
  });

  test('accepts rendered answer when correct answer is a snippet', () {
    final result = validator.validate(
      _task(
        correctAnswer: 'return a + b;',
        codeTemplate: 'int add(int a, int b) { ___ }',
      ),
      'int add(int a, int b) { return a + b; }',
    );

    expect(result.isCorrect, isTrue);
  });

  test('accepts placeholder answer when correct answer is rendered code', () {
    final result = validator.validate(
      _task(
        correctAnswer: 'var age = 25;',
        codeTemplate: 'var age = ___;',
      ),
      '25',
    );

    expect(result.isCorrect, isTrue);
  });

  test('rejects incorrect code completion answer', () {
    final result = validator.validate(
      _task(
        correctAnswer: 'return a + b;',
        codeTemplate: 'int add(int a, int b) { ___ }',
      ),
      'return a - b;',
    );

    expect(result.isCorrect, isFalse);
  });
}

TaskDto _task({
  required String correctAnswer,
  required String codeTemplate,
}) {
  final now = DateTime(2026, 5, 3);
  return TaskDto(
    id: 1,
    lessonId: 1,
    taskType: TaskType.codeCompletion,
    questionText: 'Complete code',
    correctAnswer: correctAnswer,
    codeTemplate: codeTemplate,
    programmingLanguage: 'dart',
    difficultyLevel: 1,
    xpValue: 10,
    orderIndex: 0,
    topic: 'functions',
    createdAt: now,
    updatedAt: now,
    options: const [],
    testCases: const [],
  );
}
