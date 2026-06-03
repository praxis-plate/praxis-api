import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UserProfileMetadataDataSource {
  const UserProfileMetadataDataSource();

  Future<UserProfileMetadata?> findByAuthUserId(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) {
    return UserProfileMetadata.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(authUserId),
      transaction: transaction,
    );
  }

  Future<UserProfileMetadata> upsertFullNameChangedAt(
    Session session, {
    required UuidValue authUserId,
    required DateTime changedAt,
    Transaction? transaction,
  }) async {
    final existing = await findByAuthUserId(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );

    if (existing == null) {
      return UserProfileMetadata.db.insertRow(
        session,
        UserProfileMetadata(
          authUserId: authUserId,
          lastFullNameChangedAt: changedAt,
        ),
        transaction: transaction,
      );
    }

    return UserProfileMetadata.db.updateRow(
      session,
      existing.copyWith(lastFullNameChangedAt: changedAt),
      transaction: transaction,
    );
  }
}
