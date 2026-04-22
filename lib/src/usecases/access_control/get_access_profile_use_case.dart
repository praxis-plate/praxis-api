import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/access_control/access_control_service.dart';
import 'package:serverpod/serverpod.dart';

class GetAccessProfileUseCase {
  final AccessControlService _accessControlService;

  const GetAccessProfileUseCase({
    required AccessControlService accessControlService,
  }) : _accessControlService = accessControlService;

  Future<AccessProfileDto> execute(
    Session session, {
    required UuidValue authUserId,
  }) {
    return _accessControlService.getAccessProfile(
      session,
      authUserId: authUserId,
    );
  }
}
