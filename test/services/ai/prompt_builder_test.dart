import 'package:praxis_server/src/services/ai/prompt_builder.dart';
import 'package:test/test.dart';

void main() {
  group('PromptBuilder', () {
    late PromptBuilder promptBuilder;

    setUp(() {
      promptBuilder = PromptBuilder(
        hintTemplate:
            'Hint for {language}: {question} about {topic}. Code context:\n{code_context}',
        explanationTemplate:
            'Explanation for {language}: {question} about {topic}. User: {user_answer}, Correct: {correct_answer}. Compilation error:\n{compilation_error}',
      );
    });

    test('should build hint prompt correctly', () {
      final result = promptBuilder.buildHintPrompt(
        question: 'What is a variable?',
        codeContext: 'int x = 5;',
        language: 'Dart',
        topic: 'Variables',
      );

      expect(result, contains('Hint for Dart'));
      expect(result, contains('What is a variable?'));
      expect(result, contains('Variables'));
      expect(result, contains('```Dart\nint x = 5;\n```'));
    });

    test('should build hint prompt without code context', () {
      final result = promptBuilder.buildHintPrompt(
        question: 'What is a variable?',
        codeContext: '',
        language: 'Dart',
        topic: 'Variables',
      );

      expect(result, contains('Hint for Dart'));
      expect(result, contains('What is a variable?'));
      expect(result, contains('Variables'));
      expect(result, isNot(contains('```')));
    });

    test('should build explanation prompt correctly', () {
      final result = promptBuilder.buildExplanationPrompt(
        question: 'What is a variable?',
        userAnswer: 'A number',
        correctAnswer: 'A container for storing data',
        language: 'Dart',
        topic: 'Variables',
        compilationError: 'Syntax error',
      );

      expect(result, contains('Explanation for Dart'));
      expect(result, contains('What is a variable?'));
      expect(result, contains('Variables'));
      expect(result, contains('User: A number'));
      expect(result, contains('Correct: A container for storing data'));
      expect(result, contains('Compilation error:'));
      expect(result, contains('Syntax error'));
    });

    test('should build explanation prompt with null language', () {
      final result = promptBuilder.buildExplanationPrompt(
        question: 'What is a variable?',
        userAnswer: 'A number',
        correctAnswer: 'A container for storing data',
        language: null,
        topic: 'Variables',
      );

      expect(result, contains('Explanation for programming'));
    });

    test('should build explanation prompt without compilation error', () {
      final result = promptBuilder.buildExplanationPrompt(
        question: 'What is a variable?',
        userAnswer: 'A number',
        correctAnswer: 'A container for storing data',
        language: 'Dart',
        topic: 'Variables',
      );

      expect(result, isNot(contains('Syntax error')));
    });
  });
}
