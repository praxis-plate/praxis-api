import 'package:praxis_server/src/datasources/coin_transactions_data_source.dart';
import 'package:praxis_server/src/datasources/wallet_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/wallet/wallet_calculator.dart';
import 'package:praxis_server/src/services/wallet/wallet_manager.dart';
import 'package:praxis_server/src/services/wallet/wallet_transaction_processor.dart';
import 'package:praxis_server/src/shared/constants/coin_transaction_type.dart';
import 'package:praxis_server/src/shared/constants/wallet_constants.dart';
import 'package:praxis_server/src/shared/mappers/coin_transaction_mapper.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:praxis_server/src/validation/wallet_transaction_request_validation.dart';
import 'package:serverpod/serverpod.dart';

/// Main wallet service - coordinates components
class WalletService {
  final WalletTransactionProcessor _transactionProcessor;
  final WalletManager _walletManager;
  final CoinTransactionsDataSource _coinTransactionsDataSource;

  WalletService({
    required CoinTransactionsDataSource coinTransactionsDataSource,
    required WalletDataSource walletDataSource,
  }) : _coinTransactionsDataSource = coinTransactionsDataSource,
       _walletManager = WalletManager(walletDataSource: walletDataSource),
       _transactionProcessor = WalletTransactionProcessor(
         coinTransactionsDataSource: coinTransactionsDataSource,
         walletDataSource: walletDataSource,
         walletManager: WalletManager(walletDataSource: walletDataSource),
         walletCalculator: WalletCalculator(
           coinTransactionsDataSource: coinTransactionsDataSource,
         ),
       );

  Future<void> initializeBalance(Session session) async {
    final authUserId = AuthUtils.getAuthUserId(session);

    await _walletManager.ensureWallet(
      session,
      authUserId: authUserId,
      currency: WalletConstants.defaultCurrency,
    );
  }

  Future<UserWallet> getBalance(Session session) async {
    final authUserId = AuthUtils.getAuthUserId(session);

    final wallet = await _walletManager.ensureWallet(
      session,
      authUserId: authUserId,
      currency: WalletConstants.defaultCurrency,
    );

    return wallet;
  }

  Future<CoinTransactionDto> topUp(
    Session session,
    CreateCoinTransactionRequest request,
  ) async {
    final authUserId = AuthUtils.getAuthUserId(session);
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
    CreateCoinTransactionRequest request,
  ) async {
    final authUserId = AuthUtils.getAuthUserId(session);
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
    int? limit,
    int? offset,
  }) async {
    final authUserId = AuthUtils.getAuthUserId(session);

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
    required int amount,
    required String reason,
    String? relatedEntityId,
  }) {
    final authUserId = AuthUtils.getAuthUserId(session);
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
    );
  }
}
