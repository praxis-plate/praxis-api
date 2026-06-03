import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/access_control/access_control_service.dart';
import 'package:serverpod/serverpod.dart';

class SetUserBlockedUseCase {
  final AccessControlService _accessControlService;

  const SetUserBlockedUseCase({
    required AccessControlService accessControlService,
  }) : _accessControlService = accessControlService;

  Future<GovernanceUserDto> execute(
    Session session, {
    required UuidValue authUserId,
    required bool blocked,
  }) {
    return _accessControlService.setBlocked(
      session,
      authUserId: authUserId,
      blocked: blocked,
    );
  }
}
