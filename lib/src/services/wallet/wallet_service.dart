import 'package:serverpod/serverpod.dart';

import 'package:praxis_server/src/datasources/coin_transactions_data_source.dart';
import 'package:praxis_server/src/datasources/wallet_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/coin_transaction_constants.dart';
import 'package:praxis_server/src/shared/mappers/coin_transaction_mapper.dart';
import 'package:praxis_server/src/validation/create_coin_transaction_request_validation.dart';

import 'package:praxis_server/src/services/wallet/entities/entities.dart';

class WalletService {
  final _coinTransactionsDataSource = CoinTransactionsDataSource();
  final _walletDataSource = WalletDataSource();

  WalletService();

  Future<void> initializeBalance(Session session) async {
    final authInfo = _requireAuth(session);
    final authUserId = _parseAuthUserId(authInfo.userIdentifier);

    await _ensureWallet(
      session,
      authUserId: authUserId,
      currency: defaultCoinCurrency,
    );
  }

  Future<CoinTransactionDto> topUp(
    Session session,
    CreateCoinTransactionRequest request,
  ) async {
    final authInfo = _requireAuth(session);
    request.validateForTopUp();
    final authUserId = _parseAuthUserId(authInfo.userIdentifier);

    return _applyLedgerEntry(
      session,
      authUserId: authUserId,
      type: CoinTransactionTypes.topUp,
      amount: request.normalizedAmount,
      currency: request.normalizedCurrency,
      transactionKey: request.normalizedTransactionKey,
      relatedEntityId: request.relatedEntityId,
      reversalOfTransactionId: request.reversalOfTransactionId,
      reason: request.reason,
      metadata: request.metadata,
    );
  }

  Future<CoinTransactionDto> buy(
    Session session,
    CreateCoinTransactionRequest request,
  ) async {
    final authInfo = _requireAuth(session);
    request.validateForBuy();
    final authUserId = _parseAuthUserId(authInfo.userIdentifier);

    return _applyLedgerEntry(
      session,
      authUserId: authUserId,
      type: CoinTransactionTypes.buy,
      amount: request.normalizedAmount,
      currency: request.normalizedCurrency,
      transactionKey: request.normalizedTransactionKey,
      relatedEntityId: request.relatedEntityId,
      reversalOfTransactionId: request.reversalOfTransactionId,
      reason: request.reason,
      metadata: request.metadata,
    );
  }

  Future<List<CoinTransactionDto>> getHistory(
    Session session,
  ) async {
    final authInfo = _requireAuth(session);
    final authUserId = _parseAuthUserId(authInfo.userIdentifier);

    final transactions = await _coinTransactionsDataSource.listByAuthUserId(
      session,
      authUserId,
    );
    return transactions
        .map((transaction) => transaction.toCoinTransactionDto())
        .toList();
  }

