import 'package:serverpod/serverpod.dart';

class TransactionRunner {
  const TransactionRunner();

  Future<T> run<T>(
    Session session,
    Future<T> Function(Transaction transaction) action,
    {Transaction? existingTransaction},
  ) {
    if (existingTransaction != null) {
      return action(existingTransaction);
    }
    return session.db.transaction(action);
  }
}
