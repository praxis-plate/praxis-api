import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/achievement/achievement_service.dart';
import 'package:serverpod/serverpod.dart';

class GetAllAchievementsUseCase {
  final AchievementService _achievementService;

  GetAllAchievementsUseCase({
    required AchievementService achievementService,
  }) : _achievementService = achievementService;

  Future<List<AchievementDto>> execute(Session session) {
    return _achievementService.getAll(session);
  }
}
