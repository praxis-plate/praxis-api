import 'package:praxis_server/src/generated/protocol.dart';

extension AchievementMapper on Achievement {
  AchievementDto toAchievementDto({DateTime? unlockedAt}) {
    assert(id != null, 'Achievement id is not set');
    return AchievementDto(
      id: id!,
      title: title,
      description: description,
      iconUrl: iconUrl,
      unlockedAt: unlockedAt,
    );
  }
}
