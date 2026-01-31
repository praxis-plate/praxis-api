import 'package:praxis_server/src/datasources/coin_transactions_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/coin_transaction_status.dart';
import 'package:praxis_server/src/shared/constants/coin_transaction_type.dart';
import 'package:serverpod/serverpod.dart';

class WalletValidator {
  /// Validates wallet invariants
  static void validateWalletInvariants({
    required int balance,
    required int available,
    required int held,
  }) {
    if (available < 0) {
      throw ValidationException(
        message: 'Available balance cannot be negative',
        field: 'available',
      );
    }
    if (held < 0) {
      throw ValidationException(
        message: 'Held balance cannot be negative',
        field: 'held',
      );
    }
    if (balance != available + held) {
      throw ValidationException(
        message: 'Wallet balance invariant violated',
        field: 'balance',
      );
    }
  }

  /// Checks available balance sufficiency
  static void ensureAvailable(int available, int amount) {
    if (available - amount < 0) {
      throw ValidationException(
        message: 'Insufficient available balance',
        field: 'available',
      );
    }
  }

  /// Checks held balance sufficiency
  static void ensureHeld(int held, int amount) {
    if (held - amount < 0) {
      throw ValidationException(
        message: 'Insufficient held balance',
        field: 'held',
      );
    }
  }

  /// Validates transaction idempotency
  static void validateTransactionIdempotency({
    required CoinTransaction existing,
    required CoinTransactionType expectedType,
    required String expectedCurrency,
    required int expectedAmount,
    required String? expectedRelatedEntityId,
    required int? expectedReversalOfTransactionId,
  }) {
    final existingType = CoinTransactionType.values.byName(existing.type);
    if (existingType != expectedType) {
      throw ValidationException(
        message: 'Transaction key already used with different type',
        field: 'transactionKey',
      );
    }

    if (existing.currency != expectedCurrency) {
      throw ValidationException(
        message: 'Transaction key already used with different currency',
        field: 'transactionKey',
      );
    }

    if (existing.relatedEntityId != expectedRelatedEntityId) {
      throw ValidationException(
        message: 'Transaction key already used with different relatedEntityId',
        field: 'transactionKey',
      );
    }

    if (existing.reversalOfTransactionId != expectedReversalOfTransactionId) {
      throw ValidationException(
        message:
            'Transaction key already used with different reversalOfTransactionId',
        field: 'transactionKey',
      );
    }

    // Check amount considering different transaction type specifics
    if (existing.amount != expectedAmount) {
      // For adjustment, amount may differ from amountForLedger,
      // so skip validation for this type
      if (expectedType != CoinTransactionType.adjustment) {
        throw ValidationException(
          message: 'Transaction key already used with different amount',
          field: 'transactionKey',
        );
      }
    }
  }

  /// Validates currency match
  static void validateCurrency(UserWallet wallet, String currency) {
    if (wallet.currency != currency) {
      throw ValidationException(
        message: 'Currency mismatch',
        field: 'currency',
      );
    }
  }

  /// Validates amount for transaction type
  static void validateAmount(CoinTransactionType type, int amount) {
    if (type != CoinTransactionType.adjustment && amount <= 0) {
      throw ValidationException(
        message: 'Amount is required and must be positive',
        field: 'amount',
      );
    }
  }

  /// Validates reversal target transaction
  static void validateReversalTarget(
    CoinTransaction? reversalTarget,
    UserWallet wallet,
    int amount,
  ) {
    if (reversalTarget == null) {
      throw ValidationException(
        message: 'Reversal target is required',
        field: 'reversalOfTransactionId',
      );
    }
    if (reversalTarget.authUserId != wallet.authUserId) {
      throw ValidationException(
        message: 'Reversal target does not match wallet',
        field: 'reversalOfTransactionId',
      );
    }
    if (reversalTarget.currency != wallet.currency) {
      throw ValidationException(
        message: 'Reversal currency mismatch',
        field: 'currency',
      );
    }
    if (reversalTarget.status != CoinTransactionStatus.posted.value) {
      throw ValidationException(
        message: 'Reversal target must be posted',
        field: 'reversalOfTransactionId',
      );
    }
    if (amount != reversalTarget.amount.abs()) {
      throw ValidationException(
        message: 'Reversal amount must match original transaction',
        field: 'amount',
      );
    }
  }

  /// Validates refund operation
  static Future<void> validateRefund(
    Session session,
    CoinTransactionsDataSource coinTransactionsDataSource, {
    required Transaction transaction,
    required UserWallet wallet,
    required int amount,
    required CoinTransaction? reversalTarget,
  }) async {
    if (reversalTarget == null) {
      throw ValidationException(
        message: 'Refund requires reversal target',
        field: 'reversalOfTransactionId',
      );
    }

    if (reversalTarget.authUserId != wallet.authUserId) {
      throw ValidationException(
        message: 'Refund target does not match wallet',
        field: 'reversalOfTransactionId',
      );
    }

    if (reversalTarget.currency != wallet.currency) {
      throw ValidationException(
        message: 'Refund currency mismatch',
        field: 'currency',
      );
    }

    final targetType = CoinTransactionType.values.byName(reversalTarget.type);
    if (targetType != CoinTransactionType.buy &&
        targetType != CoinTransactionType.capture) {
      throw ValidationException(
        message: 'Refund allowed only for buy or capture',
        field: 'reversalOfTransactionId',
      );
    }

    final previousRefunds = await coinTransactionsDataSource
        .listByReversalIdAndType(
          session,
          reversalOfTransactionId: reversalTarget.id!,
          type: CoinTransactionType.refund.value,
          transaction: transaction,
        );
    final refundedTotal = previousRefunds.fold<int>(
      0,
      (total, refund) => total + refund.amount,
    );

    if (refundedTotal + amount > reversalTarget.amount) {
      throw ValidationException(
        message: 'Refund exceeds original transaction amount',
        field: 'amount',
      );
    }
  }

  /// Validates reversal target type and returns null if invalid
  static CoinTransactionType? validateReversalTargetType(
    CoinTransaction? target,
  ) {
    if (target == null) {
      throw ValidationException(
        message: 'Reversal target is required',
        field: 'reversalOfTransactionId',
      );
    }

    final targetType = CoinTransactionType.values.byName(target.type);

    if (targetType == CoinTransactionType.reversal) {
      throw ValidationException(
        message: 'Reversal of reversal is not allowed',
        field: 'reversalOfTransactionId',
      );
    }

    return targetType;
  }
}
