import 'package:dio/dio.dart';
import 'package:praxis_server/src/shared/constants/gemini_model.dart';

class GeminiApiClient {
  static const String _apiBaseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models';

  final Dio _dio;
  final String _apiKey;
  final String _model;

  GeminiApiClient({
    required Dio dio,
    required String apiKey,
    GeminiModel model = GeminiModel.gemini25Flash,
  }) : _dio = dio,
       _apiKey = apiKey,
       _model = model.id;

  Future<String?> generateContent(String prompt) async {
    try {
      final url = '$_apiBaseUrl/$_model:generateContent';

      final requestBody = {
        'contents': [
          {
            'parts': [
              {'text': prompt},
            ],
          },
        ],
      };

      final response = await _dio.post(
        url,
        data: requestBody,
        options: Options(
          headers: {
            'x-goog-api-key': _apiKey,
            'Content-Type': 'application/json',
          },
        ),
      );

      return _parseResponse(response.data);
    } on DioException catch (e) {
      throw Exception('API request failed: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  String? _parseResponse(dynamic data) {
    try {
      final text = data['candidates']?[0]?['content']?['parts']?[0]?['text'];

      if (text == null || text is! String) {
        return null;
      }

      return text;
    } catch (e) {
      return null;
    }
  }
}
