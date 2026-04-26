import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:praxis_server/src/datasources/achievement_data_source.dart';
import 'package:praxis_server/src/datasources/auth_user_data_source.dart';
import 'package:praxis_server/src/datasources/coin_transactions_data_source.dart';
import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_progress_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/task_option_data_source.dart';
import 'package:praxis_server/src/datasources/task_answer_attempt_data_source.dart';
import 'package:praxis_server/src/datasources/task_test_case_data_source.dart';
import 'package:praxis_server/src/datasources/user_achievement_data_source.dart';
import 'package:praxis_server/src/datasources/user_course_data_source.dart';
import 'package:praxis_server/src/datasources/user_statistics_data_source.dart';
import 'package:praxis_server/src/datasources/wallet_data_source.dart';
import 'package:praxis_server/src/services/achievement/achievement_service.dart';
import 'package:praxis_server/src/services/access_control/access_control_service.dart';
import 'package:praxis_server/src/services/adaptive_learning/adaptive_learning_path_service.dart';
import 'package:praxis_server/src/services/ai/ai_service.dart';
import 'package:praxis_server/src/services/cms_content/cms_content_service.dart';
import 'package:praxis_server/src/services/cms_analytics/cms_course_analytics_service.dart';
import 'package:praxis_server/src/services/course/course_service.dart';
import 'package:praxis_server/src/services/lesson/lesson_service.dart';
import 'package:praxis_server/src/services/module/module_service.dart';
import 'package:praxis_server/src/services/recommendation/course_recommendation_service.dart';
import 'package:praxis_server/src/services/task/task_answer_validation_service.dart';
import 'package:praxis_server/src/services/task/code_execution_service.dart';
import 'package:praxis_server/src/services/task/task_service.dart';
import 'package:praxis_server/src/services/user_statistics/user_statistics_service.dart';
import 'package:praxis_server/src/services/wallet/wallet_service.dart';
import 'package:praxis_server/src/shared/utils/transaction_runner.dart';
import 'package:serverpod/serverpod.dart';

class AppServices {
  final AchievementService achievementService;
  final AccessControlService accessControlService;
  final AdaptiveLearningPathService adaptiveLearningPathService;
  final AiService? aiService;
  final CmsContentService cmsContentService;
  final CmsCourseAnalyticsService cmsCourseAnalyticsService;
  final CourseService courseService;
  final CourseRecommendationService courseRecommendationService;
  final TransactionRunner transactionRunner;
  final LessonService lessonService;
  final ModuleService moduleService;
  final TaskService taskService;
  final UserStatisticsService userStatisticsService;
  final WalletService walletService;

  AppServices({
    required this.achievementService,
    required this.accessControlService,
    required this.adaptiveLearningPathService,
    required this.aiService,
    required this.cmsContentService,
    required this.cmsCourseAnalyticsService,
    required this.courseService,
    required this.courseRecommendationService,
    required this.transactionRunner,
    required this.lessonService,
    required this.moduleService,
    required this.taskService,
    required this.userStatisticsService,
    required this.walletService,
  });

