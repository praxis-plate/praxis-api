import 'package:praxis_server/src/generated/requests/generate_explanation_request.dart';
import 'package:praxis_server/src/generated/requests/generate_hint_request.dart';
import 'package:praxis_server/src/generated/responses/ai_response.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:serverpod/serverpod.dart';

class AiEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<AiResponse> generateHint(
    Session session,
    GenerateHintRequest request,
  ) async {
    return session.server.services.aiService.generateHint(session, request);
  }

  Future<AiResponse> generateExplanation(
    Session session,
    GenerateExplanationRequest request,
  ) async {
    return session.server.services.aiService.generateExplanation(
      session,
      request,
    );
  }
}
