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
import '../dto/course_dto.dart' as _i2;
import 'package:praxis_server/src/generated/protocol.dart' as _i3;

abstract class CourseRecommendationDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseRecommendationDto._({
    required this.course,
    required this.score,
    required this.reason,
  });

  factory CourseRecommendationDto({
    required _i2.CourseDto course,
    required double score,
    required String reason,
  }) = _CourseRecommendationDtoImpl;

  factory CourseRecommendationDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CourseRecommendationDto(
      course: _i3.Protocol().deserialize<_i2.CourseDto>(
        jsonSerialization['course'],
      ),
      score: (jsonSerialization['score'] as num).toDouble(),
      reason: jsonSerialization['reason'] as String,
    );
  }

  _i2.CourseDto course;

  double score;

  String reason;

  /// Returns a shallow copy of this [CourseRecommendationDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseRecommendationDto copyWith({
    _i2.CourseDto? course,
    double? score,
    String? reason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseRecommendationDto',
      'course': course.toJson(),
      'score': score,
      'reason': reason,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseRecommendationDto',
      'course': course.toJsonForProtocol(),
      'score': score,
      'reason': reason,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CourseRecommendationDtoImpl extends CourseRecommendationDto {
  _CourseRecommendationDtoImpl({
    required _i2.CourseDto course,
    required double score,
    required String reason,
  }) : super._(
         course: course,
         score: score,
         reason: reason,
       );

  /// Returns a shallow copy of this [CourseRecommendationDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseRecommendationDto copyWith({
    _i2.CourseDto? course,
    double? score,
    String? reason,
  }) {
    return CourseRecommendationDto(
      course: course ?? this.course.copyWith(),
      score: score ?? this.score,
      reason: reason ?? this.reason,
    );
  }
}
