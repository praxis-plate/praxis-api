import 'dart:async';

import 'package:dio/dio.dart';
import 'package:praxis_server/src/shared/constants/gemini_model.dart';

class GeminiApiClient {
  static const String _apiBaseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models';
  static const int _maxRetries = 1;
  static const Duration _retryDelay = Duration(milliseconds: 200);

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

      final response = await _postWithRetry(url, requestBody);

      return _parseResponse(response.data);
    } on DioException catch (e) {
      throw Exception('API request failed: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Response<dynamic>> _postWithRetry(
    String url,
    Map<String, Object> requestBody,
  ) async {
    var attempt = 0;
    while (true) {
      try {
        return await _dio.post(
          url,
          data: requestBody,
          options: Options(
            headers: {
              'x-goog-api-key': _apiKey,
              'Content-Type': 'application/json',
            },
          ),
        );
      } on DioException catch (e) {
        if (!_shouldRetry(e) || attempt >= _maxRetries) {
          rethrow;
        }
        attempt += 1;
        await Future<void>.delayed(_retryDelay);
      }
    }
  }

  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError;
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
