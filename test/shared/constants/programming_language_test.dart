import 'package:praxis_server/src/shared/constants/programming_language.dart';
import 'package:test/test.dart';

void main() {
  group('ProgrammingLanguage', () {
    test('should have correct display names', () {
      expect(ProgrammingLanguage.dart.displayName, equals('Dart'));
      expect(ProgrammingLanguage.python.displayName, equals('Python'));
      expect(ProgrammingLanguage.javaScript.displayName, equals('JavaScript'));
    });

    test('should parse from string by name using byName', () {
      expect(
        ProgrammingLanguage.values.byName('dart'),
        equals(ProgrammingLanguage.dart),
      );
      expect(
        ProgrammingLanguage.values.byName('python'),
        equals(ProgrammingLanguage.python),
      );
      expect(
        ProgrammingLanguage.values.byName('javaScript'),
        equals(ProgrammingLanguage.javaScript),
      );
    });

    test('should throw ArgumentError for unknown language', () {
      expect(
        () => ProgrammingLanguage.values.byName('unknown'),
        throwsArgumentError,
      );
      expect(() => ProgrammingLanguage.values.byName(''), throwsArgumentError);
    });

    test('should be case sensitive with byName', () {
      expect(
        () => ProgrammingLanguage.values.byName('DART'),
        throwsArgumentError,
      );
      expect(
        () => ProgrammingLanguage.values.byName('Python'),
        throwsArgumentError,
      );
      expect(
        () => ProgrammingLanguage.values.byName('Javascript'),
        throwsArgumentError,
      );
    });
  });
}
