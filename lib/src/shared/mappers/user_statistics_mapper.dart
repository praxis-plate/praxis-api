import 'package:praxis_server/src/generated/protocol.dart';

extension UserStatisticsToDtoMapper on UserStatistics {
  UserStatisticsDto toUserStatisticsDto() {
    assert(id != null, 'User statistics id is not set');
    return UserStatisticsDto(
      id: id!,
      authUserId: authUserId.toString(),
      currentStreak: currentStreak,
      maxStreak: maxStreak,
      experiencePoints: experiencePoints,
      lastActiveDate: lastActiveDate,
    );
  }
}
