import 'package:serverpod/serverpod.dart';

class BaseDataSource {
  const BaseDataSource();

  /// Executes [action] within a database transaction.
  /// If [transaction] is provided, [action] runs inside it.
  /// Otherwise, a new transaction is created and used.
  Future<T> runInTransaction<T>(
    Session session,
    Future<T> Function(Transaction transaction) action, {
    Transaction? transaction,
  }) {
    if (transaction != null) {
      return action(transaction);
    }
    return session.db.transaction(action);
  }
}
