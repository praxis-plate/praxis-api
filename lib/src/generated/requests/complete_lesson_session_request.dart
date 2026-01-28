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

abstract class CompleteLessonSessionRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CompleteLessonSessionRequest._({
    required this.lessonId,
    required this.totalXpEarned,
    required this.bonusXp,
    required this.timeSpentSeconds,
    required this.totalTasks,
    required this.correctTasks,
  });

  factory CompleteLessonSessionRequest({
    required int lessonId,
    required int totalXpEarned,
    required int bonusXp,
    required int timeSpentSeconds,
    required int totalTasks,
    required int correctTasks,
  }) = _CompleteLessonSessionRequestImpl;

  factory CompleteLessonSessionRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CompleteLessonSessionRequest(
      lessonId: jsonSerialization['lessonId'] as int,
      totalXpEarned: jsonSerialization['totalXpEarned'] as int,
      bonusXp: jsonSerialization['bonusXp'] as int,
      timeSpentSeconds: jsonSerialization['timeSpentSeconds'] as int,
      totalTasks: jsonSerialization['totalTasks'] as int,
      correctTasks: jsonSerialization['correctTasks'] as int,
    );
  }

  int lessonId;

  int totalXpEarned;

  int bonusXp;

  int timeSpentSeconds;

  int totalTasks;

  int correctTasks;

  /// Returns a shallow copy of this [CompleteLessonSessionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CompleteLessonSessionRequest copyWith({
    int? lessonId,
    int? totalXpEarned,
    int? bonusXp,
    int? timeSpentSeconds,
    int? totalTasks,
    int? correctTasks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CompleteLessonSessionRequest',
      'lessonId': lessonId,
      'totalXpEarned': totalXpEarned,
      'bonusXp': bonusXp,
      'timeSpentSeconds': timeSpentSeconds,
      'totalTasks': totalTasks,
      'correctTasks': correctTasks,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CompleteLessonSessionRequest',
      'lessonId': lessonId,
      'totalXpEarned': totalXpEarned,
      'bonusXp': bonusXp,
      'timeSpentSeconds': timeSpentSeconds,
      'totalTasks': totalTasks,
      'correctTasks': correctTasks,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CompleteLessonSessionRequestImpl extends CompleteLessonSessionRequest {
  _CompleteLessonSessionRequestImpl({
    required int lessonId,
    required int totalXpEarned,
    required int bonusXp,
    required int timeSpentSeconds,
    required int totalTasks,
    required int correctTasks,
  }) : super._(
         lessonId: lessonId,
         totalXpEarned: totalXpEarned,
         bonusXp: bonusXp,
         timeSpentSeconds: timeSpentSeconds,
         totalTasks: totalTasks,
         correctTasks: correctTasks,
       );

  /// Returns a shallow copy of this [CompleteLessonSessionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CompleteLessonSessionRequest copyWith({
    int? lessonId,
    int? totalXpEarned,
    int? bonusXp,
    int? timeSpentSeconds,
    int? totalTasks,
    int? correctTasks,
  }) {
    return CompleteLessonSessionRequest(
      lessonId: lessonId ?? this.lessonId,
      totalXpEarned: totalXpEarned ?? this.totalXpEarned,
      bonusXp: bonusXp ?? this.bonusXp,
      timeSpentSeconds: timeSpentSeconds ?? this.timeSpentSeconds,
      totalTasks: totalTasks ?? this.totalTasks,
      correctTasks: correctTasks ?? this.correctTasks,
    );
  }
}
