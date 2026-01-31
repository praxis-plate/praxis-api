import 'package:praxis_server/src/services/achievement/achievement_service.dart';
import 'package:serverpod/serverpod.dart';

class UnlockAchievementUseCase {
  final AchievementService _achievementService;

  UnlockAchievementUseCase({
    required AchievementService achievementService,
  }) : _achievementService = achievementService;

  Future<void> execute(
    Session session,
    int achievementId, {
    required UuidValue authUserId,
  }) {
    return _achievementService.unlockAchievement(
      session,
      achievementId,
      authUserId: authUserId,
    );
  }
}
