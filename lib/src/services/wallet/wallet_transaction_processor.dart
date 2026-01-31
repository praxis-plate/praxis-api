import 'package:praxis_server/src/datasources/coin_transactions_data_source.dart';
import 'package:praxis_server/src/datasources/wallet_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/wallet/wallet_calculator.dart';
import 'package:praxis_server/src/services/wallet/wallet_manager.dart';
import 'package:praxis_server/src/services/wallet/wallet_validator.dart';
import 'package:praxis_server/src/shared/constants/coin_transaction_status.dart';
import 'package:praxis_server/src/shared/mappers/coin_transaction_mapper.dart';
import 'package:praxis_server/src/shared/utils/transaction_runner.dart';
import 'package:serverpod/serverpod.dart';

/// Handles wallet transaction processing
class WalletTransactionProcessor {
  final CoinTransactionsDataSource _coinTransactionsDataSource;
  final WalletDataSource _walletDataSource;
  final WalletManager _walletManager;
  final WalletCalculator _walletCalculator;
  final TransactionRunner _transactionRunner;

  WalletTransactionProcessor({
    required CoinTransactionsDataSource coinTransactionsDataSource,
    required WalletDataSource walletDataSource,
    required WalletManager walletManager,
    required WalletCalculator walletCalculator,
    required TransactionRunner transactionRunner,
  }) : _coinTransactionsDataSource = coinTransactionsDataSource,
       _walletDataSource = walletDataSource,
       _walletManager = walletManager,
       _walletCalculator = walletCalculator,
       _transactionRunner = transactionRunner;

  Future<CoinTransactionDto> processTransaction(
    Session session, {
    required UuidValue authUserId,
    required CoinTransactionType type,
    required int amount,
    required String currency,
    required String transactionKey,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
    Transaction? transaction,
  }) {
    return _transactionRunner.run(
      session,
      (transaction) => _processTransaction(
        session,
        transaction: transaction,
        authUserId: authUserId,
        type: type,
        amount: amount,
        currency: currency,
        transactionKey: transactionKey,
        relatedEntityId: relatedEntityId,
        reversalOfTransactionId: reversalOfTransactionId,
        reason: reason,
        metadata: metadata,
      ),
      transaction: transaction,
    );
  }

  Future<CoinTransactionDto> _processTransaction(
    Session session, {
    required Transaction transaction,
    required UuidValue authUserId,
    required CoinTransactionType type,
    required int amount,
    required String currency,
    required String transactionKey,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
  }) async {
    final existing = await _coinTransactionsDataSource.findByTransactionKey(
      session,
      transactionKey,
      transaction: transaction,
    );
    if (existing != null) {
      if (existing.authUserId != authUserId) {
        throw ValidationException(
          message: 'Transaction key already used',
          field: 'transactionKey',
        );
      }

      // Check idempotency - all key parameters must match
      WalletValidator.validateTransactionIdempotency(
        existing: existing,
        expectedType: type,
        expectedCurrency: currency,
        expectedAmount: amount,
        expectedRelatedEntityId: relatedEntityId,
        expectedReversalOfTransactionId: reversalOfTransactionId,
      );

      return existing.toCoinTransactionDto();
    }

    final now = DateTime.now();
    final wallet = await _walletManager.ensureWallet(
      session,
      authUserId: authUserId,
      currency: currency,
      transaction: transaction,
    );

    final reversalTarget = await _loadReversalTarget(
      session,
      transaction: transaction,
      reversalOfTransactionId: reversalOfTransactionId,
    );

    final walletUpdate = await _walletCalculator.calculateWalletUpdate(
      session,
      transaction: transaction,
      wallet: wallet,
      type: type,
      amount: amount,
      currency: currency,
      reversalTarget: reversalTarget,
    );

    final updatedWallet = await _walletDataSource.updateWithVersion(
      session,
      authUserId: wallet.authUserId,
      expectedVersion: wallet.version,
      balance: walletUpdate.balance,
      available: walletUpdate.available,
      held: walletUpdate.held,
      currency: currency,
      updatedAt: now,
      transaction: transaction,
    );

    if (updatedWallet == null) {
      final existingAfterConflict = await _coinTransactionsDataSource
          .findByTransactionKey(
            session,
            transactionKey,
            transaction: transaction,
          );
      if (existingAfterConflict != null) {
        return existingAfterConflict.toCoinTransactionDto();
      }
      throw ValidationException(
        message: 'Wallet update conflict',
        field: 'wallet',
      );
    }

    final ledgerEntry = await _coinTransactionsDataSource.create(
      session,
      authUserId: authUserId,
      transactionKey: transactionKey,
      type: type,
      status: CoinTransactionStatus.posted.value,
      amount: walletUpdate.amountForLedger,
      currency: currency,
      relatedEntityId: relatedEntityId,
      reversalOfTransactionId: reversalOfTransactionId,
      reason: reason,
      metadata: metadata,
      createdAt: now,
      transaction: transaction,
    );

    return ledgerEntry.toCoinTransactionDto();
  }

  Future<CoinTransaction?> _loadReversalTarget(
    Session session, {
    required Transaction transaction,
    required int? reversalOfTransactionId,
  }) {
    if (reversalOfTransactionId == null) {
      return Future.value(null);
    }
    return _coinTransactionsDataSource.findById(
      session,
      reversalOfTransactionId,
      transaction: transaction,
    );
  }
}
