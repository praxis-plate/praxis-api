import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class LessonProgressDataSource {
  const LessonProgressDataSource();

  Future<LessonProgress?> findByAuthUserIdAndLessonId(
    Session session,
    UuidValue authUserId,
    int lessonId, {
    Transaction? transaction,
  }) {
    return LessonProgress.db.findFirstRow(
      session,
      where: (t) =>
          t.authUserId.equals(authUserId) & t.lessonId.equals(lessonId),
      transaction: transaction,
    );
  }

  Future<List<LessonProgress>> listByAuthUserId(
    Session session,
    UuidValue authUserId,
  ) {
    return LessonProgress.db.find(
      session,
      where: (t) => t.authUserId.equals(authUserId),
    );
  }

  Future<LessonProgress> insert(
    Session session, {
    required UuidValue authUserId,
    required int lessonId,
    required bool isCompleted,
    DateTime? completedAt,
    required int timeSpentSeconds,
    Transaction? transaction,
  }) {
    final row = LessonProgress(
      authUserId: authUserId,
      lessonId: lessonId,
      isCompleted: isCompleted,
      completedAt: completedAt,
      timeSpentSeconds: timeSpentSeconds,
    );

    return LessonProgress.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<LessonProgress?> updateById(
    Session session,
    int id, {
    bool? isCompleted,
    DateTime? completedAt,
    int? timeSpentSeconds,
    Transaction? transaction,
  }) {
    return LessonProgress.db.updateById(
      session,
      id,
      columnValues: (t) {
        final values = <ColumnValue>[];
        if (isCompleted != null) {
          values.add(t.isCompleted(isCompleted));
        }
        if (completedAt != null) {
          values.add(t.completedAt(completedAt));
        }
        if (timeSpentSeconds != null) {
          values.add(t.timeSpentSeconds(timeSpentSeconds));
        }
        if (values.isEmpty) {
          throw ArgumentError('No fields provided for update');
        }
        return values;
      },
      transaction: transaction,
    );
  }
}
