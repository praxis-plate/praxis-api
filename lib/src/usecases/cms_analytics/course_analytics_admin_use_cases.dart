import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/cms_analytics/cms_course_analytics_service.dart';
import 'package:serverpod/serverpod.dart';

class GetAdminCourseAnalyticsDashboardUseCase {
  final CmsCourseAnalyticsService _cmsCourseAnalyticsService;

  const GetAdminCourseAnalyticsDashboardUseCase({
    required CmsCourseAnalyticsService cmsCourseAnalyticsService,
  }) : _cmsCourseAnalyticsService = cmsCourseAnalyticsService;

  Future<CourseAnalyticsDashboardDto> execute(
    Session session,
    int courseId, {
    int commonWrongAnswersLimit = 10,
  }) {
    return _cmsCourseAnalyticsService.getDashboard(
      session,
      courseId,
      commonWrongAnswersLimit: commonWrongAnswersLimit,
    );
  }
}
