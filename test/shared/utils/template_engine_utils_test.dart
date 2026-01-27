import 'package:praxis_server/src/shared/utils/template_engine_utils.dart';
import 'package:test/test.dart';

void main() {
  group('TemplateEngineUtils', () {
    test('should render template with variables', () {
      const template = 'Hello {name}, you are {age} years old!';
      final variables = {
        'name': 'John',
        'age': '25',
      };

      final result = TemplateEngineUtils.render(template, variables);

      expect(result, equals('Hello John, you are 25 years old!'));
    });

    test('should handle empty template', () {
      const template = '';
      final variables = {'name': 'John'};

      final result = TemplateEngineUtils.render(template, variables);

      expect(result, equals(''));
    });

    test('should handle empty variables', () {
      const template = 'Hello world!';
      final variables = <String, String>{};

      final result = TemplateEngineUtils.render(template, variables);

      expect(result, equals('Hello world!'));
    });

    test('should handle template without placeholders', () {
      const template = 'Hello world!';
      final variables = {'name': 'John'};

      final result = TemplateEngineUtils.render(template, variables);

      expect(result, equals('Hello world!'));
    });

    test('should handle multiple occurrences of same placeholder', () {
      const template = '{name} says hello to {name}!';
      final variables = {'name': 'John'};

      final result = TemplateEngineUtils.render(template, variables);

      expect(result, equals('John says hello to John!'));
    });

    test('should leave unmatched placeholders unchanged', () {
      const template = 'Hello {name}, you are {age} years old!';
      final variables = {'name': 'John'};

      final result = TemplateEngineUtils.render(template, variables);

      expect(result, equals('Hello John, you are {age} years old!'));
    });
  });
}
