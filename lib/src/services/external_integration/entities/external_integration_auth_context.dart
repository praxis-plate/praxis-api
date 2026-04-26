import 'package:praxis_server/src/generated/protocol.dart';

class ExternalIntegrationAuthContext {
  final ExternalIntegrationProvider provider;
  final String? baseUrl;
  final String accessToken;
  final String? accountIdentifier;

  const ExternalIntegrationAuthContext({
    required this.provider,
    required this.baseUrl,
    required this.accessToken,
    this.accountIdentifier,
  });
}
