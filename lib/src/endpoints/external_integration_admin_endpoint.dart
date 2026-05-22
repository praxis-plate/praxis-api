import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/auth_scopes.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class ExternalIntegrationAdminEndpoint extends Endpoint {
  Future<List<ExternalIntegrationProviderDto>> listProviders(
    Session session,
  ) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.listExternalIntegrationProvidersUseCase
        .execute(session);
  }

  Future<ExternalCourseSyncDto> syncCourse(
    Session session,
    SyncCourseToExternalProviderRequest request,
  ) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.syncCourseToExternalProviderUseCase.execute(
      session,
      request,
    );
  }

  Future<ExternalVideoSessionDto> provisionLessonVideoSession(
    Session session,
    ProvisionExternalVideoSessionRequest request,
  ) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.provisionExternalVideoSessionUseCase.execute(
      session,
      request,
    );
  }
}