  factory AppServices.build(Serverpod pod) {
    final geminiApiKey = pod.getPassword('geminiApiKey');
    final proxyHost = pod.getPassword('proxyHost');
    final proxyPortRaw = pod.getPassword('proxyPort');
    final proxyUser = pod.getPassword('proxyUser');
    final proxyPass = pod.getPassword('proxyPass');
    final proxyPort = proxyPortRaw == null ? null : int.tryParse(proxyPortRaw);
    const achievementDataSource = AchievementDataSource();
    const authUserDataSource = AuthUserDataSource();
    const coinTransactionsDataSource = CoinTransactionsDataSource();
    const courseDataSource = CourseDataSource();
    const lessonDataSource = LessonDataSource();
    const lessonProgressDataSource = LessonProgressDataSource();
    const moduleDataSource = ModuleDataSource();
    const taskDataSource = TaskDataSource();
    const taskAnswerAttemptDataSource = TaskAnswerAttemptDataSource();
    const taskOptionDataSource = TaskOptionDataSource();
    const taskTestCaseDataSource = TaskTestCaseDataSource();
    const codeExecutionService = CodeExecutionService();
    const taskAnswerValidationService = TaskAnswerValidationService(
      codeExecutionService: codeExecutionService,
    );
    const userAchievementDataSource = UserAchievementDataSource();
    const userCourseDataSource = UserCourseDataSource();
    const userStatisticsDataSource = UserStatisticsDataSource();
    const walletDataSource = WalletDataSource();

    final taskService = TaskService(
      courseDataSource: courseDataSource,
      lessonDataSource: lessonDataSource,
      moduleDataSource: moduleDataSource,
      taskAnswerAttemptDataSource: taskAnswerAttemptDataSource,
      taskDataSource: taskDataSource,
      taskOptionDataSource: taskOptionDataSource,
      taskTestCaseDataSource: taskTestCaseDataSource,
      validationService: taskAnswerValidationService,
    );
    final userStatisticsService = UserStatisticsService(
      dataSource: userStatisticsDataSource,
    );
    final transactionRunner = const TransactionRunner();
    final walletService = WalletService(
      coinTransactionsDataSource: coinTransactionsDataSource,
      walletDataSource: walletDataSource,
      transactionRunner: transactionRunner,
    );
    final achievementService = AchievementService(
      achievementDataSource: achievementDataSource,
      userAchievementDataSource: userAchievementDataSource,
    );
    final accessControlService = AccessControlService(
      authUserDataSource: authUserDataSource,
      bootstrapAuthorEmails: _parseBootstrapEmails(
        pod.getPassword('bootstrapAuthorEmails'),
      ),
      bootstrapAdminEmails: _parseBootstrapEmails(
        pod.getPassword('bootstrapAdminEmails'),
      ),
    );
    final adaptiveLearningPathService = AdaptiveLearningPathService(
      courseDataSource: courseDataSource,
      moduleDataSource: moduleDataSource,
      lessonDataSource: lessonDataSource,
      taskDataSource: taskDataSource,
      lessonProgressDataSource: lessonProgressDataSource,
      taskAnswerAttemptDataSource: taskAnswerAttemptDataSource,
    );
    final lessonService = LessonService(
      courseDataSource: courseDataSource,
      lessonDataSource: lessonDataSource,
      moduleDataSource: moduleDataSource,
      lessonProgressDataSource: lessonProgressDataSource,
      transactionRunner: transactionRunner,
    );
    final cmsContentService = CmsContentService(
      courseDataSource: courseDataSource,
      moduleDataSource: moduleDataSource,
      lessonDataSource: lessonDataSource,
      taskDataSource: taskDataSource,
      taskOptionDataSource: taskOptionDataSource,
      taskTestCaseDataSource: taskTestCaseDataSource,
    );
    final cmsCourseAnalyticsService = CmsCourseAnalyticsService(
      courseDataSource: courseDataSource,
      moduleDataSource: moduleDataSource,
      lessonDataSource: lessonDataSource,
      taskDataSource: taskDataSource,
      userCourseDataSource: userCourseDataSource,
      lessonProgressDataSource: lessonProgressDataSource,
      taskAnswerAttemptDataSource: taskAnswerAttemptDataSource,
    );
    final courseService = CourseService(
      coinTransactionsDataSource: coinTransactionsDataSource,
      courseDataSource: courseDataSource,
      moduleDataSource: moduleDataSource,
      lessonDataSource: lessonDataSource,
      taskDataSource: taskDataSource,
      taskOptionDataSource: taskOptionDataSource,
      taskTestCaseDataSource: taskTestCaseDataSource,
      userCourseDataSource: userCourseDataSource,
    );
    final courseRecommendationService = CourseRecommendationService(
      courseDataSource: courseDataSource,
      moduleDataSource: moduleDataSource,
      lessonDataSource: lessonDataSource,
      taskDataSource: taskDataSource,
      userCourseDataSource: userCourseDataSource,
      lessonProgressDataSource: lessonProgressDataSource,
    );
    final moduleService = ModuleService(
      courseDataSource: courseDataSource,
      moduleDataSource: moduleDataSource,
    );
    final aiService = _buildAiService(
      geminiApiKey: geminiApiKey,
      proxyHost: proxyHost,
      proxyPort: proxyPort,
      proxyUser: proxyUser,
      proxyPass: proxyPass,
    );

    return AppServices(
      achievementService: achievementService,
      accessControlService: accessControlService,
      adaptiveLearningPathService: adaptiveLearningPathService,
      aiService: aiService,
      cmsContentService: cmsContentService,
      cmsCourseAnalyticsService: cmsCourseAnalyticsService,
      courseService: courseService,
      courseRecommendationService: courseRecommendationService,
      transactionRunner: transactionRunner,
      lessonService: lessonService,
      moduleService: moduleService,
      taskService: taskService,
      userStatisticsService: userStatisticsService,
      walletService: walletService,
    );
  }

  static Set<String> _parseBootstrapEmails(String? rawEmails) {
    if (rawEmails == null || rawEmails.trim().isEmpty) {
      return const {};
    }

    return rawEmails
        .split(',')
        .map((email) => email.trim().toLowerCase())
        .where((email) => email.isNotEmpty)
        .toSet();
  }

  static AiService? _buildAiService({
    required String? geminiApiKey,
    required String? proxyHost,
    required int? proxyPort,
    required String? proxyUser,
    required String? proxyPass,
  }) {
    if (geminiApiKey == null ||
        proxyHost == null ||
        proxyPort == null ||
        proxyUser == null ||
        proxyPass == null) {
      return null;
    }

    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        final credentials = '$proxyUser:$proxyPass@';
        client.findProxy = (uri) {
          return 'PROXY $credentials$proxyHost:$proxyPort';
        };
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );

    return AiService(
      dio: dio,
      apiKey: geminiApiKey,
    );
  }
}
