import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/user_profile/user_profile.dart';
import 'package:serverpod/serverpod.dart';

class GetCurrentUserProfileUseCase {
  final UserProfileService _userProfileService;

  const GetCurrentUserProfileUseCase({
    required UserProfileService userProfileService,
  }) : _userProfileService = userProfileService;

  Future<UserProfileDto> execute(
    Session session, {
    required UuidValue authUserId,
  }) {
    return _userProfileService.getCurrentProfile(
      session,
      authUserId: authUserId,
    );
  }
}
