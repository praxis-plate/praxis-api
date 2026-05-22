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
import '../dto/course_analytics_summary_dto.dart' as _i2;
import '../dto/course_analytics_lesson_dto.dart' as _i3;
import '../dto/course_analytics_task_dto.dart' as _i4;
import '../dto/course_analytics_wrong_answer_dto.dart' as _i5;
import 'package:praxis_server/src/generated/protocol.dart' as _i6;

abstract class CourseAnalyticsDashboardDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseAnalyticsDashboardDto._({
    required this.summary,
    required this.lessons,
    required this.tasks,
    required this.commonWrongAnswers,
  });

  factory CourseAnalyticsDashboardDto({
    required _i2.CourseAnalyticsSummaryDto summary,
    required List<_i3.CourseAnalyticsLessonDto> lessons,
    required List<_i4.CourseAnalyticsTaskDto> tasks,
    required List<_i5.CourseAnalyticsWrongAnswerDto> commonWrongAnswers,
  }) = _CourseAnalyticsDashboardDtoImpl;

  factory CourseAnalyticsDashboardDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CourseAnalyticsDashboardDto(
      summary: _i6.Protocol().deserialize<_i2.CourseAnalyticsSummaryDto>(
        jsonSerialization['summary'],
      ),
      lessons: _i6.Protocol().deserialize<List<_i3.CourseAnalyticsLessonDto>>(
        jsonSerialization['lessons'],
      ),
      tasks: _i6.Protocol().deserialize<List<_i4.CourseAnalyticsTaskDto>>(
        jsonSerialization['tasks'],
      ),
      commonWrongAnswers: _i6.Protocol()
          .deserialize<List<_i5.CourseAnalyticsWrongAnswerDto>>(
            jsonSerialization['commonWrongAnswers'],
          ),
    );
  }

  _i2.CourseAnalyticsSummaryDto summary;

  List<_i3.CourseAnalyticsLessonDto> lessons;

  List<_i4.CourseAnalyticsTaskDto> tasks;

  List<_i5.CourseAnalyticsWrongAnswerDto> commonWrongAnswers;

  /// Returns a shallow copy of this [CourseAnalyticsDashboardDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseAnalyticsDashboardDto copyWith({
    _i2.CourseAnalyticsSummaryDto? summary,
    List<_i3.CourseAnalyticsLessonDto>? lessons,
    List<_i4.CourseAnalyticsTaskDto>? tasks,
    List<_i5.CourseAnalyticsWrongAnswerDto>? commonWrongAnswers,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseAnalyticsDashboardDto',
      'summary': summary.toJson(),
      'lessons': lessons.toJson(valueToJson: (v) => v.toJson()),
      'tasks': tasks.toJson(valueToJson: (v) => v.toJson()),
      'commonWrongAnswers': commonWrongAnswers.toJson(
        valueToJson: (v) => v.toJson(),
      ),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseAnalyticsDashboardDto',
      'summary': summary.toJsonForProtocol(),
      'lessons': lessons.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'tasks': tasks.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'commonWrongAnswers': commonWrongAnswers.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CourseAnalyticsDashboardDtoImpl extends CourseAnalyticsDashboardDto {
  _CourseAnalyticsDashboardDtoImpl({
    required _i2.CourseAnalyticsSummaryDto summary,
    required List<_i3.CourseAnalyticsLessonDto> lessons,
    required List<_i4.CourseAnalyticsTaskDto> tasks,
    required List<_i5.CourseAnalyticsWrongAnswerDto> commonWrongAnswers,
  }) : super._(
         summary: summary,
         lessons: lessons,
         tasks: tasks,
         commonWrongAnswers: commonWrongAnswers,
       );

  /// Returns a shallow copy of this [CourseAnalyticsDashboardDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseAnalyticsDashboardDto copyWith({
    _i2.CourseAnalyticsSummaryDto? summary,
    List<_i3.CourseAnalyticsLessonDto>? lessons,
    List<_i4.CourseAnalyticsTaskDto>? tasks,
    List<_i5.CourseAnalyticsWrongAnswerDto>? commonWrongAnswers,
  }) {
    return CourseAnalyticsDashboardDto(
      summary: summary ?? this.summary.copyWith(),
      lessons: lessons ?? this.lessons.map((e0) => e0.copyWith()).toList(),
      tasks: tasks ?? this.tasks.map((e0) => e0.copyWith()).toList(),
      commonWrongAnswers:
          commonWrongAnswers ??
          this.commonWrongAnswers.map((e0) => e0.copyWith()).toList(),
    );
  }
}
