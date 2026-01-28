import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class AchievementEndpoint extends Endpoint {
  Future<List<AchievementDto>> getAll(Session session) {
    return session.server.services.achievementService.getAll(session);
  }

  Future<List<AchievementDto>> getUserAchievements(Session session) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.services.achievementService.getUserAchievements(
      session,
      authUserId: authUserId,
    );
  }

  Future<void> unlock(Session session, int achievementId) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.services.achievementService.unlockAchievement(
      session,
      achievementId,
      authUserId: authUserId,
    );
  }

  Future<bool> isUnlocked(Session session, int achievementId) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.services.achievementService.isAchievementUnlocked(
      session,
      achievementId,
      authUserId: authUserId,
    );
  }
}
