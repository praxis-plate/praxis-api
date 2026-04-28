import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/usecases/access_control/assign_user_role_use_case.dart';
import 'package:praxis_server/src/usecases/access_control/get_access_profile_use_case.dart';
import 'package:praxis_server/src/usecases/access_control/list_governance_users_use_case.dart';
import 'package:praxis_server/src/usecases/access_control/revoke_user_role_use_case.dart';
import 'package:praxis_server/src/usecases/achievement/get_all_achievements_use_case.dart';
import 'package:praxis_server/src/usecases/achievement/get_user_achievements_use_case.dart';
import 'package:praxis_server/src/usecases/achievement/is_achievement_unlocked_use_case.dart';
import 'package:praxis_server/src/usecases/achievement/unlock_achievement_use_case.dart';
import 'package:praxis_server/src/usecases/ai/generate_explanation_use_case.dart';
import 'package:praxis_server/src/usecases/ai/generate_hint_use_case.dart';
import 'package:praxis_server/src/usecases/cms_content/course_admin_use_cases.dart';
import 'package:praxis_server/src/usecases/cms_analytics/course_analytics_admin_use_cases.dart';
import 'package:praxis_server/src/usecases/cms_content/lesson_admin_use_cases.dart';
import 'package:praxis_server/src/usecases/cms_content/module_admin_use_cases.dart';
import 'package:praxis_server/src/usecases/cms_content/task_admin_use_cases.dart';
import 'package:praxis_server/src/usecases/course/enroll_course_use_case.dart';
import 'package:praxis_server/src/usecases/course/get_adaptive_learning_path_use_case.dart';
import 'package:praxis_server/src/usecases/course/get_course_by_id_use_case.dart';
import 'package:praxis_server/src/usecases/course/get_course_table_of_contents_use_case.dart';
import 'package:praxis_server/src/usecases/course/get_courses_use_case.dart';
import 'package:praxis_server/src/usecases/course/get_enrolled_courses_use_case.dart';
import 'package:praxis_server/src/usecases/course/get_personalized_recommendations_use_case.dart';
import 'package:praxis_server/src/usecases/course/unenroll_course_use_case.dart';
import 'package:praxis_server/src/usecases/external_integration/external_integration_admin_use_cases.dart';
import 'package:praxis_server/src/usecases/lesson/complete_lesson_use_case.dart';
import 'package:praxis_server/src/usecases/lesson/get_lesson_by_id_use_case.dart';
import 'package:praxis_server/src/usecases/lesson/get_lessons_by_course_id_use_case.dart';
import 'package:praxis_server/src/usecases/lesson/get_lessons_by_module_id_use_case.dart';
import 'package:praxis_server/src/usecases/lesson/mark_lesson_complete_use_case.dart';
import 'package:praxis_server/src/usecases/module/get_modules_by_course_id_use_case.dart';
import 'package:praxis_server/src/usecases/task/get_task_by_id_use_case.dart';
import 'package:praxis_server/src/usecases/task/get_tasks_by_lesson_id_use_case.dart';
import 'package:praxis_server/src/usecases/task/task_answer_use_case.dart';
import 'package:praxis_server/src/usecases/user_statistics/get_user_statistics_use_case.dart';
import 'package:praxis_server/src/usecases/wallet/buy_with_wallet_use_case.dart';
import 'package:praxis_server/src/usecases/wallet/get_wallet_balance_use_case.dart';
import 'package:praxis_server/src/usecases/wallet/get_wallet_history_use_case.dart';
import 'package:praxis_server/src/usecases/wallet/top_up_wallet_use_case.dart';
import 'package:serverpod/serverpod.dart';

