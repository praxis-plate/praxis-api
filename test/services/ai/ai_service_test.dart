import 'package:dio/dio.dart';
import 'package:praxis_server/src/services/ai/ai_service.dart';
import 'package:test/test.dart';

void main() {
  group('AiService', () {
    late AiService aiService;

    setUp(() {
      aiService = AiService(
        dio: Dio(),
        apiKey: 'test-key',
      );
    });

    test('should create service instance correctly', () {
      expect(aiService, isNotNull);
    });
  });
}
