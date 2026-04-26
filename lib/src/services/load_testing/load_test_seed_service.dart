import 'dart:convert';

import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/task_option_data_source.dart';
import 'package:praxis_server/src/datasources/task_test_case_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/load_testing/load_test_seed_models.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

class LoadTestSeedService {
  final CourseDataSource _courseDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonDataSource _lessonDataSource;
  final TaskDataSource _taskDataSource;
  final TaskOptionDataSource _taskOptionDataSource;
  final TaskTestCaseDataSource _taskTestCaseDataSource;

  const LoadTestSeedService({
    required CourseDataSource courseDataSource,
    required ModuleDataSource moduleDataSource,
    required LessonDataSource lessonDataSource,
    required TaskDataSource taskDataSource,
    required TaskOptionDataSource taskOptionDataSource,
    required TaskTestCaseDataSource taskTestCaseDataSource,
  }) : _courseDataSource = courseDataSource,
       _moduleDataSource = moduleDataSource,
       _lessonDataSource = lessonDataSource,
       _taskDataSource = taskDataSource,
       _taskOptionDataSource = taskOptionDataSource,
       _taskTestCaseDataSource = taskTestCaseDataSource;

  Future<LoadTestSeedSummary> ensureData(
    Serverpod pod, {
    required EmailIdpConfig emailIdpConfig,
    LoadTestSeedConfig config = const LoadTestSeedConfig(),
  }) async {
    if (!_shouldSeedForRunMode(pod.runMode)) {
      throw StateError(
        'Load-test data generation is supported only in development or test mode.',
      );
    }
    if (config.courseCount < 1) {
      throw ArgumentError.value(config.courseCount, 'courseCount');
    }

    final session = await pod.createSession(enableLogging: false);
    try {
      final existingCourses = await _courseDataSource.listByTitlePrefix(
        session,
        config.courseTitlePrefix,
      );
      final existingIndexes = existingCourses
          .map((course) => _extractCourseIndex(course.title))
          .whereType<int>()
          .toSet();

      final missingIndexes = <int>[];
      for (var index = 1; index <= config.courseCount; index++) {
        if (!existingIndexes.contains(index)) {
          missingIndexes.add(index);
        }
      }

      await session.db.transaction((transaction) async {
        for (final courseIndex in missingIndexes) {
          await _createCourseGraph(
            session,
            courseIndex: courseIndex,
            config: config,
            transaction: transaction,
          );
        }

        await _ensureLearnerAccount(
          pod,
          session,
          emailIdpConfig: emailIdpConfig,
          config: config,
          transaction: transaction,
        );
      });

      final seededCourses = await _courseDataSource.listByTitlePrefix(
        session,
        config.courseTitlePrefix,
      );
      final seededCourseIds = seededCourses
          .map((course) => course.id!)
          .toList();
      final modules = await _moduleDataSource.listByCourseIds(
        session,
        seededCourseIds,
      );
      final lessons = await _lessonDataSource.listByModuleIds(
        session,
        modules.map((module) => module.id!).toList(),
      );
      final tasks = await _taskDataSource.listByLessonIds(
        session,
        lessons.map((lesson) => lesson.id!).toList(),
      );

      return LoadTestSeedSummary(
        courseTitlePrefix: config.courseTitlePrefix,
        requestedCourseCount: config.courseCount,
        createdCourseCount: missingIndexes.length,
        totalCourseCount: seededCourses.length,
        totalModuleCount: modules.length,
        totalLessonCount: lessons.length,
        totalTaskCount: tasks.length,
        sampleCourseIds: seededCourseIds.take(5).toList(),
        sampleLessonIds: lessons.map((lesson) => lesson.id!).take(5).toList(),
        sampleTaskIds: tasks.map((task) => task.id!).take(5).toList(),
        learnerEmail: config.learnerEmail,
        learnerPassword: config.learnerPassword,
      );
    } finally {
      await session.close();
    }
  }