class AppUseCases {
  final GetAccessProfileUseCase getAccessProfileUseCase;
  final ListGovernanceUsersUseCase listGovernanceUsersUseCase;
  final AssignUserRoleUseCase assignUserRoleUseCase;
  final RevokeUserRoleUseCase revokeUserRoleUseCase;
  final ListAdminCoursesUseCase listAdminCoursesUseCase;
  final GetAdminCourseAnalyticsDashboardUseCase
  getAdminCourseAnalyticsDashboardUseCase;
  final CreateAdminCourseUseCase createAdminCourseUseCase;
  final UpdateAdminCourseUseCase updateAdminCourseUseCase;
  final PublishAdminCourseUseCase publishAdminCourseUseCase;
  final UnpublishAdminCourseUseCase unpublishAdminCourseUseCase;
  final ListAdminModulesUseCase listAdminModulesUseCase;
  final CreateAdminModuleUseCase createAdminModuleUseCase;
  final UpdateAdminModuleUseCase updateAdminModuleUseCase;
  final ReorderAdminModulesUseCase reorderAdminModulesUseCase;
  final ListAdminLessonsUseCase listAdminLessonsUseCase;
  final CreateAdminLessonUseCase createAdminLessonUseCase;
  final UpdateAdminLessonUseCase updateAdminLessonUseCase;
  final ReorderAdminLessonsUseCase reorderAdminLessonsUseCase;
  final ListAdminTasksUseCase listAdminTasksUseCase;
  final CreateAdminTaskUseCase createAdminTaskUseCase;
  final UpdateAdminTaskUseCase updateAdminTaskUseCase;
  final ReorderAdminTasksUseCase reorderAdminTasksUseCase;
  final UpsertAdminTaskOptionsUseCase upsertAdminTaskOptionsUseCase;
  final UpsertAdminTaskTestCasesUseCase upsertAdminTaskTestCasesUseCase;
  final GenerateHintUseCase generateHintUseCase;
  final GenerateExplanationUseCase generateExplanationUseCase;
  final GetAllAchievementsUseCase getAllAchievementsUseCase;
  final GetUserAchievementsUseCase getUserAchievementsUseCase;
  final UnlockAchievementUseCase unlockAchievementUseCase;
  final IsAchievementUnlockedUseCase isAchievementUnlockedUseCase;
  final GetCoursesUseCase getCoursesUseCase;
  final GetAdaptiveLearningPathUseCase getAdaptiveLearningPathUseCase;
  final GetPersonalizedRecommendationsUseCase
  getPersonalizedRecommendationsUseCase;
  final ListExternalIntegrationProvidersUseCase
  listExternalIntegrationProvidersUseCase;
  final SyncCourseToExternalProviderUseCase syncCourseToExternalProviderUseCase;
  final ProvisionExternalVideoSessionUseCase
  provisionExternalVideoSessionUseCase;
  final GetCourseByIdUseCase getCourseByIdUseCase;
  final GetEnrolledCoursesUseCase getEnrolledCoursesUseCase;
  final EnrollCourseUseCase enrollCourseUseCase;
  final UnenrollCourseUseCase unenrollCourseUseCase;
  final GetCourseTableOfContentsUseCase getCourseTableOfContentsUseCase;
  final GetLessonsByCourseIdUseCase getLessonsByCourseIdUseCase;
  final GetLessonsByModuleIdUseCase getLessonsByModuleIdUseCase;
  final GetLessonByIdUseCase getLessonByIdUseCase;
  final CompleteLessonUseCase completeLessonUseCase;
  final MarkLessonCompleteUseCase markLessonCompleteUseCase;
  final GetModulesByCourseIdUseCase getModulesByCourseIdUseCase;
  final GetTaskByIdUseCase getTaskByIdUseCase;
  final GetTasksByLessonIdUseCase getTasksByLessonIdUseCase;
  final TaskAnswerUseCase taskAnswerUseCase;
  final GetUserStatisticsUseCase getUserStatisticsUseCase;
  final GetWalletBalanceUseCase getWalletBalanceUseCase;
  final TopUpWalletUseCase topUpWalletUseCase;
  final BuyWithWalletUseCase buyWithWalletUseCase;
  final GetWalletHistoryUseCase getWalletHistoryUseCase;

