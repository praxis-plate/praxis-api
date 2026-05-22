import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/access_control/access_control_service.dart';
import 'package:serverpod/serverpod.dart';

class AssignUserRoleUseCase {
  final AccessControlService _accessControlService;

  const AssignUserRoleUseCase({
    required AccessControlService accessControlService,
  }) : _accessControlService = accessControlService;

  Future<AccessProfileDto> execute(
    Session session, {
    required UuidValue authUserId,
    required UserRole role,
  }) {
    return _accessControlService.assignRole(
      session,
      authUserId: authUserId,
      role: role,
    );
  }
}
