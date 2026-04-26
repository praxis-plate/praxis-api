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
import '../enums/adaptive_learning_path_type.dart' as _i2;
import '../dto/adaptive_topic_mastery_dto.dart' as _i3;
import 'package:praxis_server/src/generated/protocol.dart' as _i4;

abstract class AdaptiveLearningPathDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AdaptiveLearningPathDto._({
    required this.courseId,
    required this.pathType,
    this.recommendedLessonId,
    this.recommendedLessonTitle,
    this.supportingLessonId,
    this.supportingLessonTitle,
    this.focusTopic,
    required this.overallMasteryScore,
    required this.reason,
    required this.topicMasteries,
  });

  factory AdaptiveLearningPathDto({
    required int courseId,
    required _i2.AdaptiveLearningPathType pathType,
    int? recommendedLessonId,
    String? recommendedLessonTitle,
    int? supportingLessonId,
    String? supportingLessonTitle,
    String? focusTopic,
    required double overallMasteryScore,
    required String reason,
    required List<_i3.AdaptiveTopicMasteryDto> topicMasteries,
  }) = _AdaptiveLearningPathDtoImpl;

  factory AdaptiveLearningPathDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return AdaptiveLearningPathDto(
      courseId: jsonSerialization['courseId'] as int,
      pathType: _i2.AdaptiveLearningPathType.fromJson(
        (jsonSerialization['pathType'] as String),
      ),
      recommendedLessonId: jsonSerialization['recommendedLessonId'] as int?,
      recommendedLessonTitle:
          jsonSerialization['recommendedLessonTitle'] as String?,
      supportingLessonId: jsonSerialization['supportingLessonId'] as int?,
      supportingLessonTitle:
          jsonSerialization['supportingLessonTitle'] as String?,
      focusTopic: jsonSerialization['focusTopic'] as String?,
      overallMasteryScore: (jsonSerialization['overallMasteryScore'] as num)
          .toDouble(),
      reason: jsonSerialization['reason'] as String,
      topicMasteries: _i4.Protocol()
          .deserialize<List<_i3.AdaptiveTopicMasteryDto>>(
            jsonSerialization['topicMasteries'],
          ),
    );
  }

  int courseId;

  _i2.AdaptiveLearningPathType pathType;

  int? recommendedLessonId;

  String? recommendedLessonTitle;

  int? supportingLessonId;

  String? supportingLessonTitle;

  String? focusTopic;

  double overallMasteryScore;

  String reason;

  List<_i3.AdaptiveTopicMasteryDto> topicMasteries;

  /// Returns a shallow copy of this [AdaptiveLearningPathDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AdaptiveLearningPathDto copyWith({
    int? courseId,
    _i2.AdaptiveLearningPathType? pathType,
    int? recommendedLessonId,
    String? recommendedLessonTitle,
    int? supportingLessonId,
    String? supportingLessonTitle,
    String? focusTopic,
    double? overallMasteryScore,
    String? reason,
    List<_i3.AdaptiveTopicMasteryDto>? topicMasteries,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AdaptiveLearningPathDto',
      'courseId': courseId,
      'pathType': pathType.toJson(),
      if (recommendedLessonId != null)
        'recommendedLessonId': recommendedLessonId,
      if (recommendedLessonTitle != null)
        'recommendedLessonTitle': recommendedLessonTitle,
      if (supportingLessonId != null) 'supportingLessonId': supportingLessonId,
      if (supportingLessonTitle != null)
        'supportingLessonTitle': supportingLessonTitle,
      if (focusTopic != null) 'focusTopic': focusTopic,
      'overallMasteryScore': overallMasteryScore,
      'reason': reason,
      'topicMasteries': topicMasteries.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AdaptiveLearningPathDto',
      'courseId': courseId,
      'pathType': pathType.toJson(),
      if (recommendedLessonId != null)
        'recommendedLessonId': recommendedLessonId,
      if (recommendedLessonTitle != null)
        'recommendedLessonTitle': recommendedLessonTitle,
      if (supportingLessonId != null) 'supportingLessonId': supportingLessonId,
      if (supportingLessonTitle != null)
        'supportingLessonTitle': supportingLessonTitle,
      if (focusTopic != null) 'focusTopic': focusTopic,
      'overallMasteryScore': overallMasteryScore,
      'reason': reason,
      'topicMasteries': topicMasteries.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AdaptiveLearningPathDtoImpl extends AdaptiveLearningPathDto {
  _AdaptiveLearningPathDtoImpl({
    required int courseId,
    required _i2.AdaptiveLearningPathType pathType,
    int? recommendedLessonId,
    String? recommendedLessonTitle,
    int? supportingLessonId,
    String? supportingLessonTitle,
    String? focusTopic,
    required double overallMasteryScore,
    required String reason,
    required List<_i3.AdaptiveTopicMasteryDto> topicMasteries,
  }) : super._(
         courseId: courseId,
         pathType: pathType,
         recommendedLessonId: recommendedLessonId,
         recommendedLessonTitle: recommendedLessonTitle,
         supportingLessonId: supportingLessonId,
         supportingLessonTitle: supportingLessonTitle,
         focusTopic: focusTopic,
         overallMasteryScore: overallMasteryScore,
         reason: reason,
         topicMasteries: topicMasteries,
       );

  /// Returns a shallow copy of this [AdaptiveLearningPathDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AdaptiveLearningPathDto copyWith({
    int? courseId,
    _i2.AdaptiveLearningPathType? pathType,
    Object? recommendedLessonId = _Undefined,
    Object? recommendedLessonTitle = _Undefined,
    Object? supportingLessonId = _Undefined,
    Object? supportingLessonTitle = _Undefined,
    Object? focusTopic = _Undefined,
    double? overallMasteryScore,
    String? reason,
    List<_i3.AdaptiveTopicMasteryDto>? topicMasteries,
  }) {
    return AdaptiveLearningPathDto(
      courseId: courseId ?? this.courseId,
      pathType: pathType ?? this.pathType,
      recommendedLessonId: recommendedLessonId is int?
          ? recommendedLessonId
          : this.recommendedLessonId,
      recommendedLessonTitle: recommendedLessonTitle is String?
          ? recommendedLessonTitle
          : this.recommendedLessonTitle,
      supportingLessonId: supportingLessonId is int?
          ? supportingLessonId
          : this.supportingLessonId,
      supportingLessonTitle: supportingLessonTitle is String?
          ? supportingLessonTitle
          : this.supportingLessonTitle,
      focusTopic: focusTopic is String? ? focusTopic : this.focusTopic,
      overallMasteryScore: overallMasteryScore ?? this.overallMasteryScore,
      reason: reason ?? this.reason,
      topicMasteries:
          topicMasteries ??
          this.topicMasteries.map((e0) => e0.copyWith()).toList(),
    );
  }
}
