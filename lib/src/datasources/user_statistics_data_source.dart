import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:praxis_server/src/datasources/base_data_source.dart';

class UserStatisticsDataSource extends BaseDataSource {
  const UserStatisticsDataSource();

  Future<UserStatistics?> findByAuthUserId(
    Session session,
    UuidValue authUserId, {
    Transaction? transaction,
  }) {
    return UserStatistics.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
      transaction: transaction,
    );
  }

  Future<UserStatistics?> findById(
    Session session,
    int id, {
    Transaction? transaction,
  }) {
    return UserStatistics.db.findById(
      session,
      id,
      transaction: transaction,
    );
  }

  Future<UserStatistics> insert(
    Session session, {
    required UuidValue authUserId,
    required int currentStreak,
    required int maxStreak,
    required int experiencePoints,
    required DateTime lastActiveDate,
    Transaction? transaction,
  }) {
    final row = UserStatistics(
      authUserId: authUserId,
      currentStreak: currentStreak,
      maxStreak: maxStreak,
      experiencePoints: experiencePoints,
      lastActiveDate: lastActiveDate,
    );

    return UserStatistics.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<UserStatistics?> updateById(
    Session session,
    int id, {
    int? currentStreak,
    int? maxStreak,
    int? experiencePoints,
    DateTime? lastActiveDate,
    Transaction? transaction,
  }) {
    return UserStatistics.db.updateById(
      session,
      id,
      columnValues: (t) {
        final values = <ColumnValue>[
          if (currentStreak != null) t.currentStreak(currentStreak),
          if (maxStreak != null) t.maxStreak(maxStreak),
          if (experiencePoints != null) t.experiencePoints(experiencePoints),
          if (lastActiveDate != null) t.lastActiveDate(lastActiveDate),
        ];
        if (values.isEmpty) {
          throw ArgumentError('No fields provided for update');
        }
        return values;
      },
      transaction: transaction,
    );
  }

  Future<void> deleteByAuthUserId(
    Session session,
    UuidValue authUserId, {
    Transaction? transaction,
  }) async {
    await UserStatistics.db.deleteWhere(
      session,
      where: (t) => t.authUserId.equals(authUserId),
      transaction: transaction,
    );
  }
}
