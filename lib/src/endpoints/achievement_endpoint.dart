import 'package:praxis_server/src/datasources/achievement_data_source.dart';
import 'package:praxis_server/src/datasources/user_achievement_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/achievement/achievement_service.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class AchievementEndpoint extends Endpoint {
  AchievementEndpoint()
    : _achievementService = AchievementService(
        achievementDataSource: const AchievementDataSource(),
        userAchievementDataSource: const UserAchievementDataSource(),
      );

  final AchievementService _achievementService;

  Future<List<AchievementDto>> getAll(Session session) {
    return _achievementService.getAll(session);
  }

  Future<List<AchievementDto>> getUserAchievements(Session session) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return _achievementService.getUserAchievements(
      session,
      authUserId: authUserId,
    );
  }

  Future<void> unlock(Session session, int achievementId) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return _achievementService.unlockAchievement(
      session,
      achievementId,
      authUserId: authUserId,
    );
  }

  Future<bool> isUnlocked(Session session, int achievementId) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return _achievementService.isAchievementUnlocked(
      session,
      achievementId,
      authUserId: authUserId,
    );
  }
}
