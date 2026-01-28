import 'package:praxis_server/src/datasources/achievement_data_source.dart';
import 'package:praxis_server/src/datasources/user_achievement_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/mappers/achievement_mapper.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class AchievementService {
  final AchievementDataSource _achievementDataSource;
  final UserAchievementDataSource _userAchievementDataSource;

  AchievementService({
    required AchievementDataSource achievementDataSource,
    required UserAchievementDataSource userAchievementDataSource,
  }) : _achievementDataSource = achievementDataSource,
       _userAchievementDataSource = userAchievementDataSource;

  Future<List<AchievementDto>> getAll(Session session) async {
    final achievements = await _achievementDataSource.listAll(session);
    return achievements.map((achievement) => achievement.toAchievementDto()).toList();
  }

  Future<List<AchievementDto>> getUserAchievements(Session session) async {
    final authUserId = AuthUtils.getAuthUserId(session);
    final userAchievements = await _userAchievementDataSource.listByAuthUserId(
      session,
      authUserId,
    );

    final result = <AchievementDto>[];
    for (final userAchievement in userAchievements) {
      final achievement = await _achievementDataSource.findById(
        session,
        userAchievement.achievementId,
      );
      if (achievement == null) {
        continue;
      }
      result.add(
        achievement.toAchievementDto(unlockedAt: userAchievement.unlockedAt),
      );
    }

    return result;
  }

  Future<bool> isAchievementUnlocked(
    Session session,
    int achievementId,
  ) async {
    final authUserId = AuthUtils.getAuthUserId(session);
    final existing = await _userAchievementDataSource
        .findByAuthUserAndAchievement(session, authUserId, achievementId);
    return existing != null;
  }

  Future<void> unlockAchievement(
    Session session,
    int achievementId,
  ) async {
    final authUserId = AuthUtils.getAuthUserId(session);
    final existing = await _userAchievementDataSource
        .findByAuthUserAndAchievement(session, authUserId, achievementId);
    if (existing != null) {
      return;
    }

    await _userAchievementDataSource.insert(
      session,
      authUserId: authUserId,
      achievementId: achievementId,
      unlockedAt: DateTime.now(),
    );
  }

  Future<List<AchievementDto>> awardStreakAchievements(
    Session session, {
    required int currentStreak,
    Transaction? transaction,
  }) async {
    final authUserId = AuthUtils.getAuthUserId(session);
    final achievements = await _achievementDataSource.listByConditionType(
      session,
      'STREAK_DAYS',
    );

    final unlocked = <AchievementDto>[];
    for (final achievement in achievements) {
      final threshold = int.tryParse(achievement.conditionValue ?? '');
      if (threshold == null || currentStreak < threshold) {
        continue;
      }

      final existing = await _userAchievementDataSource
          .findByAuthUserAndAchievement(
            session,
            authUserId,
            achievement.id!,
            transaction: transaction,
          );
      if (existing != null) {
        continue;
      }

      final unlockedAt = DateTime.now();
      await _userAchievementDataSource.insert(
        session,
        authUserId: authUserId,
        achievementId: achievement.id!,
        unlockedAt: unlockedAt,
        transaction: transaction,
      );

      unlocked.add(achievement.toAchievementDto(unlockedAt: unlockedAt));
    }

    return unlocked;
  }
}
