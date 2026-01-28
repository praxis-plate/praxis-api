import 'package:serverpod/serverpod.dart';

class TransactionRunner {
  const TransactionRunner();

  Future<T> run<T>(
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
