import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';

class AuthUserDataSource {
  const AuthUserDataSource();

  Future<AuthUserModel> findById(
    Session session, {
    required UuidValue authUserId,
    Transaction? transaction,
  }) {
    return const AuthUsers().get(
      session,
      authUserId: authUserId,
      transaction: transaction,
    );
  }

  Future<AuthUserModel> updateScopes(
    Session session, {
    required UuidValue authUserId,
    required Set<Scope> scopes,
    Transaction? transaction,
  }) {
    return const AuthUsers().update(
      session,
      authUserId: authUserId,
      scopes: scopes,
      transaction: transaction,
    );
  }
}
