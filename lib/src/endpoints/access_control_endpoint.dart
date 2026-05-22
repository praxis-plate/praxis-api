import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/auth_scopes.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class AccessControlEndpoint extends Endpoint {
  Future<AccessProfileDto> getMyAccess(Session session) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.getAccessProfileUseCase.execute(
      session,
      authUserId: authUserId,
    );
  }

  Future<AccessProfileDto> getCmsAccess(Session session) {
    AuthUtils.requireScope(session, AuthScopes.cmsAccess);
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.getAccessProfileUseCase.execute(
      session,
      authUserId: authUserId,
    );
  }

  Future<AccessProfileDto> getAdminAccess(Session session) {
    AuthUtils.requireScope(session, AuthScopes.adminAccess);
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.getAccessProfileUseCase.execute(
      session,
      authUserId: authUserId,
    );
  }

  Future<AccessProfileDto> getUserAccess(
    Session session,
    UuidValue authUserId,
  ) {
    AuthUtils.requireScope(session, AuthScopes.adminAccess);
    return session.server.useCases.getAccessProfileUseCase.execute(
      session,
      authUserId: authUserId,
    );
  }

  Future<AccessProfileDto> assignRole(
    Session session, {
    required UuidValue authUserId,
    required UserRole role,
  }) {
    AuthUtils.requireScope(session, AuthScopes.adminAccess);
    return session.server.useCases.assignUserRoleUseCase.execute(
      session,
      authUserId: authUserId,
      role: role,
    );
  }

  Future<AccessProfileDto> revokeRole(
    Session session, {
    required UuidValue authUserId,
    required UserRole role,
  }) {
    AuthUtils.requireScope(session, AuthScopes.adminAccess);
    return session.server.useCases.revokeUserRoleUseCase.execute(
      session,
      authUserId: authUserId,
      role: role,
    );
  }
}
