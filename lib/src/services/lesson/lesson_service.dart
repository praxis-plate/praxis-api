import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_progress_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/achievement/achievement_service.dart';
import 'package:praxis_server/src/services/user_statistics/user_statistics_service.dart';
import 'package:praxis_server/src/services/wallet/wallet_service.dart';
import 'package:praxis_server/src/shared/mappers/learning_content_mapper.dart';
import 'package:serverpod/serverpod.dart';

class LessonService {
  static const int _lessonCompletionRewardCoins = 50;

  final LessonDataSource _lessonDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonProgressDataSource _lessonProgressDataSource;
  final UserStatisticsService _userStatisticsService;
  final WalletService _walletService;
  final AchievementService _achievementService;

  LessonService({
    required LessonDataSource lessonDataSource,
    required ModuleDataSource moduleDataSource,
    required LessonProgressDataSource lessonProgressDataSource,
    required UserStatisticsService userStatisticsService,
    required WalletService walletService,
    required AchievementService achievementService,
  }) : _lessonDataSource = lessonDataSource,
       _moduleDataSource = moduleDataSource,
       _lessonProgressDataSource = lessonProgressDataSource,
       _userStatisticsService = userStatisticsService,
       _walletService = walletService,
       _achievementService = achievementService;

  Future<List<LessonDto>> get(
    Session session, {
    int? courseId,
    int? moduleId,
  }) async {
    if (courseId == null && moduleId == null) {
      throw ValidationException(
        message: 'courseId or moduleId must be provided',
        field: 'courseId',
      );
    }

    if (moduleId != null) {
      final lessons = await _lessonDataSource.listByModuleId(
        session,
        moduleId,
      );
      return lessons.map((lesson) => lesson.toLessonDto()).toList();
    }

    final modules = await _moduleDataSource.listByCourseId(
      session,
      courseId!,
    );
    final lessons = <LessonDto>[];
    for (final module in modules) {
      final moduleLessons = await _lessonDataSource.listByModuleId(
        session,
        module.id!,
      );
      lessons.addAll(moduleLessons.map((lesson) => lesson.toLessonDto()));
    }

    return lessons;
  }

  Future<void> markComplete(
    Session session, {
    required UuidValue authUserId,
    required int lessonId,
    int timeSpentSeconds = 0,
  }) async {
    final existing = await _lessonProgressDataSource.findByAuthUserIdAndLessonId(
      session,
      authUserId,
      lessonId,
    );

    if (existing != null) {
      await _lessonProgressDataSource.updateById(
        session,
        existing.id!,
        isCompleted: true,
        completedAt: DateTime.now(),
        timeSpentSeconds: timeSpentSeconds,
      );
      return;
    }

    await _lessonProgressDataSource.insert(
      session,
      authUserId: authUserId,
      lessonId: lessonId,
      isCompleted: true,
      completedAt: DateTime.now(),
      timeSpentSeconds: timeSpentSeconds,
    );
  }

  Future<LessonCompletionResultDto> complete(
    Session session,
    CompleteLessonSessionRequest request, {
    required UuidValue authUserId,
  }) async {
    await markComplete(
      session,
      authUserId: authUserId,
      lessonId: request.lessonId,
      timeSpentSeconds: request.timeSpentSeconds,
    );

    await _userStatisticsService.updateDailyStreak(
      session,
      authUserId: authUserId,
    );

    final totalXpWithBonus = request.totalXpEarned + request.bonusXp;
    await _userStatisticsService.addExperiencePoints(
      session,
      authUserId: authUserId,
      points: totalXpWithBonus,
    );

    await _walletService.grantReward(
      session,
      authUserId: authUserId,
      amount: _lessonCompletionRewardCoins,
      reason: 'lesson_completion',
      relatedEntityId: request.lessonId.toString(),
    );

    final statistics = await _userStatisticsService.get(
      session,
      authUserId: authUserId,
    );
    final unlockedAchievements = await _achievementService
        .awardStreakAchievements(
          session,
          authUserId: authUserId,
          currentStreak: statistics.currentStreak,
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
  }
}
