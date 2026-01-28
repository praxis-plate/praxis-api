import 'package:praxis_server/src/datasources/user_statistics_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/mappers/user_statistics_mapper.dart';
import 'package:serverpod/serverpod.dart';

/// Statistics service for internal server operations
/// Handles user learning statistics, streaks, and experience points
class UserStatisticsService {
  final UserStatisticsDataSource _dataSource;

  UserStatisticsService({
    required UserStatisticsDataSource dataSource,
  }) : _dataSource = dataSource;

  /// Gets user statistics for authenticated user (public API)
  /// Always returns UserStatisticsDto, creates empty statistics for first-time users
  Future<UserStatisticsDto> get(
    Session session, {
    required UuidValue authUserId,
  }) async {
    final statistic = await _dataSource.findByAuthUserId(
      session,
      authUserId,
    );

    if (statistic != null) {
      return statistic.toUserStatisticsDto();
    }

    // Create empty statistics for first-time user
    final newStatistic = await ensureStatistics(
      session,
      authUserId: authUserId,
    );

    return newStatistic.toUserStatisticsDto();
  }

  /// Ensures user statistics exist (internal use)
  Future<UserStatistics> ensureStatistics(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) async {
    final existing = await _dataSource.findByAuthUserId(
      session,
      authUserId,
      transaction: transaction,
    );

    if (existing != null) {
      return existing;
    }

    final now = DateTime.now();
    return _dataSource.insert(
      session,
      authUserId: authUserId,
      currentStreak: 0,
      maxStreak: 0,
      experiencePoints: 0,
      lastActiveDate: now,
      transaction: transaction,
    );
  }

  /// Records lesson completion and awards experience points
  Future<void> recordLessonCompletion(
    Session session, {
    required UuidValue authUserId,
    required int experiencePoints,
    Transaction? transaction,
  }) async {
    final statistics = await ensureStatistics(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );

    await _updateActivity(
      session,
      statistics: statistics,
      experiencePointsToAdd: experiencePoints,
      transaction: transaction,
    );
  }

  /// Updates daily streak based on user activity
  Future<void> updateDailyStreak(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) async {
    final statistics = await ensureStatistics(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastActiveDay = DateTime(
      statistics.lastActiveDate.year,
      statistics.lastActiveDate.month,
      statistics.lastActiveDate.day,
    );

    int newCurrentStreak = statistics.currentStreak;
    int newMaxStreak = statistics.maxStreak;

    if (today.isAfter(lastActiveDay)) {
      final daysDifference = today.difference(lastActiveDay).inDays;

      if (daysDifference == 1) {
        // Consecutive day - increment streak
        newCurrentStreak = statistics.currentStreak + 1;
      } else if (daysDifference > 1) {
        // Streak broken - reset to 1
        newCurrentStreak = 1;
      }
      // Same day - no change to streak

      if (newCurrentStreak > newMaxStreak) {
        newMaxStreak = newCurrentStreak;
      }

      await _dataSource.updateById(
        session,
        statistics.id!,
        currentStreak: newCurrentStreak,
        maxStreak: newMaxStreak,
        lastActiveDate: now,
        transaction: transaction,
      );
    }
  }

  /// Adds experience points to user statistics
  Future<void> addExperiencePoints(
    Session session, {
    required UuidValue authUserId,
    required int points,
    Transaction? transaction,
  }) async {
    final statistics = await ensureStatistics(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );

    await _dataSource.updateById(
      session,
      statistics.id!,
      experiencePoints: statistics.experiencePoints + points,
      transaction: transaction,
    );
  }

  /// Internal method to update activity and experience points
  Future<void> _updateActivity(
    Session session, {
    required UserStatistics statistics,
    int experiencePointsToAdd = 0,
    Transaction? transaction,
  }) async {
    final now = DateTime.now();

    await _dataSource.updateById(
      session,
      statistics.id!,
      experiencePoints: statistics.experiencePoints + experiencePointsToAdd,
      lastActiveDate: now,
      transaction: transaction,
    );
  }
}
