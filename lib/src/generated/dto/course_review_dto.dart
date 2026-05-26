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

abstract class CourseReviewDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseReviewDto._({
    required this.id,
    required this.courseId,
    required this.authorName,
    required this.isCurrentUserReview,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  factory CourseReviewDto({
    required int id,
    required int courseId,
    required String authorName,
    required bool isCurrentUserReview,
    required int rating,
    required String comment,
    required DateTime createdAt,
  }) = _CourseReviewDtoImpl;

  factory CourseReviewDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CourseReviewDto(
      id: jsonSerialization['id'] as int,
      courseId: jsonSerialization['courseId'] as int,
      authorName: jsonSerialization['authorName'] as String,
      isCurrentUserReview: jsonSerialization['isCurrentUserReview'] as bool,
      rating: jsonSerialization['rating'] as int,
      comment: jsonSerialization['comment'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  int id;

  int courseId;

  String authorName;

  bool isCurrentUserReview;

  int rating;

  String comment;

  DateTime createdAt;

  /// Returns a shallow copy of this [CourseReviewDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseReviewDto copyWith({
    int? id,
    int? courseId,
    String? authorName,
    bool? isCurrentUserReview,
    int? rating,
    String? comment,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseReviewDto',
      'id': id,
      'courseId': courseId,
      'authorName': authorName,
      'isCurrentUserReview': isCurrentUserReview,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseReviewDto',
      'id': id,
      'courseId': courseId,
      'authorName': authorName,
      'isCurrentUserReview': isCurrentUserReview,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CourseReviewDtoImpl extends CourseReviewDto {
  _CourseReviewDtoImpl({
    required int id,
    required int courseId,
    required String authorName,
    required bool isCurrentUserReview,
    required int rating,
    required String comment,
    required DateTime createdAt,
  }) : super._(
         id: id,
         courseId: courseId,
         authorName: authorName,
         isCurrentUserReview: isCurrentUserReview,
         rating: rating,
         comment: comment,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CourseReviewDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseReviewDto copyWith({
    int? id,
    int? courseId,
    String? authorName,
    bool? isCurrentUserReview,
    int? rating,
    String? comment,
    DateTime? createdAt,
  }) {
    return CourseReviewDto(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      authorName: authorName ?? this.authorName,
      isCurrentUserReview: isCurrentUserReview ?? this.isCurrentUserReview,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
