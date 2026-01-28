import 'package:serverpod/serverpod.dart';

import 'package:praxis_server/src/datasources/base_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';

class WalletDataSource extends BaseDataSource {
  const WalletDataSource();

  Future<UserWallet?> findByAuthUserId(
    Session session,
    UuidValue authUserId, {
    Transaction? transaction,
  }) {
    return UserWallet.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
      transaction: transaction,
    );
  }

  Future<UserWallet> insert(
    Session session, {
    required UuidValue authUserId,
    required String currency,
    required DateTime createdAt,
    Transaction? transaction,
  }) {
    final wallet = UserWallet(
      authUserId: authUserId,
      balance: 0,
      available: 0,
      held: 0,
      currency: currency,
      version: 0,
      createdAt: createdAt,
      updatedAt: createdAt,
    );

    return UserWallet.db.insertRow(
      session,
      wallet,
      transaction: transaction,
    );
  }

  Future<UserWallet?> updateWithVersion(
    Session session, {
    required UuidValue authUserId,
    required int expectedVersion,
    required int balance,
    required int available,
    required int held,
    required String currency,
    required DateTime updatedAt,
    Transaction? transaction,
  }) async {
    final updated = await UserWallet.db.updateWhere(
      session,
      columnValues: (t) => [
        t.balance(balance),
        t.available(available),
        t.held(held),
        t.currency(currency),
        t.version(expectedVersion + 1),
        t.updatedAt(updatedAt),
      ],
      where: (t) =>
          t.authUserId.equals(authUserId) & t.version.equals(expectedVersion),
      transaction: transaction,
    );

    if (updated.isEmpty) {
      return null;
    }

    return updated.single;
  }
}