  AuthenticationInfo _requireAuth(Session session) {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw NotAuthorizedException(
        reason: AuthenticationFailureReason.unauthenticated,
        message: 'User is not authorized',
      );
    }
    return authInfo;
  }

  UuidValue _parseAuthUserId(String userIdentifier) {
    try {
      return UuidValue.fromString(userIdentifier);
    } catch (_) {
      throw ValidationException(
        message: 'Invalid auth user id',
        field: 'authUserId',
      );
    }
  }

  Future<CoinTransactionDto> _applyLedgerEntry(
    Session session, {
    required UuidValue authUserId,
    required String type,
    required int amount,
    required String currency,
    required String transactionKey,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
  }) {
    return _walletDataSource.runInTransaction(session, (transaction) async {
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
        return existing.toCoinTransactionDto();
      }

      final now = DateTime.now();
      final wallet = await _ensureWallet(
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

      final normalizedType = normalizeCoinTransactionType(type);
      if (!CoinTransactionTypes.values.contains(normalizedType)) {
        throw ValidationException(
          message: 'Unsupported transaction type',
          field: 'type',
        );
      }

      final walletUpdate = await _calculateWalletUpdate(
        session,
        transaction: transaction,
        wallet: wallet,
        type: normalizedType,
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
        type: normalizedType,
        status: CoinTransactionStatuses.posted,
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
    });
  }

  Future<UserWallet> _ensureWallet(
    Session session, {
    required UuidValue authUserId,
    required String currency,
    Transaction? transaction,
  }) async {
    final existing = await _walletDataSource.findByAuthUserId(
      session,
      authUserId,
      transaction: transaction,
    );
    if (existing != null) {
      return existing;
    }

    return _walletDataSource.insert(
      session,
      authUserId: authUserId,
      currency: currency,
      createdAt: DateTime.now(),
      transaction: transaction,
    );
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

  Future<WalletUpdate> _calculateWalletUpdate(
    Session session, {
    required Transaction transaction,
    required UserWallet wallet,
    required String type,
    required int amount,
    required String currency,
    required CoinTransaction? reversalTarget,
  }) async {
    if (wallet.currency != currency) {
      throw ValidationException(
        message: 'Currency mismatch',
        field: 'currency',
      );
    }

    var ledgerAmount = amount;
    if (type != CoinTransactionTypes.adjustment && amount <= 0) {
      throw ValidationException(
        message: 'Amount is required and must be positive',
        field: 'amount',
      );
    }

    if (type == CoinTransactionTypes.reversal) {
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
      if (reversalTarget.status != CoinTransactionStatuses.posted) {
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
      ledgerAmount = reversalTarget.amount.abs();
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

    _validateWalletInvariants(
      balance: balance,
      available: available,
      held: held,
    );

    if (type == CoinTransactionTypes.adjustment) {
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
    required String type,
    required int amount,
    required CoinTransaction? reversalTarget,
  }) async {
    switch (type) {
      case CoinTransactionTypes.topUp:
        return const WalletDelta(
          balanceDelta: 0,
          availableDelta: 0,
          heldDelta: 0,
        ).add(balance: amount, available: amount);
      case CoinTransactionTypes.buy:
        _ensureAvailable(wallet.available, amount);
        return const WalletDelta(
          balanceDelta: 0,
          availableDelta: 0,
          heldDelta: 0,
        ).add(balance: -amount, available: -amount);
      case CoinTransactionTypes.hold:
        _ensureAvailable(wallet.available, amount);
        return const WalletDelta(
          balanceDelta: 0,
          availableDelta: 0,
          heldDelta: 0,
        ).add(available: -amount, held: amount);
      case CoinTransactionTypes.capture:
        _ensureHeld(wallet.held, amount);
        return const WalletDelta(
          balanceDelta: 0,
          availableDelta: 0,
          heldDelta: 0,
        ).add(balance: -amount, held: -amount);
      case CoinTransactionTypes.release:
        _ensureHeld(wallet.held, amount);
        return const WalletDelta(
          balanceDelta: 0,
          availableDelta: 0,
          heldDelta: 0,
        ).add(available: amount, held: -amount);
      case CoinTransactionTypes.refund:
        await _validateRefund(
          session,
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
      case CoinTransactionTypes.reversal:
        final targetDelta = _deltaFromTarget(reversalTarget);
        return WalletDelta(
          balanceDelta: -targetDelta.balanceDelta,
          availableDelta: -targetDelta.availableDelta,
          heldDelta: -targetDelta.heldDelta,
        );
      case CoinTransactionTypes.adjustment:
        return WalletDelta(
          balanceDelta: amount,
          availableDelta: amount,
          heldDelta: 0,
        );
    }

    throw ValidationException(
      message: 'Unsupported transaction type',
      field: 'type',
    );
  }

  WalletDelta _deltaFromTarget(CoinTransaction? target) {
    if (target == null) {
      throw ValidationException(
        message: 'Reversal target is required',
        field: 'reversalOfTransactionId',
      );
    }

    switch (target.type) {
      case CoinTransactionTypes.topUp:
        return WalletDelta(
          balanceDelta: target.amount,
          availableDelta: target.amount,
          heldDelta: 0,
        );
      case CoinTransactionTypes.buy:
        return WalletDelta(
          balanceDelta: -target.amount,
          availableDelta: -target.amount,
          heldDelta: 0,
        );
      case CoinTransactionTypes.hold:
        return WalletDelta(
          balanceDelta: 0,
          availableDelta: -target.amount,
          heldDelta: target.amount,
        );
      case CoinTransactionTypes.capture:
        return WalletDelta(
          balanceDelta: -target.amount,
          availableDelta: 0,
          heldDelta: -target.amount,
        );
      case CoinTransactionTypes.release:
        return WalletDelta(
          balanceDelta: 0,
          availableDelta: target.amount,
          heldDelta: -target.amount,
        );
      case CoinTransactionTypes.refund:
        return WalletDelta(
          balanceDelta: target.amount,
          availableDelta: target.amount,
          heldDelta: 0,
        );
      case CoinTransactionTypes.adjustment:
        return WalletDelta(
          balanceDelta: target.amount,
          availableDelta: target.amount,
          heldDelta: 0,
        );
      case CoinTransactionTypes.reversal:
        throw ValidationException(
          message: 'Reversal of reversal is not allowed',
          field: 'reversalOfTransactionId',
        );
    }

    throw ValidationException(
      message: 'Unsupported reversal target type',
      field: 'reversalOfTransactionId',
    );
  }

  Future<void> _validateRefund(
    Session session, {
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

    if (reversalTarget.type != CoinTransactionTypes.buy &&
        reversalTarget.type != CoinTransactionTypes.capture) {
      throw ValidationException(
        message: 'Refund allowed only for buy or capture',
        field: 'reversalOfTransactionId',
      );
    }

    final previousRefunds = await _coinTransactionsDataSource
        .listByReversalIdAndType(
          session,
          reversalOfTransactionId: reversalTarget.id!,
          type: CoinTransactionTypes.refund,
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

  void _ensureAvailable(int available, int amount) {
    if (available - amount < 0) {
      throw ValidationException(
        message: 'Insufficient available balance',
        field: 'amount',
      );
    }
  }

  void _ensureHeld(int held, int amount) {
    if (held - amount < 0) {
      throw ValidationException(
        message: 'Insufficient held balance',
        field: 'amount',
      );
    }
  }

  void _validateWalletInvariants({
    required int balance,
    required int available,
    required int held,
  }) {
    if (available < 0) {
      throw ValidationException(
        message: 'Available balance cannot be negative',
        field: 'amount',
      );
    }
    if (held < 0) {
      throw ValidationException(
        message: 'Held balance cannot be negative',
        field: 'amount',
      );
    }
    if (balance != available + held) {
      throw ValidationException(
        message: 'Wallet balance invariant violated',
        field: 'amount',
      );
    }
  }
}
