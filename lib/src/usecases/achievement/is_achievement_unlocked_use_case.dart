import 'package:praxis_server/src/services/achievement/achievement_service.dart';
import 'package:serverpod/serverpod.dart';

class IsAchievementUnlockedUseCase {
  final AchievementService _achievementService;

  IsAchievementUnlockedUseCase({
    required AchievementService achievementService,
  }) : _achievementService = achievementService;

  Future<bool> execute(
    Session session,
    int achievementId, {
    required UuidValue authUserId,
  }) {
    return _achievementService.isAchievementUnlocked(
      session,
      achievementId,
      authUserId: authUserId,
    );
  }
}
