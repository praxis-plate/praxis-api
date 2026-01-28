import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UserAchievementDataSource {
  const UserAchievementDataSource();

  Future<List<UserAchievement>> listByAuthUserId(
    Session session,
    UuidValue authUserId,
  ) {
    return UserAchievement.db.find(
      session,
      where: (t) => t.authUserId.equals(authUserId),
      orderBy: (t) => t.unlockedAt,
      orderDescending: true,
    );
  }

  Future<UserAchievement?> findByAuthUserAndAchievement(
    Session session,
    UuidValue authUserId,
    int achievementId, {
    Transaction? transaction,
  }) {
    return UserAchievement.db.findFirstRow(
      session,
      where: (t) =>
          t.authUserId.equals(authUserId) &
          t.achievementId.equals(achievementId),
      transaction: transaction,
    );
  }

  Future<UserAchievement> insert(
    Session session, {
    required UuidValue authUserId,
    required int achievementId,
    required DateTime unlockedAt,
    Transaction? transaction,
  }) {
    final row = UserAchievement(
      authUserId: authUserId,
      achievementId: achievementId,
      unlockedAt: unlockedAt,
    );

    return UserAchievement.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }
}
