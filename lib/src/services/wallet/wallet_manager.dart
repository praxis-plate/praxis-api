import 'package:praxis_server/src/datasources/wallet_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Handles wallet management (creation, lookup)
class WalletManager {
  final WalletDataSource _walletDataSource;

  WalletManager({
    required WalletDataSource walletDataSource,
  }) : _walletDataSource = walletDataSource;

  /// Creates a new wallet
  Future<UserWallet> createWallet(
    Session session, {
    required UuidValue authUserId,
    required String currency,
    Transaction? transaction,
  }) async {
    return _walletDataSource.insert(
      session,
      authUserId: authUserId,
      currency: currency,
      createdAt: DateTime.now(),
      transaction: transaction,
    );
  }

  /// Ensures wallet exists (creates if missing)
  Future<UserWallet> ensureWallet(
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

    try {
      return await createWallet(
        session,
        authUserId: authUserId,
        currency: currency,
        transaction: transaction,
      );
    } catch (e) {
      // If uniqueness error occurred (race condition),
      // try to find the wallet again
      final existingAfterConflict = await _walletDataSource.findByAuthUserId(
        session,
        authUserId,
        transaction: transaction,
      );
      if (existingAfterConflict != null) {
        return existingAfterConflict;
      }
      rethrow;
    }
  }
}
