import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/access_control/access_control_service.dart';
import 'package:serverpod/serverpod.dart';

class GetGovernanceUserCoursesUseCase {
  final AccessControlService _accessControlService;

  const GetGovernanceUserCoursesUseCase({
    required AccessControlService accessControlService,
  }) : _accessControlService = accessControlService;

  Future<GovernanceUserCoursesDto> execute(
    Session session, {
    required UuidValue authUserId,
  }) {
    return _accessControlService.getGovernanceUserCourses(
      session,
      authUserId: authUserId,
    );
  }
}
