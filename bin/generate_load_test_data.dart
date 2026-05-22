import 'dart:convert';
import 'dart:io';

import 'package:praxis_server/src/bootstrap/praxis_serverpod_context.dart';
import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/task_option_data_source.dart';
import 'package:praxis_server/src/datasources/task_test_case_data_source.dart';
import 'package:praxis_server/src/services/load_testing/load_test_seed_models.dart';
import 'package:praxis_server/src/services/load_testing/load_test_seed_service.dart';
import 'package:serverpod/serverpod.dart';

Future<void> main(List<String> args) async {
  try {
    final config = _parseConfig(args);
    final context = createPraxisServerpod(_serverpodArgs(args));

    try {
      final summary =
          await LoadTestSeedService(
            courseDataSource: const CourseDataSource(),
            moduleDataSource: const ModuleDataSource(),
            lessonDataSource: const LessonDataSource(),
            taskDataSource: const TaskDataSource(),
            taskOptionDataSource: const TaskOptionDataSource(),
            taskTestCaseDataSource: const TaskTestCaseDataSource(),
          ).ensureData(
            context.pod,
            emailIdpConfig: context.emailIdpConfig,
            config: config,
          );

      _printSummary(summary);
    } finally {
      await context.pod.shutdown(exitProcess: false);
    }
  } on _ExitSignal catch (signal) {
    if (signal.code != 0) {
      rethrow;
    }
  }
}

LoadTestSeedConfig _parseConfig(List<String> args) {
  var courseCount = LoadTestSeedConfig.defaultCourseCount;
  var courseTitlePrefix = LoadTestSeedConfig.defaultCourseTitlePrefix;
  var learnerEmail = LoadTestSeedConfig.defaultLearnerEmail;
  var learnerPassword = LoadTestSeedConfig.defaultLearnerPassword;

  for (final arg in args) {
    if (arg == '--help' || arg == '-h') {
      _printUsage();
      throw _ExitSignal(0);
    }
    if (arg.startsWith('--course-count=')) {
      courseCount = int.parse(arg.split('=').last);
      continue;
    }
    if (arg.startsWith('--title-prefix=')) {
      courseTitlePrefix = arg.split('=').last;
      continue;
    }
    if (arg.startsWith('--learner-email=')) {
      learnerEmail = arg.split('=').last;
      continue;
    }
    if (arg.startsWith('--learner-password=')) {
      learnerPassword = arg.split('=').last;
      continue;
    }
  }

  return LoadTestSeedConfig(
    courseCount: courseCount,
    courseTitlePrefix: courseTitlePrefix,
    learnerEmail: learnerEmail,
    learnerPassword: learnerPassword,
  );
}

List<String> _serverpodArgs(List<String> args) {
  final serverpodArgs = <String>[];

  for (var index = 0; index < args.length; index++) {
    final arg = args[index];

    if (arg == '--mode' && index + 1 < args.length) {
      serverpodArgs
        ..add(arg)
        ..add(args[index + 1]);
      index++;
      continue;
    }

    if (arg.startsWith('--mode=')) {
      serverpodArgs.add(arg);
      continue;
    }
  }

  if (serverpodArgs.contains('--mode') ||
      serverpodArgs.any((arg) => arg.startsWith('--mode='))) {
    return serverpodArgs;
  }

  return [...serverpodArgs, '--mode', ServerpodRunMode.development];
}

void _printSummary(LoadTestSeedSummary summary) {
  final payload = JsonEncoder.withIndent('  ').convert(summary.toJson());
  stdout.writeln('Load-test dataset is ready.');
  stdout.writeln(payload);
}

void _printUsage() {
  stdout.writeln('''
Generate load-test data for praxis_server.

Options:
  --course-count=<int>        Number of generated courses. Default: 40
  --title-prefix=<string>     Prefix used to detect generated courses.
  --learner-email=<string>    Development learner account for authenticated runs.
  --learner-password=<string> Password for the development learner account.
  --mode=<name>               Serverpod mode. Defaults to development.
''');
}

class _ExitSignal implements Exception {
  final int code;

  const _ExitSignal(this.code);
}
