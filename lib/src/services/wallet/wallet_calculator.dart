import 'package:praxis_server/src/datasources/coin_transactions_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/wallet/entities/entities.dart';
import 'package:praxis_server/src/services/wallet/wallet_validator.dart';
import 'package:praxis_server/src/shared/constants/coin_transaction_type.dart';
import 'package:serverpod/serverpod.dart';

/// Handles wallet balance calculations
class WalletCalculator {
  final CoinTransactionsDataSource _coinTransactionsDataSource;

  WalletCalculator({
    required CoinTransactionsDataSource coinTransactionsDataSource,
  }) : _coinTransactionsDataSource = coinTransactionsDataSource;

  Future<WalletUpdate> calculateWalletUpdate(
    Session session, {
    required Transaction transaction,
    required UserWallet wallet,
    required CoinTransactionType type,
    required int amount,
    required String currency,
    required CoinTransaction? reversalTarget,
  }) async {
    WalletValidator.validateCurrency(wallet, currency);
    WalletValidator.validateAmount(type, amount);

    var ledgerAmount = amount;

    if (type == CoinTransactionType.reversal) {
      WalletValidator.validateReversalTarget(reversalTarget, wallet, amount);
      ledgerAmount = reversalTarget!.amount.abs();
    }

    final delta = await _deltaForType(
      session,
      transaction: transaction,
      wallet: wallet,
      type: type,
      amount: amount,
      reversalTarget: reversalTarget,
    );

    final balance = wallet.balance + delta.balanceDelta;
    final available = wallet.available + delta.availableDelta;
    final held = wallet.held + delta.heldDelta;

    WalletValidator.validateWalletInvariants(
      balance: balance,
      available: available,
      held: held,
    );

    if (type == CoinTransactionType.adjustment) {
      ledgerAmount = delta.balanceDelta;
    }

    return WalletUpdate(
      balance: balance,
      available: available,
      held: held,
      amountForLedger: ledgerAmount,
    );
  }

  Future<WalletDelta> _deltaForType(
    Session session, {
    required Transaction transaction,
    required UserWallet wallet,
    required CoinTransactionType type,
    required int amount,
    required CoinTransaction? reversalTarget,
  }) async {
    switch (type) {
      case CoinTransactionType.topUp:
        return const WalletDelta(
          balanceDelta: 0,
          availableDelta: 0,
          heldDelta: 0,
        ).add(balance: amount, available: amount);
      case CoinTransactionType.buy:
        WalletValidator.ensureAvailable(wallet.available, amount);
        return const WalletDelta(
          balanceDelta: 0,
          availableDelta: 0,
          heldDelta: 0,
        ).add(balance: -amount, available: -amount);
      case CoinTransactionType.hold:
        WalletValidator.ensureAvailable(wallet.available, amount);
        return const WalletDelta(
          balanceDelta: 0,
          availableDelta: 0,
          heldDelta: 0,
        ).add(available: -amount, held: amount);
      case CoinTransactionType.capture:
        WalletValidator.ensureHeld(wallet.held, amount);
        return const WalletDelta(
          balanceDelta: 0,
          availableDelta: 0,
          heldDelta: 0,
        ).add(balance: -amount, held: -amount);
      case CoinTransactionType.release:
        WalletValidator.ensureHeld(wallet.held, amount);
        return const WalletDelta(
          balanceDelta: 0,
          availableDelta: 0,
          heldDelta: 0,
        ).add(available: amount, held: -amount);
      case CoinTransactionType.refund:
        await WalletValidator.validateRefund(
          session,
          _coinTransactionsDataSource,
          transaction: transaction,
          wallet: wallet,
          amount: amount,
          reversalTarget: reversalTarget,
        );
        return const WalletDelta(
          balanceDelta: 0,
          availableDelta: 0,
          heldDelta: 0,
        ).add(balance: amount, available: amount);
      case CoinTransactionType.reversal:
        final targetDelta = _deltaFromTarget(reversalTarget);
        return WalletDelta(
          balanceDelta: -targetDelta.balanceDelta,
          availableDelta: -targetDelta.availableDelta,
          heldDelta: -targetDelta.heldDelta,
        );
      case CoinTransactionType.adjustment:
        return WalletDelta(
          balanceDelta: amount,
          availableDelta: amount,
          heldDelta: 0,
        );
    }
  }

  WalletDelta _deltaFromTarget(CoinTransaction? target) {
    final targetType = WalletValidator.validateReversalTargetType(target);

    switch (targetType) {
      case CoinTransactionType.topUp:
        return WalletDelta(
          balanceDelta: target!.amount,
          availableDelta: target.amount,
          heldDelta: 0,
        );
      case CoinTransactionType.buy:
        return WalletDelta(
          balanceDelta: -target!.amount,
          availableDelta: -target.amount,
          heldDelta: 0,
        );
      case CoinTransactionType.hold:
        return WalletDelta(
          balanceDelta: 0,
          availableDelta: -target!.amount,
          heldDelta: target.amount,
        );
      case CoinTransactionType.capture:
        return WalletDelta(
          balanceDelta: -target!.amount,
          availableDelta: 0,
          heldDelta: -target.amount,
        );
      case CoinTransactionType.release:
        return WalletDelta(
          balanceDelta: 0,
          availableDelta: target!.amount,
          heldDelta: -target.amount,
        );
      case CoinTransactionType.refund:
        return WalletDelta(
          balanceDelta: target!.amount,
          availableDelta: target.amount,
          heldDelta: 0,
        );
      case CoinTransactionType.adjustment:
        return WalletDelta(
          balanceDelta: target!.amount,
          availableDelta: target.amount,
          heldDelta: 0,
        );
      case CoinTransactionType.reversal:
      case null:
        // These cases are handled by WalletValidator.validateReversalTargetType
        throw ValidationException(
          message: 'Invalid reversal target',
          field: 'reversalOfTransactionId',
        );
    }
  }
}
