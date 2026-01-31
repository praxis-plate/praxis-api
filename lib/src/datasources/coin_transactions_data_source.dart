import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/coin_transaction_status.dart';
import 'package:serverpod/serverpod.dart';

class CoinTransactionsDataSource {
  const CoinTransactionsDataSource();

  Future<CoinTransaction> create(
    Session session, {
    required UuidValue authUserId,
    required String transactionKey,
    required CoinTransactionType type,
    required String status,
    required int amount,
    required String currency,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
    required DateTime createdAt,
    Transaction? transaction,
  }) {
    final row = CoinTransaction(
      authUserId: authUserId,
      transactionKey: transactionKey,
      type: type,
      status: status,
      amount: amount,
      currency: currency,
      relatedEntityId: relatedEntityId,
      reversalOfTransactionId: reversalOfTransactionId,
      reason: reason,
      metadata: metadata,
      createdAt: createdAt,
    );

    return CoinTransaction.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<List<CoinTransaction>> listByAuthUserId(
    Session session,
    UuidValue authUserId, {
    int? limit,
    int? offset,
  }) {
    return CoinTransaction.db.find(
      session,
      where: (t) => t.authUserId.equals(authUserId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit,
      offset: offset,
    );
  }

  Future<CoinTransaction?> findById(
    Session session,
    int id, {
    Transaction? transaction,
  }) {
    return CoinTransaction.db.findById(
      session,
      id,
      transaction: transaction,
    );
  }

  Future<CoinTransaction?> findByTransactionKey(
    Session session,
    String transactionKey, {
    Transaction? transaction,
  }) {
    return CoinTransaction.db.findFirstRow(
      session,
      where: (t) => t.transactionKey.equals(transactionKey),
      transaction: transaction,
    );
  }

  Future<List<CoinTransaction>> listByReversalIdAndType(
    Session session, {
    required int reversalOfTransactionId,
    required CoinTransactionType type,
    Transaction? transaction,
  }) {
    return CoinTransaction.db.find(
      session,
      where: (t) =>
          t.reversalOfTransactionId.equals(reversalOfTransactionId) &
          t.type.equals(type),
      transaction: transaction,
    );
  }

  Future<bool> hasPostedBuyForCourse(
    Session session, {
    required UuidValue authUserId,
    required int courseId,
    Transaction? transaction,
  }) async {
    final existing = await CoinTransaction.db.findFirstRow(
      session,
      where: (t) =>
          t.authUserId.equals(authUserId) &
          t.type.equals(CoinTransactionType.buy) &
          t.status.equals(CoinTransactionStatus.posted.value) &
          t.relatedEntityId.equals(courseId.toString()),
      transaction: transaction,
    );
    return existing != null;
  }
}
