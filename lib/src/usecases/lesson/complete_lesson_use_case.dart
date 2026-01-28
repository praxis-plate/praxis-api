import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/achievement/achievement_service.dart';
import 'package:praxis_server/src/services/lesson/lesson_service.dart';
import 'package:praxis_server/src/services/user_statistics/user_statistics_service.dart';
import 'package:praxis_server/src/services/wallet/wallet_service.dart';
import 'package:praxis_server/src/shared/transaction_runner.dart';
import 'package:serverpod/serverpod.dart';

class CompleteLessonUseCase {
  static const int _lessonCompletionRewardCoins = 50;

  final LessonService _lessonService;
  final UserStatisticsService _userStatisticsService;
  final WalletService _walletService;
  final AchievementService _achievementService;
  final TransactionRunner _transactionRunner;

  CompleteLessonUseCase({
    required LessonService lessonService,
    required UserStatisticsService userStatisticsService,
    required WalletService walletService,
    required AchievementService achievementService,
    required TransactionRunner transactionRunner,
  }) : _lessonService = lessonService,
       _userStatisticsService = userStatisticsService,
       _walletService = walletService,
       _achievementService = achievementService,
       _transactionRunner = transactionRunner;

  Future<LessonCompletionResultDto> execute(
    Session session,
    CompleteLessonSessionRequest request, {
    required UuidValue authUserId,
  }) async {
    return _transactionRunner.run(
      session,
      (transaction) async {
        await _lessonService.markCompleteInTransaction(
          session,
          authUserId: authUserId,
          lessonId: request.lessonId,
          timeSpentSeconds: request.timeSpentSeconds,
          transaction: transaction,
        );

        await _userStatisticsService.updateDailyStreak(
          session,
          authUserId: authUserId,
          transaction: transaction,
        );

        final totalXpWithBonus = request.totalXpEarned + request.bonusXp;
        await _userStatisticsService.addExperiencePoints(
          session,
          authUserId: authUserId,
          points: totalXpWithBonus,
          transaction: transaction,
        );

        await _walletService.grantReward(
          session,
          authUserId: authUserId,
          amount: _lessonCompletionRewardCoins,
          reason: 'lesson_completion',
          relatedEntityId: request.lessonId.toString(),
          transaction: transaction,
        );

        final statistics = await _userStatisticsService.get(
          session,
          authUserId: authUserId,
          transaction: transaction,
        );
        final unlockedAchievements = await _achievementService
            .awardStreakAchievements(
              session,
              authUserId: authUserId,
              currentStreak: statistics.currentStreak,
              transaction: transaction,
            );

        final accuracy = request.totalTasks == 0
            ? 0.0
            : (request.correctTasks / request.totalTasks) * 100;

        return LessonCompletionResultDto(
          lessonId: request.lessonId,
          totalXpEarned: request.totalXpEarned,
          bonusXp: request.bonusXp,
          totalXpWithBonus: totalXpWithBonus,
          timeSpentSeconds: request.timeSpentSeconds,
          totalTasks: request.totalTasks,
          correctTasks: request.correctTasks,
          accuracyPercentage: accuracy,
          coinsAwarded: _lessonCompletionRewardCoins,
          experiencePoints: statistics.experiencePoints,
          currentStreak: statistics.currentStreak,
          unlockedAchievements: unlockedAchievements,
        );
      },
    );
  }
}
