import 'package:praxis_server/src/generated/requests/generate_hint_request.dart';
import 'package:praxis_server/src/generated/responses/ai_response.dart';
import 'package:praxis_server/src/services/ai/ai_service.dart';
import 'package:serverpod/serverpod.dart';

class GenerateHintUseCase {
  final AiService? _aiService;

  GenerateHintUseCase({required AiService? aiService}) : _aiService = aiService;

  Future<AiResponse> execute(
    Session session,
    GenerateHintRequest request,
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
    return aiService.generateHint(session, request);
  }
}