  AppUseCases({
    required this.getAccessProfileUseCase,
    required this.listGovernanceUsersUseCase,
    required this.assignUserRoleUseCase,
    required this.revokeUserRoleUseCase,
    required this.listAdminCoursesUseCase,
    required this.getAdminCourseAnalyticsDashboardUseCase,
    required this.createAdminCourseUseCase,
    required this.updateAdminCourseUseCase,
    required this.publishAdminCourseUseCase,
    required this.unpublishAdminCourseUseCase,
    required this.listAdminModulesUseCase,
    required this.createAdminModuleUseCase,
    required this.updateAdminModuleUseCase,
    required this.reorderAdminModulesUseCase,
    required this.listAdminLessonsUseCase,
    required this.createAdminLessonUseCase,
    required this.updateAdminLessonUseCase,
    required this.reorderAdminLessonsUseCase,
    required this.listAdminTasksUseCase,
    required this.createAdminTaskUseCase,
    required this.updateAdminTaskUseCase,
    required this.reorderAdminTasksUseCase,
    required this.upsertAdminTaskOptionsUseCase,
    required this.upsertAdminTaskTestCasesUseCase,
    required this.generateHintUseCase,
    required this.generateExplanationUseCase,
    required this.getAllAchievementsUseCase,
    required this.getUserAchievementsUseCase,
    required this.unlockAchievementUseCase,
    required this.isAchievementUnlockedUseCase,
    required this.getCoursesUseCase,
    required this.getAdaptiveLearningPathUseCase,
    required this.getPersonalizedRecommendationsUseCase,
    required this.listExternalIntegrationProvidersUseCase,
    required this.syncCourseToExternalProviderUseCase,
    required this.provisionExternalVideoSessionUseCase,
    required this.getCourseByIdUseCase,
    required this.getEnrolledCoursesUseCase,
    required this.enrollCourseUseCase,
    required this.unenrollCourseUseCase,
    required this.getCourseTableOfContentsUseCase,
    required this.getLessonsByCourseIdUseCase,
    required this.getLessonsByModuleIdUseCase,
    required this.getLessonByIdUseCase,
    required this.completeLessonUseCase,
    required this.markLessonCompleteUseCase,
    required this.getModulesByCourseIdUseCase,
    required this.getTaskByIdUseCase,
    required this.getTasksByLessonIdUseCase,
    required this.taskAnswerUseCase,
    required this.getUserStatisticsUseCase,
    required this.getWalletBalanceUseCase,
    required this.topUpWalletUseCase,
    required this.buyWithWalletUseCase,
    required this.getWalletHistoryUseCase,
  });