  Future<void> _createCourseGraph(
    Session session, {
    required int courseIndex,
    required LoadTestSeedConfig config,
    required Transaction transaction,
  }) async {
    final category = _categories[(courseIndex - 1) % _categories.length];
    final moduleCount = 4 + ((courseIndex - 1) % 3);
    var totalDurationMinutes = 0;
    final now = DateTime.utc(2026, 1, 1).add(Duration(days: courseIndex));

    for (var moduleIndex = 1; moduleIndex <= moduleCount; moduleIndex++) {
      totalDurationMinutes += _lessonsInModule(courseIndex, moduleIndex) * 15;
    }

    final course = await _courseDataSource.insert(
      session,
      title:
          '${config.courseTitlePrefix} ${courseIndex.toString().padLeft(3, '0')}',
      description:
          'Synthetic dataset for repeatable load testing of Praxis server scenarios.',
      author: 'Praxis Load Test Generator',
      category: category,
      priceInCoins: 50 + ((courseIndex - 1) % 5) * 25,
      durationMinutes: totalDurationMinutes,
      rating: 4.0 + ((courseIndex - 1) % 8) * 0.1,
      thumbnailUrl: null,
      coverImage: null,
      createdAt: now,
      updatedAt: now,
      contentStatus: ContentStatus.published,
      publishedAt: now,
      transaction: transaction,
    );

    for (var moduleIndex = 1; moduleIndex <= moduleCount; moduleIndex++) {
      final module = await _moduleDataSource.insert(
        session,
        courseId: course.id!,
        title: 'Module $moduleIndex: $category Track',
        description:
            'Generated module $moduleIndex for load-test course ${course.id}.',
        orderIndex: moduleIndex - 1,
        createdAt: now,
        updatedAt: now,
        transaction: transaction,
      );

      final lessonCount = _lessonsInModule(courseIndex, moduleIndex);
      for (var lessonIndex = 1; lessonIndex <= lessonCount; lessonIndex++) {
        final lesson = await _lessonDataSource.insert(
          session,
          moduleId: module.id!,
          title:
              'Lesson $lessonIndex: ${_lessonTopic(courseIndex, moduleIndex, lessonIndex)}',
          contentText:
              'This lesson is part of the generated load-test fixture and provides stable synthetic content.',
          videoUrl: null,
          imageUrls: null,
          orderIndex: lessonIndex - 1,
          durationMinutes:
              10 + ((courseIndex + moduleIndex + lessonIndex) % 4) * 5,
          createdAt: now,
          updatedAt: now,
          transaction: transaction,
        );

        final taskCount = _tasksInLesson(courseIndex, moduleIndex, lessonIndex);
        for (var taskIndex = 1; taskIndex <= taskCount; taskIndex++) {
          await _createTask(
            session,
            lessonId: lesson.id!,
            courseIndex: courseIndex,
            moduleIndex: moduleIndex,
            lessonIndex: lessonIndex,
            taskIndex: taskIndex,
            topic:
                '$category-${_lessonTopic(courseIndex, moduleIndex, lessonIndex)}',
            now: now,
            transaction: transaction,
          );
        }
      }
    }
  }

  Future<void> _createTask(
    Session session, {
    required int lessonId,
    required int courseIndex,
    required int moduleIndex,
    required int lessonIndex,
    required int taskIndex,
    required String topic,
    required DateTime now,
    required Transaction transaction,
  }) async {
    final taskType =
        TaskType.values[(courseIndex + moduleIndex + lessonIndex + taskIndex) %
            TaskType.values.length];
    final taskSeed = _buildTaskSeed(
      taskType: taskType,
      courseIndex: courseIndex,
      moduleIndex: moduleIndex,
      lessonIndex: lessonIndex,
      taskIndex: taskIndex,
      topic: topic,
    );

    final task = await _taskDataSource.insert(
      session,
      lessonId: lessonId,
      taskType: taskType,
      questionText: taskSeed.questionText,
      correctAnswer: taskSeed.correctAnswer,
      optionsJson: taskSeed.optionsJson,
      codeTemplate: taskSeed.codeTemplate,
      testCasesJson: taskSeed.testCasesJson,
      programmingLanguage: taskSeed.programmingLanguage,
      difficultyLevel: taskSeed.difficultyLevel,
      xpValue: taskSeed.xpValue,
      orderIndex: taskIndex - 1,
      fallbackHint: taskSeed.fallbackHint,
      fallbackExplanation: taskSeed.fallbackExplanation,
      topic: topic.toLowerCase(),
      createdAt: now,
      updatedAt: now,
      transaction: transaction,
    );

    for (var index = 0; index < taskSeed.options.length; index++) {
      final option = taskSeed.options[index];
      await _taskOptionDataSource.insert(
        session,
        taskId: task.id!,
        optionText: option,
        isCorrect: _isCorrectOption(taskType, taskSeed.correctAnswer, option),
        orderIndex: index,
        updatedAt: now,
        transaction: transaction,
      );
    }

    for (var index = 0; index < taskSeed.testCases.length; index++) {
      final testCase = taskSeed.testCases[index];
      await _taskTestCaseDataSource.insert(
        session,
        taskId: task.id!,
        input: testCase.input,
        expectedOutput: testCase.expectedOutput,
        isHidden: testCase.isHidden,
        orderIndex: index,
        updatedAt: now,
        transaction: transaction,
      );
    }
  }

