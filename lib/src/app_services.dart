import 'package:dio/dio.dart';
import 'package:praxis_server/src/services/ai/ai_service.dart';

class AppServices {
  final AiService aiService;

  AppServices({
    required this.aiService,
  });

  factory AppServices.build({required String geminiApiKey}) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    return AppServices(
      aiService: AiService(
        dio: dio,
        apiKey: geminiApiKey,
      ),
    );
  }
}
