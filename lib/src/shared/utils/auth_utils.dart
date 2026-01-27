import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Authentication and authorization utilities
class AuthUtils {
  /// Checks authentication and returns user information
  static AuthenticationInfo requireAuth(Session session) {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw NotAuthorizedException(
        reason: AuthenticationFailureReason.unauthenticated,
        message: 'User is not authorized',
      );
    }
    return authInfo;
  }

  /// Checks if user has specific scope
  static void requireScope(Session session, String requiredScope) {
    requireScopes(session, {requiredScope});
  }

  /// Checks if user has required scopes
  static void requireScopes(Session session, Set<String> requiredScopes) {
    final authInfo = requireAuth(session);
    final userScopes = authInfo.scopes.map((scope) => scope.name).toSet();
    final missingScopes = requiredScopes.difference(userScopes);

    if (missingScopes.isNotEmpty) {
      throw NotAuthorizedException(
        reason: AuthenticationFailureReason.insufficientAccess,
        message:
            'Insufficient access rights. Missing scopes: ${missingScopes.join(', ')}',
      );
    }
  }

  /// Checks if user has at least one of the required scopes
  static void requireAnyScope(Session session, Set<String> requiredScopes) {
    final authInfo = requireAuth(session);
    final userScopes = authInfo.scopes.map((scope) => scope.name).toSet();
    final hasAnyScope = requiredScopes.any(
      (scope) => userScopes.contains(scope),
    );

    if (!hasAnyScope) {
      throw NotAuthorizedException(
        reason: AuthenticationFailureReason.insufficientAccess,
        message:
            'Insufficient access rights. Required one of: ${requiredScopes.join(', ')}',
      );
    }
  }

  /// Parses user ID from string
  static UuidValue parseAuthUserId(String userIdentifier) {
    try {
      return UuidValue.fromString(userIdentifier);
    } catch (_) {
      throw ValidationException(
        message: 'Invalid auth user id',
        field: 'authUserId',
      );
    }
  }

  /// Gets authenticated user ID from session
  static UuidValue getAuthUserId(Session session) {
    final authInfo = requireAuth(session);
    return parseAuthUserId(authInfo.userIdentifier);
  }

  /// Gets authenticated user ID from session with scope check
  static UuidValue getAuthUserIdWithScope(
    Session session,
    String requiredScope,
  ) {
    requireScope(session, requiredScope);
    final authInfo = requireAuth(session);
    return parseAuthUserId(authInfo.userIdentifier);
  }

  /// Gets authenticated user ID from session with multiple scope check
  static UuidValue getAuthUserIdWithScopes(
    Session session,
    Set<String> requiredScopes,
  ) {
    requireScopes(session, requiredScopes);
    final authInfo = requireAuth(session);
    return parseAuthUserId(authInfo.userIdentifier);
  }
}
