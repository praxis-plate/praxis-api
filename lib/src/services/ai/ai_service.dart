import 'package:dio/dio.dart';
import 'package:praxis_server/src/generated/requests/generate_explanation_request.dart';
import 'package:praxis_server/src/generated/requests/generate_hint_request.dart';
import 'package:praxis_server/src/generated/responses/ai_response.dart';
import 'package:praxis_server/src/services/ai/gemini_api_client.dart';
import 'package:praxis_server/src/services/ai/prompt_builder.dart';
import 'package:praxis_server/src/services/ai/prompt_template_loader.dart';
import 'package:serverpod/serverpod.dart';

class AiService {
  final GeminiApiClient _apiClient;
  final PromptBuilder _promptBuilder;

  AiService({
    required Dio dio,
    required String apiKey,
  }) : _apiClient = GeminiApiClient(dio: dio, apiKey: apiKey),
       _promptBuilder = _createPromptBuilder();

  static PromptBuilder _createPromptBuilder() {
    final templateLoader = PromptTemplateLoader();

    return PromptBuilder(
      hintTemplate: templateLoader.loadHintTemplate(),
      explanationTemplate: templateLoader.loadExplanationTemplate(),
    );
  }

  Future<AiResponse> generateHint(
    Session session,
    GenerateHintRequest request,
  ) async {
    try {
      final prompt = _promptBuilder.buildHintPrompt(
        question: request.question,
        codeContext: request.codeContext,
        language: request.language,
        topic: request.topic,
      );

      final content = await _apiClient.generateContent(prompt);

      if (content == null) {
        return AiResponse(
          content: '',
          success: false,
          error: 'Failed to parse AI response',
        );
      }

      return AiResponse(
        content: content,
        success: true,
      );
    } catch (e) {
      return AiResponse(
        content: '',
        success: false,
        error: e.toString(),
      );
    }
  }

  Future<AiResponse> generateExplanation(
    Session session,
    GenerateExplanationRequest request,
  ) async {
    try {
      final prompt = _promptBuilder.buildExplanationPrompt(
        question: request.question,
        userAnswer: request.userAnswer,
        correctAnswer: request.correctAnswer,
        language: request.language,
        topic: request.topic,
        compilationError: request.compilationError ?? '',
      );

      final content = await _apiClient.generateContent(prompt);

      if (content == null) {
        return AiResponse(
          content: '',
          success: false,
          error: 'Failed to parse AI response',
        );
      }

      return AiResponse(
        content: content,
        success: true,
      );
    } catch (e) {
      return AiResponse(
        content: '',
        success: false,
        error: e.toString(),
      );
    }
  }
}
