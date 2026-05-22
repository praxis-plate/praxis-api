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

abstract class LessonProgressDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LessonProgressDto._({
    required this.id,
    required this.lessonId,
    required this.isCompleted,
    this.completedAt,
    required this.timeSpentSeconds,
  });

  factory LessonProgressDto({
    required int id,
    required int lessonId,
    required bool isCompleted,
    DateTime? completedAt,
    required int timeSpentSeconds,
  }) = _LessonProgressDtoImpl;

  factory LessonProgressDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return LessonProgressDto(
      id: jsonSerialization['id'] as int,
      lessonId: jsonSerialization['lessonId'] as int,
      isCompleted: jsonSerialization['isCompleted'] as bool,
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      timeSpentSeconds: jsonSerialization['timeSpentSeconds'] as int,
    );
  }

  int id;

  int lessonId;

  bool isCompleted;

  DateTime? completedAt;

  int timeSpentSeconds;

  /// Returns a shallow copy of this [LessonProgressDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LessonProgressDto copyWith({
    int? id,
    int? lessonId,
    bool? isCompleted,
    DateTime? completedAt,
    int? timeSpentSeconds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LessonProgressDto',
      'id': id,
      'lessonId': lessonId,
      'isCompleted': isCompleted,
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      'timeSpentSeconds': timeSpentSeconds,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LessonProgressDto',
      'id': id,
      'lessonId': lessonId,
      'isCompleted': isCompleted,
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      'timeSpentSeconds': timeSpentSeconds,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LessonProgressDtoImpl extends LessonProgressDto {
  _LessonProgressDtoImpl({
    required int id,
    required int lessonId,
    required bool isCompleted,
    DateTime? completedAt,
    required int timeSpentSeconds,
  }) : super._(
         id: id,
         lessonId: lessonId,
         isCompleted: isCompleted,
         completedAt: completedAt,
         timeSpentSeconds: timeSpentSeconds,
       );

  /// Returns a shallow copy of this [LessonProgressDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LessonProgressDto copyWith({
    int? id,
    int? lessonId,
    bool? isCompleted,
    Object? completedAt = _Undefined,
    int? timeSpentSeconds,
  }) {
    return LessonProgressDto(
      id: id ?? this.id,
      lessonId: lessonId ?? this.lessonId,
      isCompleted: isCompleted ?? this.isCompleted,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      timeSpentSeconds: timeSpentSeconds ?? this.timeSpentSeconds,
    );
  }
}
