import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/course/course_service.dart';
import 'package:serverpod/serverpod.dart';

class SubmitCourseReviewUseCase {
  final CourseService _courseService;

  SubmitCourseReviewUseCase({required CourseService courseService})
    : _courseService = courseService;

  Future<CourseReviewDto> execute(
    Session session,
    int courseId, {
    required UuidValue authUserId,
    required CreateCourseReviewRequest request,
  }) {
    return _courseService.submitReview(
      session,
      courseId,
      authUserId: authUserId,
      rating: request.rating,
      comment: request.comment,
    );
  }
}
