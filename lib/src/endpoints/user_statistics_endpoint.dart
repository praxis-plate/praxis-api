import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

/// User statistics endpoint for managing learning progress and achievements
class UserStatisticsEndpoint extends Endpoint {
  /// Gets user statistics for authenticated user
  ///
  /// Returns user learning statistics including:
  /// - experiencePoints: Total experience points earned
  /// - currentStreak: Current consecutive days of activity
  /// - maxStreak: Maximum consecutive days achieved
  /// - lastActiveDate: Last date of user activity
  ///
  /// Always returns statistics, creates empty statistics for first-time users
  ///
  /// Throws [NotAuthorizedException] if user is not authenticated
  Future<UserStatisticsDto> get(Session session) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return session.server.useCases.getUserStatisticsUseCase.execute(
      session,
      authUserId: authUserId,
    );
  }
}
