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
import '../dto/module_dto.dart' as _i3;
import '../dto/lesson_dto.dart' as _i4;
import '../dto/task_dto.dart' as _i5;
import '../dto/course_review_dto.dart' as _i6;
import 'package:praxis_server/src/generated/protocol.dart' as _i7;

abstract class CourseDetailDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseDetailDto._({
    required this.course,
    required this.modules,
    required this.lessons,
    required this.tasks,
    this.reviews,
    this.canSubmitReview,
    this.currentUserReview,
  });

  factory CourseDetailDto({
    required _i2.CourseDto course,
    required List<_i3.ModuleDto> modules,
    required List<_i4.LessonDto> lessons,
    required List<_i5.TaskDto> tasks,
    List<_i6.CourseReviewDto>? reviews,
    bool? canSubmitReview,
    _i6.CourseReviewDto? currentUserReview,
  }) = _CourseDetailDtoImpl;

  factory CourseDetailDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CourseDetailDto(
      course: _i7.Protocol().deserialize<_i2.CourseDto>(
        jsonSerialization['course'],
      ),
      modules: _i7.Protocol().deserialize<List<_i3.ModuleDto>>(
        jsonSerialization['modules'],
      ),
      lessons: _i7.Protocol().deserialize<List<_i4.LessonDto>>(
        jsonSerialization['lessons'],
      ),
      tasks: _i7.Protocol().deserialize<List<_i5.TaskDto>>(
        jsonSerialization['tasks'],
      ),
      reviews: jsonSerialization['reviews'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i6.CourseReviewDto>>(
              jsonSerialization['reviews'],
            ),
      canSubmitReview: jsonSerialization['canSubmitReview'] as bool?,
      currentUserReview: jsonSerialization['currentUserReview'] == null
          ? null
          : _i7.Protocol().deserialize<_i6.CourseReviewDto>(
              jsonSerialization['currentUserReview'],
            ),
    );
  }

  _i2.CourseDto course;

  List<_i3.ModuleDto> modules;

  List<_i4.LessonDto> lessons;

  List<_i5.TaskDto> tasks;

  List<_i6.CourseReviewDto>? reviews;

  bool? canSubmitReview;

  _i6.CourseReviewDto? currentUserReview;

  /// Returns a shallow copy of this [CourseDetailDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseDetailDto copyWith({
    _i2.CourseDto? course,
    List<_i3.ModuleDto>? modules,
    List<_i4.LessonDto>? lessons,
    List<_i5.TaskDto>? tasks,
    List<_i6.CourseReviewDto>? reviews,
    bool? canSubmitReview,
    _i6.CourseReviewDto? currentUserReview,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseDetailDto',
      'course': course.toJson(),
      'modules': modules.toJson(valueToJson: (v) => v.toJson()),
      'lessons': lessons.toJson(valueToJson: (v) => v.toJson()),
      'tasks': tasks.toJson(valueToJson: (v) => v.toJson()),
      if (reviews != null)
        'reviews': reviews?.toJson(valueToJson: (v) => v.toJson()),
      if (canSubmitReview != null) 'canSubmitReview': canSubmitReview,
      if (currentUserReview != null)
        'currentUserReview': currentUserReview?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseDetailDto',
      'course': course.toJsonForProtocol(),
      'modules': modules.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'lessons': lessons.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'tasks': tasks.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (reviews != null)
        'reviews': reviews?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (canSubmitReview != null) 'canSubmitReview': canSubmitReview,
      if (currentUserReview != null)
        'currentUserReview': currentUserReview?.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseDetailDtoImpl extends CourseDetailDto {
  _CourseDetailDtoImpl({
    required _i2.CourseDto course,
    required List<_i3.ModuleDto> modules,
    required List<_i4.LessonDto> lessons,
    required List<_i5.TaskDto> tasks,
    List<_i6.CourseReviewDto>? reviews,
    bool? canSubmitReview,
    _i6.CourseReviewDto? currentUserReview,
  }) : super._(
         course: course,
         modules: modules,
         lessons: lessons,
         tasks: tasks,
         reviews: reviews,
         canSubmitReview: canSubmitReview,
         currentUserReview: currentUserReview,
       );

  /// Returns a shallow copy of this [CourseDetailDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseDetailDto copyWith({
    _i2.CourseDto? course,
    List<_i3.ModuleDto>? modules,
    List<_i4.LessonDto>? lessons,
    List<_i5.TaskDto>? tasks,
    Object? reviews = _Undefined,
    Object? canSubmitReview = _Undefined,
    Object? currentUserReview = _Undefined,
  }) {
    return CourseDetailDto(
      course: course ?? this.course.copyWith(),
      modules: modules ?? this.modules.map((e0) => e0.copyWith()).toList(),
      lessons: lessons ?? this.lessons.map((e0) => e0.copyWith()).toList(),
      tasks: tasks ?? this.tasks.map((e0) => e0.copyWith()).toList(),
      reviews: reviews is List<_i6.CourseReviewDto>?
          ? reviews
          : this.reviews?.map((e0) => e0.copyWith()).toList(),
      canSubmitReview: canSubmitReview is bool?
          ? canSubmitReview
          : this.canSubmitReview,
      currentUserReview: currentUserReview is _i6.CourseReviewDto?
          ? currentUserReview
          : this.currentUserReview?.copyWith(),
    );
  }
}
