import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/external_integration/adapters/external_integration_adapter.dart';
import 'package:praxis_server/src/services/external_integration/entities/external_integration_auth_context.dart';

class ExternalLmsAdapter extends ExternalIntegrationAdapter {
  @override
  final ExternalIntegrationProvider provider;

  @override
  final String displayName;

  @override
  final ExternalIntegrationAuthScheme authScheme;

  @override
  final bool requiresBaseUrl;

  const ExternalLmsAdapter({
    required this.provider,
    required this.displayName,
    this.authScheme = ExternalIntegrationAuthScheme.apiToken,
    this.requiresBaseUrl = true,
  }) : super();

  @override
  ExternalIntegrationKind get kind => ExternalIntegrationKind.lms;

  @override
  void validateAuthContext(ExternalIntegrationAuthContext context) {
    final token = context.accessToken.trim();
    if (token.isEmpty) {
      throw ValidationException(
        message: 'External integration accessToken must not be empty',
        field: 'accessToken',
      );
    }
    if (requiresBaseUrl) {
      final baseUrl = context.baseUrl?.trim() ?? '';
      if (baseUrl.isEmpty) {
        throw ValidationException(
          message: 'External integration baseUrl must not be empty',
          field: 'baseUrl',
        );
      }
      final uri = Uri.tryParse(baseUrl);
      if (uri == null || !(uri.isScheme('http') || uri.isScheme('https'))) {
        throw ValidationException(
          message: 'External integration baseUrl must be a valid absolute URL',
          field: 'baseUrl',
        );
      }
    }
  }

  String buildCourseId(Course course) {
    final slug = _slugify(course.title);
    return '${provider.name}-${course.id}-$slug';
  }

  String buildCourseUrl({
    required String baseUrl,
    required Course course,
  }) {
    final normalizedBaseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    return '$normalizedBaseUrl/courses/${buildCourseId(course)}';
  }

  String _slugify(String value) {
    final normalized = value.toLowerCase().replaceAll(
      RegExp(r'[^a-z0-9]+'),
      '-',
    );
    return normalized.replaceAll(RegExp(r'^-+|-+$'), '');
  }
}
