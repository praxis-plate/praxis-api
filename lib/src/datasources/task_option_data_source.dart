import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:praxis_server/src/datasources/base_data_source.dart';

class TaskOptionDataSource extends BaseDataSource {
  const TaskOptionDataSource();

  Future<List<TaskOption>> listByTaskId(Session session, int taskId) {
    return TaskOption.db.find(
      session,
      where: (t) => t.taskId.equals(taskId),
      orderBy: (t) => t.orderIndex,
    );
  }

  Future<List<TaskOption>> listByTaskIds(
    Session session,
    List<int> taskIds,
  ) {
    if (taskIds.isEmpty) {
      return Future.value([]);
    }
    return TaskOption.db.find(
      session,
      where: (t) => t.taskId.inSet(taskIds.toSet()),
      orderBy: (t) => t.orderIndex,
    );
  }

  Future<TaskOption> insert(
    Session session, {
    required int taskId,
    required String optionText,
    required bool isCorrect,
    required int orderIndex,
    Transaction? transaction,
  }) {
    final row = TaskOption(
      taskId: taskId,
      optionText: optionText,
      isCorrect: isCorrect,
      orderIndex: orderIndex,
    );

    return TaskOption.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }
}
