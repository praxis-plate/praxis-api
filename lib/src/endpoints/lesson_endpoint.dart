import 'package:praxis_server/src/datasources/achievement_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_progress_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/user_achievement_data_source.dart';
import 'package:praxis_server/src/datasources/user_statistics_data_source.dart';
import 'package:praxis_server/src/datasources/wallet_data_source.dart';
import 'package:praxis_server/src/datasources/coin_transactions_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/achievement/achievement_service.dart';
import 'package:praxis_server/src/services/lesson/lesson_service.dart';
import 'package:praxis_server/src/services/user_statistics/user_statistics_service.dart';
import 'package:praxis_server/src/services/wallet/wallet_service.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class LessonEndpoint extends Endpoint {
  LessonEndpoint()
    : _lessonService = LessonService(
        lessonDataSource: const LessonDataSource(),
        moduleDataSource: const ModuleDataSource(),
        lessonProgressDataSource: const LessonProgressDataSource(),
        userStatisticsService: UserStatisticsService(
          dataSource: const UserStatisticsDataSource(),
        ),
        walletService: WalletService(
          coinTransactionsDataSource: const CoinTransactionsDataSource(),
          walletDataSource: const WalletDataSource(),
        ),
        achievementService: AchievementService(
          achievementDataSource: const AchievementDataSource(),
          userAchievementDataSource: const UserAchievementDataSource(),
        ),
      );

  final LessonService _lessonService;

  Future<List<LessonDto>> get(
    Session session, {
    int? courseId,
    int? moduleId,
  }) {
    return _lessonService.get(
      session,
      courseId: courseId,
      moduleId: moduleId,
    );
  }

  Future<void> markComplete(
    Session session,
    int lessonId, {
    int timeSpentSeconds = 0,
  }) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return _lessonService.markComplete(
      session,
      authUserId: authUserId,
      lessonId: lessonId,
      timeSpentSeconds: timeSpentSeconds,
    );
  }

  Future<LessonCompletionResultDto> complete(
    Session session,
    CompleteLessonSessionRequest request,
  ) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return _lessonService.complete(
      session,
      request,
      authUserId: authUserId,
    );
  }
}