  _GeneratedTaskSeed _buildTaskSeed({
    required TaskType taskType,
    required int courseIndex,
    required int moduleIndex,
    required int lessonIndex,
    required int taskIndex,
    required String topic,
  }) {
    final stem = 'C$courseIndex-M$moduleIndex-L$lessonIndex-T$taskIndex';

    switch (taskType) {
      case TaskType.multipleChoice:
        return _GeneratedTaskSeed(
          questionText: 'Which answer matches synthetic topic $stem?',
          correctAnswer: 'Option B',
          optionsJson: jsonEncode(const [
            'Option A',
            'Option B',
            'Option C',
            'Option D',
          ]),
          options: const ['Option A', 'Option B', 'Option C', 'Option D'],
          codeTemplate: null,
          testCasesJson: null,
          testCases: const [],
          programmingLanguage: null,
          difficultyLevel: 1 + ((courseIndex + taskIndex) % 3),
          xpValue: 10 + (taskIndex % 3) * 5,
          fallbackHint: 'Choose the option marked as the generated target.',
          fallbackExplanation:
              'Option B is the canonical answer for generated multiple-choice tasks.',
        );
      case TaskType.multipleAnswer:
        return _GeneratedTaskSeed(
          questionText: 'Select all generated answers that match topic $stem.',
          correctAnswer: jsonEncode(const ['Option B', 'Option D']),
          optionsJson: jsonEncode(const [
            'Option A',
            'Option B',
            'Option C',
            'Option D',
          ]),
          options: const ['Option A', 'Option B', 'Option C', 'Option D'],
          codeTemplate: null,
          testCasesJson: null,
          testCases: const [],
          programmingLanguage: null,
          difficultyLevel: 2,
          xpValue: 15,
          fallbackHint:
              'Choose every generated option that is marked as correct.',
          fallbackExplanation:
              'Options B and D are the canonical answers for generated multiple-answer tasks.',
        );
      case TaskType.codeCompletion:
        final expectedCode =
            'var value$stem = ${courseIndex + moduleIndex + lessonIndex + taskIndex};';
        return _GeneratedTaskSeed(
          questionText: 'Complete the generated Dart assignment for $stem.',
          correctAnswer: expectedCode,
          optionsJson: null,
          options: const [],
          codeTemplate: 'var value$stem = ___;',
          testCasesJson: jsonEncode([
            {'input': stem, 'expectedOutput': expectedCode},
          ]),
          testCases: [
            _GeneratedTestCase(
              input: stem,
              expectedOutput: expectedCode,
              isHidden: false,
            ),
            _GeneratedTestCase(
              input: '$stem-hidden',
              expectedOutput: expectedCode,
              isHidden: true,
            ),
          ],
          programmingLanguage: 'dart',
          difficultyLevel: 2 + ((lessonIndex + taskIndex) % 2),
          xpValue: 15 + (taskIndex % 2) * 5,
          fallbackHint: 'Match the exact generated assignment structure.',
          fallbackExplanation:
              'Whitespace is ignored, but the generated variable name and value must match.',
        );
      case TaskType.matching:
        final matches = {
          '$topic left 1': '$stem right 1',
          '$topic left 2': '$stem right 2',
          '$topic left 3': '$stem right 3',
        };
        return _GeneratedTaskSeed(
          questionText: 'Match generated pairs for $stem.',
          correctAnswer: jsonEncode(matches),
          optionsJson: jsonEncode({
            'pairs': matches.entries
                .map(
                  (entry) => {
                    'left': entry.key,
                    'right': entry.value,
                  },
                )
                .toList(),
          }),
          options: const [],
          codeTemplate: null,
          testCasesJson: null,
          testCases: const [],
          programmingLanguage: null,
          difficultyLevel: 2,
          xpValue: 15,
          fallbackHint: 'Keep each generated left/right pair together.',
          fallbackExplanation:
              'Every generated left key must be mapped to its exact right value.',
        );
      case TaskType.textInput:
        final answer = 'answer-$stem'.toLowerCase();
        return _GeneratedTaskSeed(
          questionText: 'Type the generated token for $stem.',
          correctAnswer: answer,
          optionsJson: jsonEncode({
            'caseSensitive': false,
            'exactMatch': true,
            'acceptableAnswers': ['Answer-$stem'],
          }),
          options: const [],
          codeTemplate: null,
          testCasesJson: null,
          testCases: const [],
          programmingLanguage: null,
          difficultyLevel: 1 + (taskIndex % 2),
          xpValue: 10,
          fallbackHint: 'Use the generated answer token exactly once.',
          fallbackExplanation:
              'The accepted answer is the generated token for this task identifier.',
        );
    }
  }

