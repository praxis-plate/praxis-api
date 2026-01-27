import 'package:dio/dio.dart';
import 'package:praxis_server/src/generated/requests/generate_explanation_request.dart';
import 'package:praxis_server/src/generated/requests/generate_hint_request.dart';
import 'package:praxis_server/src/generated/responses/ai_response.dart';
import 'package:praxis_server/src/services/ai/ai_service.dart';
import 'package:serverpod/serverpod.dart';

class AiEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<AiResponse> generateHint(
    Session session,
    GenerateHintRequest request,
  ) async {
    final geminiApiKey = session.passwords['geminiApiKey'];
    if (geminiApiKey == null) {
      return AiResponse(
        content: '',
        success: false,
        error: 'Gemini API key not found in server configuration',
      );
    }

    // Create AI service with the actual API key
    final aiService = AiService(
      dio: Dio(),
      apiKey: geminiApiKey,
    );

    return await aiService.generateHint(session, request);
  }

  Future<AiResponse> generateExplanation(
    Session session,
    GenerateExplanationRequest request,
  ) async {
    final geminiApiKey = session.passwords['geminiApiKey'];
    if (geminiApiKey == null) {
      return AiResponse(
        content: '',
        success: false,
        error: 'Gemini API key not found in server configuration',
      );
    }

    // Create AI service with the actual API key
    final aiService = AiService(
      dio: Dio(),
      apiKey: geminiApiKey,
    );

    return await aiService.generateExplanation(session, request);
  }
}
