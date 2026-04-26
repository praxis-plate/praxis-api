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

abstract class AdaptiveTopicMasteryDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AdaptiveTopicMasteryDto._({
    required this.topic,
    required this.masteryScore,
    required this.accuracyRatio,
    required this.completionRatio,
    required this.correctAnswers,
    required this.totalAttempts,
    required this.completedLessons,
    required this.totalTopicLessons,
  });

  factory AdaptiveTopicMasteryDto({
    required String topic,
    required double masteryScore,
    required double accuracyRatio,
    required double completionRatio,
    required int correctAnswers,
    required int totalAttempts,
    required int completedLessons,
    required int totalTopicLessons,
  }) = _AdaptiveTopicMasteryDtoImpl;

  factory AdaptiveTopicMasteryDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return AdaptiveTopicMasteryDto(
      topic: jsonSerialization['topic'] as String,
      masteryScore: (jsonSerialization['masteryScore'] as num).toDouble(),
      accuracyRatio: (jsonSerialization['accuracyRatio'] as num).toDouble(),
      completionRatio: (jsonSerialization['completionRatio'] as num).toDouble(),
      correctAnswers: jsonSerialization['correctAnswers'] as int,
      totalAttempts: jsonSerialization['totalAttempts'] as int,
      completedLessons: jsonSerialization['completedLessons'] as int,
      totalTopicLessons: jsonSerialization['totalTopicLessons'] as int,
    );
  }

  String topic;

  double masteryScore;

  double accuracyRatio;

  double completionRatio;

  int correctAnswers;

  int totalAttempts;

  int completedLessons;

  int totalTopicLessons;

  /// Returns a shallow copy of this [AdaptiveTopicMasteryDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AdaptiveTopicMasteryDto copyWith({
    String? topic,
    double? masteryScore,
    double? accuracyRatio,
    double? completionRatio,
    int? correctAnswers,
    int? totalAttempts,
    int? completedLessons,
    int? totalTopicLessons,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AdaptiveTopicMasteryDto',
      'topic': topic,
      'masteryScore': masteryScore,
      'accuracyRatio': accuracyRatio,
      'completionRatio': completionRatio,
      'correctAnswers': correctAnswers,
      'totalAttempts': totalAttempts,
      'completedLessons': completedLessons,
      'totalTopicLessons': totalTopicLessons,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AdaptiveTopicMasteryDto',
      'topic': topic,
      'masteryScore': masteryScore,
      'accuracyRatio': accuracyRatio,
      'completionRatio': completionRatio,
      'correctAnswers': correctAnswers,
      'totalAttempts': totalAttempts,
      'completedLessons': completedLessons,
      'totalTopicLessons': totalTopicLessons,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AdaptiveTopicMasteryDtoImpl extends AdaptiveTopicMasteryDto {
  _AdaptiveTopicMasteryDtoImpl({
    required String topic,
    required double masteryScore,
    required double accuracyRatio,
    required double completionRatio,
    required int correctAnswers,
    required int totalAttempts,
    required int completedLessons,
    required int totalTopicLessons,
  }) : super._(
         topic: topic,
         masteryScore: masteryScore,
         accuracyRatio: accuracyRatio,
         completionRatio: completionRatio,
         correctAnswers: correctAnswers,
         totalAttempts: totalAttempts,
         completedLessons: completedLessons,
         totalTopicLessons: totalTopicLessons,
       );

  /// Returns a shallow copy of this [AdaptiveTopicMasteryDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AdaptiveTopicMasteryDto copyWith({
    String? topic,
    double? masteryScore,
    double? accuracyRatio,
    double? completionRatio,
    int? correctAnswers,
    int? totalAttempts,
    int? completedLessons,
    int? totalTopicLessons,
  }) {
    return AdaptiveTopicMasteryDto(
      topic: topic ?? this.topic,
      masteryScore: masteryScore ?? this.masteryScore,
      accuracyRatio: accuracyRatio ?? this.accuracyRatio,
      completionRatio: completionRatio ?? this.completionRatio,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      totalAttempts: totalAttempts ?? this.totalAttempts,
      completedLessons: completedLessons ?? this.completedLessons,
      totalTopicLessons: totalTopicLessons ?? this.totalTopicLessons,
    );
  }
}
