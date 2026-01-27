import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/coin_transaction_type.dart';
import 'package:praxis_server/src/shared/constants/wallet_constants.dart';

extension WalletTransactionRequestValidation on CreateCoinTransactionRequest {
  void validateForBuy() {
    _validateBase();
    if (normalizedType != CoinTransactionType.buy) {
      throw ValidationException(
        message: 'Type must be "${CoinTransactionType.buy.value}"',
        field: 'type',
      );
    }
  }

  void validateForTopUp() {
    _validateBase();
    if (normalizedType != CoinTransactionType.topUp) {
      throw ValidationException(
        message: 'Type must be "${CoinTransactionType.topUp.value}"',
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
      (currency ?? WalletConstants.defaultCurrency).trim().toUpperCase();

  String get normalizedTransactionKey => transactionKey.trim();

  CoinTransactionType? get normalizedType =>
      CoinTransactionType.fromString(type);
}
