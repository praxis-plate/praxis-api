import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/external_integration/adapters/external_integration_adapter.dart';
import 'package:praxis_server/src/services/external_integration/entities/external_integration_auth_context.dart';

class ExternalVideoConferencingAdapter extends ExternalIntegrationAdapter {
  @override
  final ExternalIntegrationProvider provider;

  @override
  final String displayName;

  @override
  final ExternalIntegrationAuthScheme authScheme;

  @override
  final bool requiresBaseUrl;

  final String defaultBaseUrl;

  const ExternalVideoConferencingAdapter({
    required this.provider,
    required this.displayName,
    required this.defaultBaseUrl,
    this.authScheme = ExternalIntegrationAuthScheme.oauth2,
    this.requiresBaseUrl = false,
  }) : super();

  @override
  ExternalIntegrationKind get kind => ExternalIntegrationKind.videoConferencing;

  @override
  void validateAuthContext(ExternalIntegrationAuthContext context) {
    final token = context.accessToken.trim();
    if (token.isEmpty) {
      throw ValidationException(
        message: 'External integration accessToken must not be empty',
        field: 'accessToken',
      );
    }
    final baseUrl = context.baseUrl?.trim();
    if (baseUrl != null && baseUrl.isNotEmpty) {
      final uri = Uri.tryParse(baseUrl);
      if (uri == null || !(uri.isScheme('http') || uri.isScheme('https'))) {
        throw ValidationException(
          message: 'External integration baseUrl must be a valid absolute URL',
          field: 'baseUrl',
        );
      }
    }
  }

  String resolveBaseUrl(String? baseUrl) {
    final candidate = (baseUrl ?? '').trim();
    if (candidate.isEmpty) {
      return defaultBaseUrl;
    }
    return candidate.endsWith('/')
        ? candidate.substring(0, candidate.length - 1)
        : candidate;
  }

  String buildMeetingCode({
    required int lessonId,
    required String sessionTitle,
  }) {
    final normalizedTitle = sessionTitle
        .toUpperCase()
        .replaceAll(RegExp(r'[^A-Z0-9]+'), '')
        .padRight(6, 'X');
    return '${provider.name.substring(0, 2).toUpperCase()}-$lessonId-${normalizedTitle.substring(0, 6)}';
  }

  String buildJoinUrl({
    required String baseUrl,
    required String meetingCode,
  }) {
    return '$baseUrl/join/$meetingCode';
  }

  String buildHostUrl({
    required String baseUrl,
    required String meetingCode,
  }) {
    return '$baseUrl/host/$meetingCode';
  }
}
