import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/auth_scopes.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class CourseAnalyticsAdminEndpoint extends Endpoint {
  Future<CourseAnalyticsDashboardDto> getDashboard(
    Session session,
    int courseId, {
    int commonWrongAnswersLimit = 10,
  }) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.getAdminCourseAnalyticsDashboardUseCase
        .execute(
          session,
          courseId,
          commonWrongAnswersLimit: commonWrongAnswersLimit,
        );
  }
}
