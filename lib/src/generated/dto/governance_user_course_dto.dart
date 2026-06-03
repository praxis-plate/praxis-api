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
import '../enums/content_status.dart' as _i2;

abstract class GovernanceUserCourseDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GovernanceUserCourseDto._({
    required this.courseId,
    required this.title,
    required this.category,
    required this.author,
    required this.contentStatus,
    required this.updatedAt,
    this.enrolledAt,
    this.completedAt,
    required this.isCompleted,
  });

  factory GovernanceUserCourseDto({
    required int courseId,
    required String title,
    required String category,
    required String author,
    required _i2.ContentStatus contentStatus,
    required DateTime updatedAt,
    DateTime? enrolledAt,
    DateTime? completedAt,
    required bool isCompleted,
  }) = _GovernanceUserCourseDtoImpl;

  factory GovernanceUserCourseDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return GovernanceUserCourseDto(
      courseId: jsonSerialization['courseId'] as int,
      title: jsonSerialization['title'] as String,
      category: jsonSerialization['category'] as String,
      author: jsonSerialization['author'] as String,
      contentStatus: _i2.ContentStatus.fromJson(
        (jsonSerialization['contentStatus'] as String),
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      enrolledAt: jsonSerialization['enrolledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['enrolledAt']),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      isCompleted: jsonSerialization['isCompleted'] as bool,
    );
  }

  int courseId;

  String title;

  String category;

  String author;

  _i2.ContentStatus contentStatus;

  DateTime updatedAt;

  DateTime? enrolledAt;

  DateTime? completedAt;

  bool isCompleted;

  /// Returns a shallow copy of this [GovernanceUserCourseDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GovernanceUserCourseDto copyWith({
    int? courseId,
    String? title,
    String? category,
    String? author,
    _i2.ContentStatus? contentStatus,
    DateTime? updatedAt,
    DateTime? enrolledAt,
    DateTime? completedAt,
    bool? isCompleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GovernanceUserCourseDto',
      'courseId': courseId,
      'title': title,
      'category': category,
      'author': author,
      'contentStatus': contentStatus.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (enrolledAt != null) 'enrolledAt': enrolledAt?.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      'isCompleted': isCompleted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GovernanceUserCourseDto',
      'courseId': courseId,
      'title': title,
      'category': category,
      'author': author,
      'contentStatus': contentStatus.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (enrolledAt != null) 'enrolledAt': enrolledAt?.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      'isCompleted': isCompleted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GovernanceUserCourseDtoImpl extends GovernanceUserCourseDto {
  _GovernanceUserCourseDtoImpl({
    required int courseId,
    required String title,
    required String category,
    required String author,
    required _i2.ContentStatus contentStatus,
    required DateTime updatedAt,
    DateTime? enrolledAt,
    DateTime? completedAt,
    required bool isCompleted,
  }) : super._(
         courseId: courseId,
         title: title,
         category: category,
         author: author,
         contentStatus: contentStatus,
         updatedAt: updatedAt,
         enrolledAt: enrolledAt,
         completedAt: completedAt,
         isCompleted: isCompleted,
       );

  /// Returns a shallow copy of this [GovernanceUserCourseDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GovernanceUserCourseDto copyWith({
    int? courseId,
    String? title,
    String? category,
    String? author,
    _i2.ContentStatus? contentStatus,
    DateTime? updatedAt,
    Object? enrolledAt = _Undefined,
    Object? completedAt = _Undefined,
    bool? isCompleted,
  }) {
    return GovernanceUserCourseDto(
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      category: category ?? this.category,
      author: author ?? this.author,
      contentStatus: contentStatus ?? this.contentStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      enrolledAt: enrolledAt is DateTime? ? enrolledAt : this.enrolledAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
