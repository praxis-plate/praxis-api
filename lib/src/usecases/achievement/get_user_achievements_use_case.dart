import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/achievement/achievement_service.dart';
import 'package:serverpod/serverpod.dart';

class GetUserAchievementsUseCase {
  final AchievementService _achievementService;

  GetUserAchievementsUseCase({
    required AchievementService achievementService,
  }) : _achievementService = achievementService;

  Future<List<AchievementDto>> execute(
    Session session, {
    required UuidValue authUserId,
  }) {
    return _achievementService.getUserAchievements(
      session,
      authUserId: authUserId,
    );
  }
}