  factory AppUseCases.build(
    Serverpod pod,
    AppServices services,
  ) {
    return AppUseCases(
      getAccessProfileUseCase: GetAccessProfileUseCase(
        accessControlService: services.accessControlService,
      ),
      listGovernanceUsersUseCase: ListGovernanceUsersUseCase(
        accessControlService: services.accessControlService,
      ),
      assignUserRoleUseCase: AssignUserRoleUseCase(
        accessControlService: services.accessControlService,
      ),
      revokeUserRoleUseCase: RevokeUserRoleUseCase(
        accessControlService: services.accessControlService,
      ),
      listAdminCoursesUseCase: ListAdminCoursesUseCase(
        cmsContentService: services.cmsContentService,
      ),
      getAdminCourseAnalyticsDashboardUseCase:
          GetAdminCourseAnalyticsDashboardUseCase(
            cmsCourseAnalyticsService: services.cmsCourseAnalyticsService,
          ),
      createAdminCourseUseCase: CreateAdminCourseUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      updateAdminCourseUseCase: UpdateAdminCourseUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      publishAdminCourseUseCase: PublishAdminCourseUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      unpublishAdminCourseUseCase: UnpublishAdminCourseUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      listAdminModulesUseCase: ListAdminModulesUseCase(
        cmsContentService: services.cmsContentService,
      ),
      createAdminModuleUseCase: CreateAdminModuleUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      updateAdminModuleUseCase: UpdateAdminModuleUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      reorderAdminModulesUseCase: ReorderAdminModulesUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      listAdminLessonsUseCase: ListAdminLessonsUseCase(
        cmsContentService: services.cmsContentService,
      ),
      createAdminLessonUseCase: CreateAdminLessonUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      updateAdminLessonUseCase: UpdateAdminLessonUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      reorderAdminLessonsUseCase: ReorderAdminLessonsUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      listAdminTasksUseCase: ListAdminTasksUseCase(
        cmsContentService: services.cmsContentService,
      ),
      createAdminTaskUseCase: CreateAdminTaskUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      updateAdminTaskUseCase: UpdateAdminTaskUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      reorderAdminTasksUseCase: ReorderAdminTasksUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      upsertAdminTaskOptionsUseCase: UpsertAdminTaskOptionsUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      upsertAdminTaskTestCasesUseCase: UpsertAdminTaskTestCasesUseCase(
        cmsContentService: services.cmsContentService,
        transactionRunner: services.transactionRunner,
      ),
      generateHintUseCase: GenerateHintUseCase(aiService: services.aiService),
      generateExplanationUseCase: GenerateExplanationUseCase(
        aiService: services.aiService,
      ),
      getAllAchievementsUseCase: GetAllAchievementsUseCase(
        achievementService: services.achievementService,
      ),
      getUserAchievementsUseCase: GetUserAchievementsUseCase(
        achievementService: services.achievementService,
      ),
      unlockAchievementUseCase: UnlockAchievementUseCase(
        achievementService: services.achievementService,
      ),
      isAchievementUnlockedUseCase: IsAchievementUnlockedUseCase(
        achievementService: services.achievementService,
      ),
      getCoursesUseCase: GetCoursesUseCase(
        courseService: services.courseService,
      ),
      getAdaptiveLearningPathUseCase: GetAdaptiveLearningPathUseCase(
        adaptiveLearningPathService: services.adaptiveLearningPathService,
      ),
      getPersonalizedRecommendationsUseCase:
          GetPersonalizedRecommendationsUseCase(
            courseRecommendationService: services.courseRecommendationService,
          ),
      listExternalIntegrationProvidersUseCase:
          ListExternalIntegrationProvidersUseCase(
            externalIntegrationService: services.externalIntegrationService,
          ),
      syncCourseToExternalProviderUseCase: SyncCourseToExternalProviderUseCase(
        externalIntegrationService: services.externalIntegrationService,
      ),
      provisionExternalVideoSessionUseCase:
          ProvisionExternalVideoSessionUseCase(
            externalIntegrationService: services.externalIntegrationService,
          ),
      getCourseByIdUseCase: GetCourseByIdUseCase(
        courseService: services.courseService,
      ),
      getEnrolledCoursesUseCase: GetEnrolledCoursesUseCase(
        courseService: services.courseService,
      ),
      enrollCourseUseCase: EnrollCourseUseCase(
        courseService: services.courseService,
      ),
      unenrollCourseUseCase: UnenrollCourseUseCase(
        courseService: services.courseService,
      ),
      getCourseTableOfContentsUseCase: GetCourseTableOfContentsUseCase(
        courseService: services.courseService,
      ),
      getLessonsByCourseIdUseCase: GetLessonsByCourseIdUseCase(
        lessonService: services.lessonService,
      ),
      getLessonsByModuleIdUseCase: GetLessonsByModuleIdUseCase(
        lessonService: services.lessonService,
      ),
      getLessonByIdUseCase: GetLessonByIdUseCase(
        lessonService: services.lessonService,
      ),
      completeLessonUseCase: CompleteLessonUseCase(
        lessonService: services.lessonService,
        userStatisticsService: services.userStatisticsService,
        walletService: services.walletService,
        achievementService: services.achievementService,
        transactionRunner: services.transactionRunner,
      ),
      markLessonCompleteUseCase: MarkLessonCompleteUseCase(
        lessonService: services.lessonService,
        transactionRunner: services.transactionRunner,
      ),
      getModulesByCourseIdUseCase: GetModulesByCourseIdUseCase(
        moduleService: services.moduleService,
      ),
      getTaskByIdUseCase: GetTaskByIdUseCase(
        taskService: services.taskService,
      ),
      getTasksByLessonIdUseCase: GetTasksByLessonIdUseCase(
        taskService: services.taskService,
      ),
      taskAnswerUseCase: TaskAnswerUseCase(
        taskService: services.taskService,
      ),
      getUserStatisticsUseCase: GetUserStatisticsUseCase(
        userStatisticsService: services.userStatisticsService,
      ),
      getWalletBalanceUseCase: GetWalletBalanceUseCase(
        walletService: services.walletService,
      ),
      topUpWalletUseCase: TopUpWalletUseCase(
        walletService: services.walletService,
      ),
      buyWithWalletUseCase: BuyWithWalletUseCase(
        walletService: services.walletService,
      ),
      getWalletHistoryUseCase: GetWalletHistoryUseCase(
        walletService: services.walletService,
      ),
    );
  }
}
