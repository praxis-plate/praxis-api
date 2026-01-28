import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TaskTestCaseDataSource {
  const TaskTestCaseDataSource();

  Future<List<TaskTestCase>> listByTaskId(Session session, int taskId) {
    return TaskTestCase.db.find(
      session,
      where: (t) => t.taskId.equals(taskId),
      orderBy: (t) => t.orderIndex,
    );
  }

  Future<List<TaskTestCase>> listByTaskIds(
    Session session,
    List<int> taskIds,
  ) {
    if (taskIds.isEmpty) {
      return Future.value([]);
    }
    return TaskTestCase.db.find(
      session,
      where: (t) => t.taskId.inSet(taskIds.toSet()),
      orderBy: (t) => t.orderIndex,
    );
  }

  Future<TaskTestCase> insert(
    Session session, {
    required int taskId,
    required String input,
    required String expectedOutput,
    required bool isHidden,
    required int orderIndex,
    Transaction? transaction,
  }) {
    final row = TaskTestCase(
      taskId: taskId,
      input: input,
      expectedOutput: expectedOutput,
      isHidden: isHidden,
      orderIndex: orderIndex,
    );

    return TaskTestCase.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }
}
