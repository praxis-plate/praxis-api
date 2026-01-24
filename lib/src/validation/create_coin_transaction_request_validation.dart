import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/coin_transaction_constants.dart';

extension CreateCoinTransactionRequestValidation
    on CreateCoinTransactionRequest {
  void validateForBuy() {
    _validateBase();
    if (normalizedType != CoinTransactionTypes.buy) {
      throw ValidationException(
        message: 'Type must be "${CoinTransactionTypes.buy}"',
        field: 'type',
      );
    }
  }

  void validateForTopUp() {
    _validateBase();
    if (normalizedType != CoinTransactionTypes.topUp) {
      throw ValidationException(
        message: 'Type must be "${CoinTransactionTypes.topUp}"',
        field: 'type',
      );
    }
  }

  void _validateBase() {
    if (normalizedAmount <= 0) {
      throw ValidationException(
        message: 'Amount is required and must be positive',
        field: 'amount',
      );
    }
    if (normalizedTransactionKey.isEmpty) {
      throw ValidationException(
        message: 'Transaction key is required',
        field: 'transactionKey',
      );
    }
  }

  int get normalizedAmount => amount.abs();

  String get normalizedCurrency =>
      (currency ?? defaultCoinCurrency).trim().toUpperCase();

  String get normalizedTransactionKey => transactionKey.trim();

  String get normalizedType => normalizeCoinTransactionType(type);
}
