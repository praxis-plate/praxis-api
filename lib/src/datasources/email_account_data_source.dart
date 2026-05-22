import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';

class EmailAccountDataSource {
  const EmailAccountDataSource();

  Future<List<EmailAccount>> listByAuthUserIds(
    Session session, {
    required Set<UuidValue> authUserIds,
    Transaction? transaction,
  }) {
    if (authUserIds.isEmpty) {
      return Future.value(const []);
    }

    return EmailAccount.db.find(
      session,
      where: (t) => t.authUserId.inSet(authUserIds),
      transaction: transaction,
    );
  }

  Future<EmailAccount?> findByAuthUserId(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) {
    return EmailAccount.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
      transaction: transaction,
    );
  }
}
