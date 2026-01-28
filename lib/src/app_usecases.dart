import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/usecases/achievement/get_all_achievements_use_case.dart';
import 'package:praxis_server/src/usecases/achievement/get_user_achievements_use_case.dart';
import 'package:praxis_server/src/usecases/achievement/is_achievement_unlocked_use_case.dart';
import 'package:praxis_server/src/usecases/achievement/unlock_achievement_use_case.dart';
import 'package:praxis_server/src/usecases/ai/generate_explanation_use_case.dart';
import 'package:praxis_server/src/usecases/ai/generate_hint_use_case.dart';
import 'package:praxis_server/src/usecases/course/enroll_course_use_case.dart';
import 'package:praxis_server/src/usecases/course/get_course_by_id_use_case.dart';
import 'package:praxis_server/src/usecases/course/get_course_table_of_contents_use_case.dart';
import 'package:praxis_server/src/usecases/course/get_courses_use_case.dart';
import 'package:praxis_server/src/usecases/course/get_enrolled_courses_use_case.dart';
import 'package:praxis_server/src/usecases/course/unenroll_course_use_case.dart';
import 'package:praxis_server/src/usecases/lesson/complete_lesson_use_case.dart';
import 'package:praxis_server/src/usecases/lesson/get_lessons_by_course_id_use_case.dart';
import 'package:praxis_server/src/usecases/lesson/get_lessons_by_module_id_use_case.dart';
import 'package:praxis_server/src/usecases/lesson/mark_lesson_complete_use_case.dart';
import 'package:praxis_server/src/usecases/module/get_modules_by_course_id_use_case.dart';
import 'package:praxis_server/src/usecases/task/get_tasks_by_lesson_id_use_case.dart';
import 'package:praxis_server/src/usecases/user_statistics/get_user_statistics_use_case.dart';
import 'package:praxis_server/src/usecases/wallet/buy_with_wallet_use_case.dart';
import 'package:praxis_server/src/usecases/wallet/get_wallet_balance_use_case.dart';
import 'package:praxis_server/src/usecases/wallet/get_wallet_history_use_case.dart';
import 'package:praxis_server/src/usecases/wallet/top_up_wallet_use_case.dart';
import 'package:serverpod/serverpod.dart';

class AppUseCases {
  final GenerateHintUseCase generateHintUseCase;
  final GenerateExplanationUseCase generateExplanationUseCase;
  final GetAllAchievementsUseCase getAllAchievementsUseCase;
  final GetUserAchievementsUseCase getUserAchievementsUseCase;
  final UnlockAchievementUseCase unlockAchievementUseCase;
  final IsAchievementUnlockedUseCase isAchievementUnlockedUseCase;
  final GetCoursesUseCase getCoursesUseCase;
  final GetCourseByIdUseCase getCourseByIdUseCase;
  final GetEnrolledCoursesUseCase getEnrolledCoursesUseCase;
  final EnrollCourseUseCase enrollCourseUseCase;
  final UnenrollCourseUseCase unenrollCourseUseCase;
  final GetCourseTableOfContentsUseCase getCourseTableOfContentsUseCase;
  final GetLessonsByCourseIdUseCase getLessonsByCourseIdUseCase;
  final GetLessonsByModuleIdUseCase getLessonsByModuleIdUseCase;
  final CompleteLessonUseCase completeLessonUseCase;
  final MarkLessonCompleteUseCase markLessonCompleteUseCase;
  final GetModulesByCourseIdUseCase getModulesByCourseIdUseCase;
  final GetTasksByLessonIdUseCase getTasksByLessonIdUseCase;
  final GetUserStatisticsUseCase getUserStatisticsUseCase;
  final GetWalletBalanceUseCase getWalletBalanceUseCase;
  final TopUpWalletUseCase topUpWalletUseCase;
  final BuyWithWalletUseCase buyWithWalletUseCase;
  final GetWalletHistoryUseCase getWalletHistoryUseCase;

  AppUseCases({
    required this.generateHintUseCase,
    required this.generateExplanationUseCase,
    required this.getAllAchievementsUseCase,
    required this.getUserAchievementsUseCase,
    required this.unlockAchievementUseCase,
    required this.isAchievementUnlockedUseCase,
    required this.getCoursesUseCase,
    required this.getCourseByIdUseCase,
    required this.getEnrolledCoursesUseCase,
    required this.enrollCourseUseCase,
    required this.unenrollCourseUseCase,
    required this.getCourseTableOfContentsUseCase,
    required this.getLessonsByCourseIdUseCase,
    required this.getLessonsByModuleIdUseCase,
    required this.completeLessonUseCase,
    required this.markLessonCompleteUseCase,
    required this.getModulesByCourseIdUseCase,
    required this.getTasksByLessonIdUseCase,
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
      completeLessonUseCase: services.completeLessonUseCase,
      markLessonCompleteUseCase: services.markLessonCompleteUseCase,
      getModulesByCourseIdUseCase: GetModulesByCourseIdUseCase(
        moduleService: services.moduleService,
      ),
      getTasksByLessonIdUseCase: GetTasksByLessonIdUseCase(
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
