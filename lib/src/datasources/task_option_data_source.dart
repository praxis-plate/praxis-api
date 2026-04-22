import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TaskOptionDataSource {
  const TaskOptionDataSource();

  Future<List<TaskOption>> listByTaskId(
    Session session,
    int taskId, {
    Transaction? transaction,
  }) {
    return TaskOption.db.find(
      session,
      where: (t) => t.taskId.equals(taskId),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<List<TaskOption>> listByTaskIds(
    Session session,
    List<int> taskIds, {
    Transaction? transaction,
  }) {
    if (taskIds.isEmpty) {
      return Future.value([]);
    }
    return TaskOption.db.find(
      session,
      where: (t) => t.taskId.inSet(taskIds.toSet()),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<TaskOption?> findById(
    Session session,
    int id, {
    Transaction? transaction,
  }) {
    return TaskOption.db.findById(session, id, transaction: transaction);
  }

  Future<TaskOption> insert(
    Session session, {
    required int taskId,
    required String optionText,
    required bool isCorrect,
    required int orderIndex,
    required DateTime updatedAt,
    Transaction? transaction,
  }) {
    final row = TaskOption(
      taskId: taskId,
      optionText: optionText,
      isCorrect: isCorrect,
      orderIndex: orderIndex,
      updatedAt: updatedAt,
    );

    return TaskOption.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<TaskOption> updateRow(
    Session session,
    TaskOption row, {
    Transaction? transaction,
  }) {
    return TaskOption.db.updateRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<void> deleteByIds(
    Session session,
    Set<int> optionIds, {
    Transaction? transaction,
  }) async {
    if (optionIds.isEmpty) {
      return;
    }

    await TaskOption.db.deleteWhere(
      session,
      where: (t) => t.id.inSet(optionIds),
      transaction: transaction,
    );
  }
}