  bool _isCorrectOption(
    TaskType taskType,
    String correctAnswer,
    String optionText,
  ) {
    if (taskType == TaskType.multipleChoice) {
      return optionText == correctAnswer;
    }
    if (taskType != TaskType.multipleAnswer) {
      return false;
    }

    try {
      final decoded = jsonDecode(correctAnswer);
      if (decoded is! List) {
        return false;
      }

      return decoded.whereType<String>().contains(optionText);
    } catch (_) {
      return false;
    }
  }

  Future<void> _ensureLearnerAccount(
    Serverpod pod,
    Session session, {
    required EmailIdpConfig emailIdpConfig,
    required LoadTestSeedConfig config,
    required Transaction transaction,
  }) async {
    final admin = EmailIdpAdmin(
      utils: EmailIdpUtils(config: emailIdpConfig),
    );
    final existingAccount = await admin.findAccount(
      session,
      email: config.learnerEmail,
      transaction: transaction,
    );

    if (existingAccount == null) {
      final authUser = await const AuthUsers().create(
        session,
        transaction: transaction,
      );
      await pod.server.services.accessControlService
          .initializeRolesForNewAccount(
            session,
            authUserId: authUser.id,
            email: config.learnerEmail,
            transaction: transaction,
          );
      await pod.server.services.walletService.initializeBalance(
        session,
        authUserId: authUser.id,
      );
      await pod.server.services.userStatisticsService.ensureStatistics(
        session,
        authUserId: authUser.id,
        transaction: transaction,
      );
      await admin.createEmailAuthentication(
        session,
        authUserId: authUser.id,
        email: config.learnerEmail,
        password: config.learnerPassword,
        transaction: transaction,
      );
      return;
    }

    final accessProfile = await pod.server.services.accessControlService
        .getAccessProfile(
          session,
          authUserId: existingAccount.authUserId,
          transaction: transaction,
        );
    if (!accessProfile.roles.contains(UserRole.learner)) {
      await pod.server.services.accessControlService.assignRole(
        session,
        authUserId: existingAccount.authUserId,
        role: UserRole.learner,
        transaction: transaction,
      );
    }

    await pod.server.services.walletService.initializeBalance(
      session,
      authUserId: existingAccount.authUserId,
    );
    await pod.server.services.userStatisticsService.ensureStatistics(
      session,
      authUserId: existingAccount.authUserId,
      transaction: transaction,
    );
    await admin.setPassword(
      session,
      email: config.learnerEmail,
      password: config.learnerPassword,
      transaction: transaction,
    );
  }

  int _lessonsInModule(int courseIndex, int moduleIndex) {
    return 5 + ((courseIndex + moduleIndex) % 6);
  }

  int _tasksInLesson(int courseIndex, int moduleIndex, int lessonIndex) {
    return 3 + ((courseIndex + moduleIndex + lessonIndex) % 3);
  }

  String _lessonTopic(int courseIndex, int moduleIndex, int lessonIndex) {
    return 'Segment ${((courseIndex + moduleIndex + lessonIndex) % 12) + 1}';
  }

  int? _extractCourseIndex(String title) {
    final match = RegExp(r'(\d+)$').firstMatch(title);
    if (match == null) {
      return null;
    }
    return int.tryParse(match.group(1)!);
  }

  bool _shouldSeedForRunMode(String runMode) {
    return runMode == ServerpodRunMode.development ||
        runMode == ServerpodRunMode.test;
  }
}

const _categories = [
  'Dart',
  'Flutter',
  'Backend',
  'Databases',
  'Algorithms',
];

class _GeneratedTaskSeed {
  final String questionText;
  final String correctAnswer;
  final String? optionsJson;
  final List<String> options;
  final String? codeTemplate;
  final String? testCasesJson;
  final List<_GeneratedTestCase> testCases;
  final String? programmingLanguage;
  final int difficultyLevel;
  final int xpValue;
  final String fallbackHint;
  final String fallbackExplanation;

  const _GeneratedTaskSeed({
    required this.questionText,
    required this.correctAnswer,
    required this.optionsJson,
    required this.options,
    required this.codeTemplate,
    required this.testCasesJson,
    required this.testCases,
    required this.programmingLanguage,
    required this.difficultyLevel,
    required this.xpValue,
    required this.fallbackHint,
    required this.fallbackExplanation,
  });
}

class _GeneratedTestCase {
  final String input;
  final String expectedOutput;
  final bool isHidden;

  const _GeneratedTestCase({
    required this.input,
    required this.expectedOutput,
    required this.isHidden,
  });
}
