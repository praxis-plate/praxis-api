import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/user_statistics/user_statistics_service.dart';
import 'package:serverpod/serverpod.dart';

class GetUserStatisticsUseCase {
  final UserStatisticsService _userStatisticsService;

  GetUserStatisticsUseCase({
    required UserStatisticsService userStatisticsService,
  }) : _userStatisticsService = userStatisticsService;

  Future<UserStatisticsDto> execute(
    Session session, {
    required UuidValue authUserId,
  }) {
    return _userStatisticsService.get(
      session,
      authUserId: authUserId,
    );
  }
}
