import 'package:praxis_server/src/datasources/coin_transactions_data_source.dart';
import 'package:praxis_server/src/datasources/wallet_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/wallet/wallet_calculator.dart';
import 'package:praxis_server/src/services/wallet/wallet_manager.dart';
import 'package:praxis_server/src/services/wallet/wallet_transaction_processor.dart';
import 'package:praxis_server/src/shared/constants/wallet_constants.dart';
import 'package:praxis_server/src/shared/mappers/coin_transaction_mapper.dart';
import 'package:praxis_server/src/shared/mappers/wallet_balance_mapper.dart';
import 'package:praxis_server/src/shared/utils/transaction_runner.dart';
import 'package:praxis_server/src/validation/wallet_transaction_request_validation.dart';
import 'package:serverpod/serverpod.dart';

/// Main wallet service - coordinates components
class WalletService {
  late final WalletTransactionProcessor _transactionProcessor;
  late final WalletManager _walletManager;
  late final CoinTransactionsDataSource _coinTransactionsDataSource;
  late final TransactionRunner _transactionRunner;

  WalletService({
    required CoinTransactionsDataSource coinTransactionsDataSource,
    required WalletDataSource walletDataSource,
    required TransactionRunner transactionRunner,
  }) {
    _coinTransactionsDataSource = coinTransactionsDataSource;
    _walletManager = WalletManager(walletDataSource: walletDataSource);
    _transactionRunner = transactionRunner;
    _transactionProcessor = WalletTransactionProcessor(
      coinTransactionsDataSource: coinTransactionsDataSource,
      walletDataSource: walletDataSource,
      walletManager: _walletManager,
      walletCalculator: WalletCalculator(
        coinTransactionsDataSource: coinTransactionsDataSource,
      ),
      transactionRunner: _transactionRunner,
    );
  }

  Future<void> initializeBalance(
    Session session, {
    required UuidValue authUserId,
  }) async {
    await _walletManager.ensureWallet(
      session,
      authUserId: authUserId,
      currency: WalletConstants.defaultCurrency,
    );
  }

  Future<WalletBalanceDto> getBalance(
    Session session, {
    required UuidValue authUserId,
  }) async {
    final wallet = await _walletManager.ensureWallet(
      session,
      authUserId: authUserId,
      currency: WalletConstants.defaultCurrency,
    );

    return wallet.toWalletBalanceDto();
  }

  Future<CoinTransactionDto> topUp(
    Session session,
    CreateCoinTransactionRequest request, {
    required UuidValue authUserId,
  }) async {
    request.validateForTopUp();

    return _transactionProcessor.processTransaction(
      session,
      authUserId: authUserId,
      type: CoinTransactionType.topUp,
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
    CreateCoinTransactionRequest request, {
    required UuidValue authUserId,
  }) async {
    request.validateForBuy();

    return _transactionProcessor.processTransaction(
      session,
      authUserId: authUserId,
      type: CoinTransactionType.buy,
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
    Session session, {
    required UuidValue authUserId,
    int? limit,
    int? offset,
  }) async {
    final transactions = await _coinTransactionsDataSource.listByAuthUserId(
      session,
      authUserId,
      limit: limit,
      offset: offset,
    );
    return transactions
        .map((transaction) => transaction.toCoinTransactionDto())
        .toList();
  }

  Future<CoinTransactionDto> grantReward(
    Session session, {
    required UuidValue authUserId,
    required int amount,
    required String reason,
    String? relatedEntityId,
    Transaction? transaction,
  }) {
    final transactionKey = 'reward:$reason:$relatedEntityId:$authUserId';

    return _transactionProcessor.processTransaction(
      session,
      authUserId: authUserId,
      type: CoinTransactionType.adjustment,
      amount: amount,
      currency: WalletConstants.defaultCurrency,
      transactionKey: transactionKey,
      relatedEntityId: relatedEntityId,
      reason: reason,
      transaction: transaction,
    );
  }
}
