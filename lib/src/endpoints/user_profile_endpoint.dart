import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class UserProfileEndpoint extends Endpoint {
  Future<UserProfileDto> getMyProfile(Session session) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.getCurrentUserProfileUseCase.execute(
      session,
      authUserId: authUserId,
    );
  }

  Future<UserProfileDto> update(
    Session session,
    UpdateUserProfileRequest request,
  ) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.updateCurrentUserProfileUseCase.execute(
      session,
      authUserId: authUserId,
      request: request,
    );
  }

  Future<UserProfileDto> uploadAvatar(
    Session session,
    UploadUserAvatarRequest request,
  ) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.uploadCurrentUserAvatarUseCase.execute(
      session,
      authUserId: authUserId,
      request: request,
    );
  }

  Future<UserProfileDto> removeAvatar(Session session) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.removeCurrentUserAvatarUseCase.execute(
      session,
      authUserId: authUserId,
    );
  }
}
