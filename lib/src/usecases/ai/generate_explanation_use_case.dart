import 'package:praxis_server/src/generated/requests/generate_explanation_request.dart';
import 'package:praxis_server/src/generated/responses/ai_response.dart';
import 'package:praxis_server/src/services/ai/ai_service.dart';
import 'package:serverpod/serverpod.dart';

class GenerateExplanationUseCase {
  final AiService? _aiService;

  GenerateExplanationUseCase({required AiService? aiService})
    : _aiService = aiService;

  Future<AiResponse> execute(
    Session session,
    GenerateExplanationRequest request,
  ) {
    final aiService = _aiService;
    if (aiService == null) {
      return Future.value(
        AiResponse(
          content: '',
          success: false,
          error: 'AI service is not configured',
        ),
      );
    }
    return aiService.generateExplanation(session, request);
  }
}
