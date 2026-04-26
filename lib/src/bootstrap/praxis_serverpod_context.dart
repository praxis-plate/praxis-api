import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/app_usecases.dart';
import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/task_option_data_source.dart';
import 'package:praxis_server/src/generated/endpoints.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/course_seed/course_seed_service.dart';
import 'package:praxis_server/src/services/email_idp_notification/email_idp_notification_service.dart';
import 'package:praxis_server/src/services/user_seed/user_seed_service.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

class PraxisServerpodContext {
  final Serverpod pod;
  final EmailIdpConfig emailIdpConfig;

  const PraxisServerpodContext({
    required this.pod,
    required this.emailIdpConfig,
  });
}

PraxisServerpodContext createPraxisServerpod(List<String> args) {
  final pod = Serverpod(args, Protocol(), Endpoints());
  const emailIdpNotifications = EmailIdpNotificationService();

  pod.server.services = AppServices.build(pod);
  pod.server.useCases = AppUseCases.build(pod, pod.server.services);

  final emailIdpConfig = EmailIdpConfigFromPasswords(
    sendRegistrationVerificationCode:
        emailIdpNotifications.sendRegistrationCode,
    sendPasswordResetVerificationCode:
        emailIdpNotifications.sendPasswordResetCode,
    onAfterAccountCreated:
        (
          session, {
          required authUserId,
          required email,
          required emailAccountId,
          required transaction,
        }) async {
          await pod.server.services.accessControlService
              .initializeRolesForNewAccount(
                session,
                authUserId: authUserId,
                email: email,
                transaction: transaction,
              );
          await pod.server.services.walletService.initializeBalance(
            session,
            authUserId: authUserId,
          );
          await pod.server.services.userStatisticsService.ensureStatistics(
            session,
            authUserId: authUserId,
            transaction: transaction,
          );
        },
  );

  pod.initializeAuthServices(
    tokenManagerBuilders: [
      JwtConfigFromPasswords(),
    ],
    identityProviderBuilders: [
      emailIdpConfig,
    ],
  );

  return PraxisServerpodContext(
    pod: pod,
    emailIdpConfig: emailIdpConfig,
  );
}

Future<void> seedDevelopmentData(
  Serverpod pod, {
  required EmailIdpConfig emailIdpConfig,
}) async {
  await UserSeedService(emailIdpConfig: emailIdpConfig).createTestUser(pod);
  await CourseSeedService(
    courseDataSource: const CourseDataSource(),
    moduleDataSource: const ModuleDataSource(),
    lessonDataSource: const LessonDataSource(),
    taskDataSource: const TaskDataSource(),
    taskOptionDataSource: const TaskOptionDataSource(),
  ).seedFirstCourse(pod);
}
