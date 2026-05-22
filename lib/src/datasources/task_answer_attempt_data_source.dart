import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TaskAnswerAttemptDataSource {
  const TaskAnswerAttemptDataSource();

  Future<List<TaskAnswerAttempt>> listByTaskIds(
    Session session,
    List<int> taskIds, {
    Transaction? transaction,
  }) {
    if (taskIds.isEmpty) {
      return Future.value([]);
    }

    return TaskAnswerAttempt.db.find(
      session,
      where: (t) => t.taskId.inSet(taskIds.toSet()),
      orderBy: (t) => t.submittedAt,
      orderDescending: true,
      transaction: transaction,
    );
  }

  Future<List<TaskAnswerAttempt>> listByAuthUserIdAndTaskIds(
    Session session,
    UuidValue authUserId,
    List<int> taskIds, {
    Transaction? transaction,
  }) {
    if (taskIds.isEmpty) {
      return Future.value([]);
    }

    return TaskAnswerAttempt.db.find(
      session,
      where: (t) =>
          t.authUserId.equals(authUserId) & t.taskId.inSet(taskIds.toSet()),
      orderBy: (t) => t.submittedAt,
      orderDescending: true,
      transaction: transaction,
    );
  }

  Future<TaskAnswerAttempt> insert(
    Session session, {
    required UuidValue? authUserId,
    required int taskId,
    required String? userAnswer,
    required bool isCorrect,
    required String feedbackType,
    required DateTime submittedAt,
    Transaction? transaction,
  }) {
    final row = TaskAnswerAttempt(
      authUserId: authUserId,
      taskId: taskId,
      userAnswer: userAnswer,
      isCorrect: isCorrect,
      feedbackType: feedbackType,
      submittedAt: submittedAt,
    );

    return TaskAnswerAttempt.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }
}
