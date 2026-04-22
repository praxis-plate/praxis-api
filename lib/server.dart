import 'dart:io';

import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/task_option_data_source.dart';
import 'package:praxis_server/src/generated/endpoints.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/app_services.dart';
import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/app_usecases.dart';
import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/services/email_idp_notification/email_idp_notification_service.dart';
import 'package:praxis_server/src/services/course_seed/course_seed_service.dart';
import 'package:praxis_server/src/services/user_seed/user_seed_service.dart';
import 'package:praxis_server/src/web/routes/app_config_route.dart';
import 'package:praxis_server/src/web/routes/root.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

/// The starting point of the Serverpod server.
void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
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

  // Initialize authentication services for the server.
  // Token managers will be used to validate and issue authentication keys,
  // and the identity providers will be the authentication options available for users.
  pod.initializeAuthServices(
    tokenManagerBuilders: [
      // Use JWT for authentication keys towards the server.
      JwtConfigFromPasswords(),
    ],
    identityProviderBuilders: [
      // Configure the email identity provider for email/password authentication.
      emailIdpConfig,
    ],
  );

  // Setup a default page at the web root.
  // These are used by the default page.
  pod.webServer.addRoute(RootRoute(), '/');
  pod.webServer.addRoute(RootRoute(), '/index.html');

  // Serve all files in the web/static relative directory under /.
  // These are used by the default web page.
  final root = Directory(Uri(path: 'web/static').toFilePath());
  pod.webServer.addRoute(StaticRoute.directory(root));

  // Setup the app config route.
  // We build this configuration based on the servers api url and serve it to
  // the flutter app.
  pod.webServer.addRoute(
    AppConfigRoute(apiConfig: pod.config.apiServer),
    '/app/assets/assets/config.json',
  );

  // Checks if the flutter web app has been built and serves it if it has.
  final appDir = Directory(Uri(path: 'web/app').toFilePath());
  if (appDir.existsSync()) {
    // Serve the flutter web app under the /app path.
    pod.webServer.addRoute(
      FlutterRoute(
        Directory(
          Uri(path: 'web/app').toFilePath(),
        ),
      ),
      '/app',
    );
  } else {
    // If the flutter web app has not been built, serve the build app page.
    pod.webServer.addRoute(
      StaticRoute.file(
        File(
          Uri(path: 'web/pages/build_flutter_app.html').toFilePath(),
        ),
      ),
      '/app/**',
    );
  }

  // Start the server.
  await pod.start();
  await UserSeedService(emailIdpConfig: emailIdpConfig).createTestUser(pod);
  await CourseSeedService(
    courseDataSource: const CourseDataSource(),
    moduleDataSource: const ModuleDataSource(),
    lessonDataSource: const LessonDataSource(),
    taskDataSource: const TaskDataSource(),
    taskOptionDataSource: const TaskOptionDataSource(),
  ).seedFirstCourse(pod);
}
