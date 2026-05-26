import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CourseReviewDataSource {
  const CourseReviewDataSource();

  Future<List<CourseReview>> listByCourseId(
    Session session,
    int courseId, {
    Transaction? transaction,
  }) {
    return CourseReview.db.find(
      session,
      where: (t) => t.courseId.equals(courseId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      transaction: transaction,
    );
  }

  Future<CourseReview?> findByAuthUserAndCourse(
    Session session,
    UuidValue authUserId,
    int courseId, {
    Transaction? transaction,
  }) {
    return CourseReview.db.findFirstRow(
      session,
      where: (t) =>
          t.authUserId.equals(authUserId) & t.courseId.equals(courseId),
      transaction: transaction,
    );
  }

  Future<CourseReview> insert(
    Session session, {
    required UuidValue authUserId,
    required int courseId,
    required int rating,
    required String comment,
    required DateTime createdAt,
    required DateTime updatedAt,
    Transaction? transaction,
  }) {
    final row = CourseReview(
      authUserId: authUserId,
      courseId: courseId,
      rating: rating,
      comment: comment,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

    return CourseReview.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<CourseReview> updateRow(
    Session session,
    CourseReview row, {
    Transaction? transaction,
  }) {
    return CourseReview.db.updateRow(
      session,
      row,
      transaction: transaction,
    );
  }
}
