import 'package:praxis_server/src/generated/protocol.dart';

extension CoinTransactionToDtoMapper on CoinTransaction {
  CoinTransactionDto toCoinTransactionDto() {
    assert(id != null, 'Transaction id is not set');
    return CoinTransactionDto(
      id: id!,
      type: type,
      status: status,
      authUserId: authUserId.toString(),
      transactionKey: transactionKey,
      amount: amount,
      currency: currency,
      relatedEntityId: relatedEntityId,
      reversalOfTransactionId: reversalOfTransactionId,
      reason: reason,
      metadata: metadata,
      createdAt: createdAt,
    );
  }
}
