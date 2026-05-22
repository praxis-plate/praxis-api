import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TaskTestCaseDataSource {
  const TaskTestCaseDataSource();

  Future<List<TaskTestCase>> listByTaskId(
    Session session,
    int taskId, {
    Transaction? transaction,
  }) {
    return TaskTestCase.db.find(
      session,
      where: (t) => t.taskId.equals(taskId),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<List<TaskTestCase>> listByTaskIds(
    Session session,
    List<int> taskIds, {
    Transaction? transaction,
  }) {
    if (taskIds.isEmpty) {
      return Future.value([]);
    }
    return TaskTestCase.db.find(
      session,
      where: (t) => t.taskId.inSet(taskIds.toSet()),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<TaskTestCase?> findById(
    Session session,
    int id, {
    Transaction? transaction,
  }) {
    return TaskTestCase.db.findById(session, id, transaction: transaction);
  }

  Future<TaskTestCase> insert(
    Session session, {
    required int taskId,
    required String input,
    required String expectedOutput,
    required bool isHidden,
    required int orderIndex,
    required DateTime updatedAt,
    Transaction? transaction,
  }) {
    final row = TaskTestCase(
      taskId: taskId,
      input: input,
      expectedOutput: expectedOutput,
      isHidden: isHidden,
      orderIndex: orderIndex,
      updatedAt: updatedAt,
    );

    return TaskTestCase.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<TaskTestCase> updateRow(
    Session session,
    TaskTestCase row, {
    Transaction? transaction,
  }) {
    return TaskTestCase.db.updateRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<void> deleteByIds(
    Session session,
    Set<int> testCaseIds, {
    Transaction? transaction,
  }) async {
    if (testCaseIds.isEmpty) {
      return;
    }

    await TaskTestCase.db.deleteWhere(
      session,
      where: (t) => t.id.inSet(testCaseIds),
      transaction: transaction,
    );
  }

  Future<void> deleteByTaskIds(
    Session session,
    Set<int> taskIds, {
    Transaction? transaction,
  }) async {
    if (taskIds.isEmpty) {
      return;
    }

    await TaskTestCase.db.deleteWhere(
      session,
      where: (t) => t.taskId.inSet(taskIds),
      transaction: transaction,
    );
  }
}
