import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/access_control/access_control_service.dart';
import 'package:serverpod/serverpod.dart';

class ListGovernanceUsersUseCase {
  final AccessControlService _accessControlService;

  const ListGovernanceUsersUseCase({
    required AccessControlService accessControlService,
  }) : _accessControlService = accessControlService;

  Future<List<GovernanceUserDto>> execute(Session session) {
    return _accessControlService.listGovernanceUsers(session);
  }
}
