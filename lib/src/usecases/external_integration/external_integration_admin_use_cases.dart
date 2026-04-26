import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/external_integration/external_integration_service.dart';
import 'package:serverpod/serverpod.dart';

class ListExternalIntegrationProvidersUseCase {
  final ExternalIntegrationService _externalIntegrationService;

  const ListExternalIntegrationProvidersUseCase({
    required ExternalIntegrationService externalIntegrationService,
  }) : _externalIntegrationService = externalIntegrationService;

  Future<List<ExternalIntegrationProviderDto>> execute(Session session) async {
    return _externalIntegrationService.listProviders();
  }
}

class SyncCourseToExternalProviderUseCase {
  final ExternalIntegrationService _externalIntegrationService;

  const SyncCourseToExternalProviderUseCase({
    required ExternalIntegrationService externalIntegrationService,
  }) : _externalIntegrationService = externalIntegrationService;

  Future<ExternalCourseSyncDto> execute(
    Session session,
    SyncCourseToExternalProviderRequest request,
  ) {
    return _externalIntegrationService.syncCourse(session, request);
  }
}

class ProvisionExternalVideoSessionUseCase {
  final ExternalIntegrationService _externalIntegrationService;

  const ProvisionExternalVideoSessionUseCase({
    required ExternalIntegrationService externalIntegrationService,
  }) : _externalIntegrationService = externalIntegrationService;

  Future<ExternalVideoSessionDto> execute(
    Session session,
    ProvisionExternalVideoSessionRequest request,
  ) {
    return _externalIntegrationService.provisionLessonVideoSession(
      session,
      request,
    );
  }
}
