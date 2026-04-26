import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/external_integration/entities/external_integration_auth_context.dart';

abstract class ExternalIntegrationAdapter {
  const ExternalIntegrationAdapter();

  ExternalIntegrationProvider get provider;
  ExternalIntegrationKind get kind;
  String get displayName;
  ExternalIntegrationAuthScheme get authScheme;
  bool get requiresBaseUrl;

  ExternalIntegrationProviderDto toProviderDto() {
    return ExternalIntegrationProviderDto(
      provider: provider,
      kind: kind,
      displayName: displayName,
      authScheme: authScheme,
      requiresBaseUrl: requiresBaseUrl,
      supportsCourseSync: kind == ExternalIntegrationKind.lms,
      supportsLessonVideoSession:
          kind == ExternalIntegrationKind.videoConferencing,
    );
  }

  void validateAuthContext(ExternalIntegrationAuthContext context);
}
