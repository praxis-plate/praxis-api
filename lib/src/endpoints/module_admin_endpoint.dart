import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/auth_scopes.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class ModuleAdminEndpoint extends Endpoint {
  Future<List<ModuleDto>> list(Session session, int courseId) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.listAdminModulesUseCase.execute(
      session,
      courseId,
    );
  }

  Future<ModuleDto> create(Session session, CreateModuleRequest request) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.createAdminModuleUseCase.execute(
      session,
      request,
    );
  }

  Future<ModuleDto> update(Session session, UpdateModuleRequest request) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.updateAdminModuleUseCase.execute(
      session,
      request,
    );
  }

  Future<List<ModuleDto>> reorder(
    Session session,
    ReorderModulesRequest request,
  ) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.reorderAdminModulesUseCase.execute(
      session,
      request,
    );
  }
}
