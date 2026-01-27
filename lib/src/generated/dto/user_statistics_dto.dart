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

abstract class UserStatisticsDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UserStatisticsDto._({
    required this.id,
    required this.authUserId,
    required this.currentStreak,
    required this.maxStreak,
    required this.experiencePoints,
    required this.lastActiveDate,
  });

  factory UserStatisticsDto({
    required int id,
    required String authUserId,
    required int currentStreak,
    required int maxStreak,
    required int experiencePoints,
    required DateTime lastActiveDate,
  }) = _UserStatisticsDtoImpl;

  factory UserStatisticsDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserStatisticsDto(
      id: jsonSerialization['id'] as int,
      authUserId: jsonSerialization['authUserId'] as String,
      currentStreak: jsonSerialization['currentStreak'] as int,
      maxStreak: jsonSerialization['maxStreak'] as int,
      experiencePoints: jsonSerialization['experiencePoints'] as int,
      lastActiveDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastActiveDate'],
      ),
    );
  }

  int id;

  String authUserId;

  int currentStreak;

  int maxStreak;

  int experiencePoints;

  DateTime lastActiveDate;

  /// Returns a shallow copy of this [UserStatisticsDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserStatisticsDto copyWith({
    int? id,
    String? authUserId,
    int? currentStreak,
    int? maxStreak,
    int? experiencePoints,
    DateTime? lastActiveDate,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserStatisticsDto',
      'id': id,
      'authUserId': authUserId,
      'currentStreak': currentStreak,
      'maxStreak': maxStreak,
      'experiencePoints': experiencePoints,
      'lastActiveDate': lastActiveDate.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserStatisticsDto',
      'id': id,
      'authUserId': authUserId,
      'currentStreak': currentStreak,
      'maxStreak': maxStreak,
      'experiencePoints': experiencePoints,
      'lastActiveDate': lastActiveDate.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UserStatisticsDtoImpl extends UserStatisticsDto {
  _UserStatisticsDtoImpl({
    required int id,
    required String authUserId,
    required int currentStreak,
    required int maxStreak,
    required int experiencePoints,
    required DateTime lastActiveDate,
  }) : super._(
         id: id,
         authUserId: authUserId,
         currentStreak: currentStreak,
         maxStreak: maxStreak,
         experiencePoints: experiencePoints,
         lastActiveDate: lastActiveDate,
       );

  /// Returns a shallow copy of this [UserStatisticsDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserStatisticsDto copyWith({
    int? id,
    String? authUserId,
    int? currentStreak,
    int? maxStreak,
    int? experiencePoints,
    DateTime? lastActiveDate,
  }) {
    return UserStatisticsDto(
      id: id ?? this.id,
      authUserId: authUserId ?? this.authUserId,
      currentStreak: currentStreak ?? this.currentStreak,
      maxStreak: maxStreak ?? this.maxStreak,
      experiencePoints: experiencePoints ?? this.experiencePoints,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
    );
  }
}
