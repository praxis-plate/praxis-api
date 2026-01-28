import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

/// Wallet endpoint for managing user coin balances and transactions
class WalletEndpoint extends Endpoint {
  /// Gets the current wallet balance for authenticated user
  ///
  /// Returns wallet information including:
  /// - balance: Total coins owned
  /// - available: Coins available for spending
  /// - held: Coins temporarily held
  /// - currency: Always 'COIN'
  ///
  /// Throws [NotAuthorizedException] if user is not authenticated
  Future<WalletBalanceDto> getBalance(Session session) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.getWalletBalanceUseCase.execute(
      session,
      authUserId: authUserId,
    );
  }

  /// Adds coins to user wallet (INTERNAL USE ONLY)
  ///
  /// WARNING: This method immediately adds coins without payment verification.
  /// Suitable only for:
  /// - Admin operations (manual coin grants)
  /// - Testing and development
  /// - Internal system transfers
  ///
  /// For real user payments, implement external payment provider integration.
  ///
  /// Parameters:
  /// - [request]: Transaction details including amount, currency, and transaction key
  ///
  /// Returns the created transaction record
  ///
  /// Throws:
  /// - [NotAuthorizedException] if user is not authenticated
  /// - [ValidationException] if request validation fails
  /// - [ValidationException] if transaction key already exists with different parameters
  Future<CoinTransactionDto> topUp(
    Session session,
    CreateCoinTransactionRequest request,
  ) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.topUpWalletUseCase.execute(
      session,
      request,
      authUserId: authUserId,
    );
  }

  /// Purchases courses or items using available coins
  ///
  /// Deducts coins from user's available balance to purchase courses or other items.
  /// Ensures sufficient balance before processing the transaction.
  ///
  /// Parameters:
  /// - [request]: Transaction details including amount, currency, transaction key, and optional relatedEntityId
  ///
  /// Returns the created transaction record
  ///
  /// Throws:
  /// - [NotAuthorizedException] if user is not authenticated
  /// - [ValidationException] if insufficient available balance
  /// - [ValidationException] if request validation fails
  /// - [ValidationException] if transaction key already exists with different parameters
  Future<CoinTransactionDto> buy(
    Session session,
    CreateCoinTransactionRequest request,
  ) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.buyWithWalletUseCase.execute(
      session,
      request,
      authUserId: authUserId,
    );
  }

  /// Gets transaction history for authenticated user with pagination
  ///
  /// Returns list of transactions ordered by creation date (newest first).
  /// Supports pagination through limit and offset parameters.
  ///
  /// Parameters:
  /// - [limit]: Maximum number of transactions to return (optional)
  /// - [offset]: Number of transactions to skip for pagination (optional)
  ///
  /// Returns list of transaction DTOs containing:
  /// - Transaction details (amount, type, status)
  /// - Timestamps and metadata
  /// - Related entity information if applicable
  ///
  /// Throws [NotAuthorizedException] if user is not authenticated
  Future<List<CoinTransactionDto>> getHistory(
    Session session, {
    int? limit,
    int? offset,
  }) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.getWalletHistoryUseCase.execute(
      session,
      authUserId: authUserId,
      limit: limit,
      offset: offset,
    );
  }
}
