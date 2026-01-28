import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:praxis_server/src/datasources/base_data_source.dart';

class AchievementDataSource extends BaseDataSource {
  const AchievementDataSource();

  Future<List<Achievement>> listAll(Session session) {
    return Achievement.db.find(session);
  }

  Future<Achievement?> findById(Session session, int id) {
    return Achievement.db.findById(session, id);
  }

  Future<List<Achievement>> listByIds(
    Session session,
    List<int> achievementIds,
  ) {
    if (achievementIds.isEmpty) {
      return Future.value([]);
    }
    return Achievement.db.find(
      session,
      where: (t) => t.id.inSet(achievementIds.toSet()),
    );
  }

  Future<List<Achievement>> listByConditionType(
    Session session,
    String conditionType,
  ) {
    return Achievement.db.find(
      session,
      where: (t) => t.conditionType.equals(conditionType),
    );
  }

  Future<Achievement> insert(
    Session session, {
    required String title,
    required String description,
    String? iconUrl,
    required int pointsReward,
    int? relatedCourseId,
    required String conditionType,
    String? conditionValue,
    Transaction? transaction,
  }) {
    final row = Achievement(
      title: title,
      description: description,
      iconUrl: iconUrl,
      pointsReward: pointsReward,
      relatedCourseId: relatedCourseId,
      conditionType: conditionType,
      conditionValue: conditionValue,
    );

    return Achievement.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }
}
