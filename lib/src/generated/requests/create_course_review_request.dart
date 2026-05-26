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

abstract class CreateCourseReviewRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateCourseReviewRequest._({
    required this.rating,
    required this.comment,
  });

  factory CreateCourseReviewRequest({
    required int rating,
    required String comment,
  }) = _CreateCourseReviewRequestImpl;

  factory CreateCourseReviewRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateCourseReviewRequest(
      rating: jsonSerialization['rating'] as int,
      comment: jsonSerialization['comment'] as String,
    );
  }

  int rating;

  String comment;

  /// Returns a shallow copy of this [CreateCourseReviewRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateCourseReviewRequest copyWith({
    int? rating,
    String? comment,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateCourseReviewRequest',
      'rating': rating,
      'comment': comment,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreateCourseReviewRequest',
      'rating': rating,
      'comment': comment,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CreateCourseReviewRequestImpl extends CreateCourseReviewRequest {
  _CreateCourseReviewRequestImpl({
    required int rating,
    required String comment,
  }) : super._(
         rating: rating,
         comment: comment,
       );

  /// Returns a shallow copy of this [CreateCourseReviewRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateCourseReviewRequest copyWith({
    int? rating,
    String? comment,
  }) {
    return CreateCourseReviewRequest(
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
    );
  }
}
