import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UserCourseDataSource {
  const UserCourseDataSource();

  Future<List<UserCourse>> listByCourseId(
    Session session,
    int courseId, {
    Transaction? transaction,
  }) {
    return UserCourse.db.find(
      session,
      where: (t) => t.courseId.equals(courseId),
      orderBy: (t) => t.enrolledAt,
      orderDescending: true,
      transaction: transaction,
    );
  }

  Future<List<UserCourse>> listByCourseIds(
    Session session,
    List<int> courseIds, {
    Transaction? transaction,
  }) {
    if (courseIds.isEmpty) {
      return Future.value([]);
    }

    return UserCourse.db.find(
      session,
      where: (t) => t.courseId.inSet(courseIds.toSet()),
      orderBy: (t) => t.enrolledAt,
      orderDescending: true,
      transaction: transaction,
    );
  }

  Future<List<UserCourse>> listByAuthUserId(
    Session session,
    UuidValue authUserId,
  ) {
    return UserCourse.db.find(
      session,
      where: (t) => t.authUserId.equals(authUserId),
      orderBy: (t) => t.enrolledAt,
      orderDescending: true,
    );
  }

  Future<UserCourse?> findByAuthUserAndCourse(
    Session session,
    UuidValue authUserId,
    int courseId, {
    Transaction? transaction,
  }) {
    return UserCourse.db.findFirstRow(
      session,
      where: (t) =>
          t.authUserId.equals(authUserId) & t.courseId.equals(courseId),
      transaction: transaction,
    );
  }

  Future<UserCourse> insert(
    Session session, {
    required UuidValue authUserId,
    required int courseId,
    required DateTime enrolledAt,
    required bool isCompleted,
    DateTime? completedAt,
    Transaction? transaction,
  }) {
    final row = UserCourse(
      authUserId: authUserId,
      courseId: courseId,
      enrolledAt: enrolledAt,
      isCompleted: isCompleted,
      completedAt: completedAt,
    );

    return UserCourse.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<void> deleteById(
    Session session,
    int id, {
    Transaction? transaction,
  }) async {
    await UserCourse.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
      transaction: transaction,
    );
  }
}
