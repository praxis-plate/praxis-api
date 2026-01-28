/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../dto/achievement_dto.dart' as _i2;
import 'package:praxis_server/src/generated/protocol.dart' as _i3;

abstract class LessonCompletionResultDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LessonCompletionResultDto._({
    required this.lessonId,
    required this.totalXpEarned,
    required this.bonusXp,
    required this.totalXpWithBonus,
    required this.timeSpentSeconds,
    required this.totalTasks,
    required this.correctTasks,
    required this.accuracyPercentage,
    required this.coinsAwarded,
    required this.experiencePoints,
    required this.currentStreak,
    required this.unlockedAchievements,
  });

  factory LessonCompletionResultDto({
    required int lessonId,
    required int totalXpEarned,
    required int bonusXp,
    required int totalXpWithBonus,
    required int timeSpentSeconds,
    required int totalTasks,
    required int correctTasks,
    required double accuracyPercentage,
    required int coinsAwarded,
    required int experiencePoints,
    required int currentStreak,
    required List<_i2.AchievementDto> unlockedAchievements,
  }) = _LessonCompletionResultDtoImpl;

  factory LessonCompletionResultDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return LessonCompletionResultDto(
      lessonId: jsonSerialization['lessonId'] as int,
      totalXpEarned: jsonSerialization['totalXpEarned'] as int,
      bonusXp: jsonSerialization['bonusXp'] as int,
      totalXpWithBonus: jsonSerialization['totalXpWithBonus'] as int,
      timeSpentSeconds: jsonSerialization['timeSpentSeconds'] as int,
      totalTasks: jsonSerialization['totalTasks'] as int,
      correctTasks: jsonSerialization['correctTasks'] as int,
      accuracyPercentage: (jsonSerialization['accuracyPercentage'] as num)
          .toDouble(),
      coinsAwarded: jsonSerialization['coinsAwarded'] as int,
      experiencePoints: jsonSerialization['experiencePoints'] as int,
      currentStreak: jsonSerialization['currentStreak'] as int,
      unlockedAchievements: _i3.Protocol()
          .deserialize<List<_i2.AchievementDto>>(
            jsonSerialization['unlockedAchievements'],
          ),
    );
  }

  int lessonId;

  int totalXpEarned;

  int bonusXp;

  int totalXpWithBonus;

  int timeSpentSeconds;

  int totalTasks;

  int correctTasks;

  double accuracyPercentage;

  int coinsAwarded;

  int experiencePoints;

  int currentStreak;

  List<_i2.AchievementDto> unlockedAchievements;

  /// Returns a shallow copy of this [LessonCompletionResultDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LessonCompletionResultDto copyWith({
    int? lessonId,
    int? totalXpEarned,
    int? bonusXp,
    int? totalXpWithBonus,
    int? timeSpentSeconds,
    int? totalTasks,
    int? correctTasks,
    double? accuracyPercentage,
    int? coinsAwarded,
    int? experiencePoints,
    int? currentStreak,
    List<_i2.AchievementDto>? unlockedAchievements,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LessonCompletionResultDto',
      'lessonId': lessonId,
      'totalXpEarned': totalXpEarned,
      'bonusXp': bonusXp,
      'totalXpWithBonus': totalXpWithBonus,
      'timeSpentSeconds': timeSpentSeconds,
      'totalTasks': totalTasks,
      'correctTasks': correctTasks,
      'accuracyPercentage': accuracyPercentage,
      'coinsAwarded': coinsAwarded,
      'experiencePoints': experiencePoints,
      'currentStreak': currentStreak,
      'unlockedAchievements': unlockedAchievements.toJson(
        valueToJson: (v) => v.toJson(),
      ),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LessonCompletionResultDto',
      'lessonId': lessonId,
      'totalXpEarned': totalXpEarned,
      'bonusXp': bonusXp,
      'totalXpWithBonus': totalXpWithBonus,
      'timeSpentSeconds': timeSpentSeconds,
      'totalTasks': totalTasks,
      'correctTasks': correctTasks,
      'accuracyPercentage': accuracyPercentage,
      'coinsAwarded': coinsAwarded,
      'experiencePoints': experiencePoints,
      'currentStreak': currentStreak,
      'unlockedAchievements': unlockedAchievements.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LessonCompletionResultDtoImpl extends LessonCompletionResultDto {
  _LessonCompletionResultDtoImpl({
    required int lessonId,
    required int totalXpEarned,
    required int bonusXp,
    required int totalXpWithBonus,
    required int timeSpentSeconds,
    required int totalTasks,
    required int correctTasks,
    required double accuracyPercentage,
    required int coinsAwarded,
    required int experiencePoints,
    required int currentStreak,
    required List<_i2.AchievementDto> unlockedAchievements,
  }) : super._(
         lessonId: lessonId,
         totalXpEarned: totalXpEarned,
         bonusXp: bonusXp,
         totalXpWithBonus: totalXpWithBonus,
         timeSpentSeconds: timeSpentSeconds,
         totalTasks: totalTasks,
         correctTasks: correctTasks,
         accuracyPercentage: accuracyPercentage,
         coinsAwarded: coinsAwarded,
         experiencePoints: experiencePoints,
         currentStreak: currentStreak,
         unlockedAchievements: unlockedAchievements,
       );

  /// Returns a shallow copy of this [LessonCompletionResultDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LessonCompletionResultDto copyWith({
    int? lessonId,
    int? totalXpEarned,
    int? bonusXp,
    int? totalXpWithBonus,
    int? timeSpentSeconds,
    int? totalTasks,
    int? correctTasks,
    double? accuracyPercentage,
    int? coinsAwarded,
    int? experiencePoints,
    int? currentStreak,
    List<_i2.AchievementDto>? unlockedAchievements,
  }) {
    return LessonCompletionResultDto(
      lessonId: lessonId ?? this.lessonId,
      totalXpEarned: totalXpEarned ?? this.totalXpEarned,
      bonusXp: bonusXp ?? this.bonusXp,
      totalXpWithBonus: totalXpWithBonus ?? this.totalXpWithBonus,
      timeSpentSeconds: timeSpentSeconds ?? this.timeSpentSeconds,
      totalTasks: totalTasks ?? this.totalTasks,
      correctTasks: correctTasks ?? this.correctTasks,
      accuracyPercentage: accuracyPercentage ?? this.accuracyPercentage,
      coinsAwarded: coinsAwarded ?? this.coinsAwarded,
      experiencePoints: experiencePoints ?? this.experiencePoints,
      currentStreak: currentStreak ?? this.currentStreak,
      unlockedAchievements:
          unlockedAchievements ??
          this.unlockedAchievements.map((e0) => e0.copyWith()).toList(),
    );
  }
}
