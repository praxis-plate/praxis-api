import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:praxis_server/src/generated/protocol.dart' as protocol;
import 'package:praxis_server/src/services/load_testing/load_test_metrics.dart';
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart';

import 'src/load_testing/in_memory_auth_success_storage.dart';
import 'src/load_testing/load_test_config.dart';
import 'src/load_testing/praxis_load_test_client.dart';

Future<void> main(List<String> args) async {
  late final LoadTestConfig config;

  try {
    config = LoadTestConfig.parse(args);
  } on LoadTestHelpSignal {
    _printUsage();
    return;
  }

  final client = LoadTestClient(config.host);
  final authSessionManager = ClientAuthSessionManager(
    storage: InMemoryAuthSuccessStorage(),
  );
  client.authSessionManager = authSessionManager;

  if (config.authenticate) {
    final authSuccess = await client.emailIdp.login(
      email: config.learnerEmail,
      password: config.learnerPassword,
    );
    await client.auth.updateSignedInUser(authSuccess);
  }

  final fixture = await _loadFixture(client, config);
  await _warmup(client, config, fixture);

  final scenarioExecutors = _buildScenarios(client, config, fixture);
  final scenarioRecorders = {
    for (final name in scenarioExecutors.keys)
      name: LoadTestScenarioRecorder(name),
  };

  final plan = <String>[
    for (final scenarioName in config.scenarioNames)
      for (var i = 0; i < config.requestsPerScenario; i++) scenarioName,
  ]..shuffle(Random(config.shuffleSeed));

  final overallRecorder = LoadTestScenarioRecorder('overall');
  var nextIndex = 0;
  final scenarioStopwatch = Stopwatch()..start();

  await Future.wait(
    List.generate(
      config.parallelClients,
      (_) async {
        while (true) {
          final currentIndex = nextIndex++;
          if (currentIndex >= plan.length) {
            return;
          }

          final scenarioName = plan[currentIndex];
          final scenario = scenarioExecutors[scenarioName]!;
          final requestStopwatch = Stopwatch()..start();

          try {
            await scenario();
            requestStopwatch.stop();
            scenarioRecorders[scenarioName]!.recordSuccess(
              requestStopwatch.elapsed,
            );
            overallRecorder.recordSuccess(requestStopwatch.elapsed);
          } catch (error) {
            requestStopwatch.stop();
            scenarioRecorders[scenarioName]!.recordFailure(
              requestStopwatch.elapsed,
              error,
            );
            overallRecorder.recordFailure(requestStopwatch.elapsed, error);
          }
        }
      },
    ),
  );

  scenarioStopwatch.stop();

  final scenarioMetrics = {
    for (final entry in scenarioRecorders.entries)
      entry.key: entry.value.build(totalDuration: scenarioStopwatch.elapsed),
  };
  final overallMetrics = overallRecorder.build(
    totalDuration: scenarioStopwatch.elapsed,
  );

  _printReport(config, scenarioMetrics, overallMetrics);

  if (config.jsonOutputPath != null) {
    await File(config.jsonOutputPath!).writeAsString(
      const JsonEncoder.withIndent('  ').convert({
        'generatedAt': DateTime.now().toUtc().toIso8601String(),
        'config': {
          'host': config.host,
          'parallelClients': config.parallelClients,
          'requestsPerScenario': config.requestsPerScenario,
          'warmupRequests': config.warmupRequests,
          'courseFetchLimit': config.courseFetchLimit,
          'seedPrefix': config.seedPrefix,
          'authenticate': config.authenticate,
          'profile': config.profile.name,
          'totalPlannedRequests': config.totalPlannedRequests,
        },
        'fixture': fixture.toJson(),
        'scenarios': {
          for (final entry in scenarioMetrics.entries)
            entry.key: entry.value.toJson(),
        },
        'overall': overallMetrics.toJson(),
      }),
    );
  }
}

Future<_LoadTestFixture> _loadFixture(
  LoadTestClient client,
  LoadTestConfig config,
) async {
  final publishedCourses = await client.course.get(
    limit: config.courseFetchLimit,
    offset: 0,
  );
  final courses = [
    for (final course in publishedCourses)
      if (course.title.startsWith(config.seedPrefix)) course,
  ];

  if (courses.isEmpty) {
    throw StateError(
      'No published load-test courses found for prefix "${config.seedPrefix}". Run bin/generate_load_test_data.dart first.',
    );
  }

  final courseIds = [for (final course in courses) course.id];

  final structures = <protocol.CourseStructureDto>[];
  for (final course in courses) {
    structures.add(await client.course.getTableOfContents(course.id));
  }

  final lessonIds = <int>[];
  for (final structure in structures) {
    for (final module in structure.modules) {
      for (final lesson in module.lessons) {
        lessonIds.add(lesson.id);
      }
    }
  }

  if (lessonIds.isEmpty) {
    throw StateError('No lesson ids were discovered in generated courses.');
  }

  final sampledLessonIds = lessonIds.take(min(40, lessonIds.length)).toList();
  final taskCandidates = <_TaskCandidate>[];
  for (final lessonId in sampledLessonIds) {
    final tasks = await client.task.getByLessonId(lessonId);
    for (final task in tasks) {
      taskCandidates.add(
        _TaskCandidate(
          taskId: task.id,
          lessonId: lessonId,
          correctAnswer: task.correctAnswer,
        ),
      );
    }
  }

  if (taskCandidates.isEmpty) {
    throw StateError('No tasks were discovered in generated lessons.');
  }

  return _LoadTestFixture(
    courseIds: courseIds,
    lessonIds: lessonIds,
    taskCandidates: taskCandidates,
  );
}

Future<void> _warmup(
  LoadTestClient client,
  LoadTestConfig config,
  _LoadTestFixture fixture,
) async {
  if (config.warmupRequests <= 0) {
    return;
  }

  final scenarios = _buildScenarios(client, config, fixture);
  for (final entry in scenarios.entries) {
    for (var i = 0; i < config.warmupRequests; i++) {
      await entry.value();
    }
  }
}

Map<String, Future<void> Function()> _buildScenarios(
  LoadTestClient client,
  LoadTestConfig config,
  _LoadTestFixture fixture,
) {
  final courseIdPicker = _RoundRobinPicker(fixture.courseIds);
  final lessonIdPicker = _RoundRobinPicker(fixture.lessonIds);
  final taskPicker = _RoundRobinPicker(fixture.taskCandidates);

  return {
    'health.ping': () async {
      await client.health.ping();
    },
    'course.get': () async {
      await client.course.get(
        limit: min(50, config.courseFetchLimit),
        offset: 0,
      );
    },
    'course.getTableOfContents': () async {
      await client.course.getTableOfContents(courseIdPicker.next());
    },
    'task.getByLessonId': () async {
      await client.task.getByLessonId(lessonIdPicker.next());
    },
    'task.answer': () async {
      final candidate = taskPicker.next();
      await client.task.answer(candidate.taskId, candidate.correctAnswer);
    },
  };
}

void _printReport(
  LoadTestConfig config,
  Map<String, LoadTestScenarioMetrics> scenarioMetrics,
  LoadTestScenarioMetrics overallMetrics,
) {
  stdout.writeln('Load test profile');
  stdout.writeln('  host: ${config.host}');
  stdout.writeln('  profile: ${config.profile.name}');
  stdout.writeln('  parallel clients: ${config.parallelClients}');
  stdout.writeln('  requests per scenario: ${config.requestsPerScenario}');
  stdout.writeln('  total planned requests: ${config.totalPlannedRequests}');
  stdout.writeln('  authenticate: ${config.authenticate}');
  stdout.writeln('  seed prefix: ${config.seedPrefix}');
  stdout.writeln('');

  for (final scenarioName in config.scenarioNames) {
    final metrics = scenarioMetrics[scenarioName]!;
    _printMetrics(metrics);
  }

  stdout.writeln('Overall');
  _printMetrics(overallMetrics, indent: '  ');
}

void _printMetrics(
  LoadTestScenarioMetrics metrics, {
  String indent = '',
}) {
  stdout.writeln('$indent${metrics.scenario}');
  stdout.writeln(
    '$indent  requests: total=${metrics.totalRequests}, success=${metrics.successCount}, error=${metrics.errorCount}, errorRate=${metrics.errorRatePercent.toStringAsFixed(2)}%',
  );
  stdout.writeln(
    '$indent  latency(ms): min=${metrics.minMs.toStringAsFixed(2)}, mean=${metrics.meanMs.toStringAsFixed(2)}, p50=${metrics.p50Ms.toStringAsFixed(2)}, p95=${metrics.p95Ms.toStringAsFixed(2)}, max=${metrics.maxMs.toStringAsFixed(2)}',
  );
  stdout.writeln(
    '$indent  throughput: duration=${metrics.totalDurationMs} ms, rps=${metrics.requestsPerSecond.toStringAsFixed(2)}',
  );
  if (metrics.errorKinds.isNotEmpty) {
    final topErrors = metrics.errorKinds.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    stdout.writeln(
      '$indent  errors: ${topErrors.take(3).map((entry) => '${entry.value}x ${entry.key}').join('; ')}',
    );
  }
  stdout.writeln('');
}

void _printUsage() {
  stdout.writeln('''
Run load tests against the Praxis Serverpod API server.

Options:
  --host=<url>                    API server host. Default: http://127.0.0.1:8080/
  --clients=<int>                 Parallel clients. Default: 20
  --requests-per-scenario=<int>   Requests executed for each scenario. Default: 250
  --warmup-requests=<int>         Warmup requests per scenario. Default: 1
  --course-fetch-limit=<int>      Published courses fetched during fixture discovery. Default: 500
  --seed-prefix=<string>          Prefix of generated load-test courses.
  --authenticate=<bool>           Whether to sign in the synthetic learner. Default: true
  --learner-email=<string>        Learner login email for authenticated runs.
  --learner-password=<string>     Learner login password for authenticated runs.
  --profile=<mixed|read|answer>   Scenario profile. Default: mixed
  --shuffle-seed=<int>            Shuffle seed for reproducible mixed plans. Default: 42
  --json-out=<path>               Optional path for structured JSON results.
''');
}

class _LoadTestFixture {
  final List<int> courseIds;
  final List<int> lessonIds;
  final List<_TaskCandidate> taskCandidates;

  const _LoadTestFixture({
    required this.courseIds,
    required this.lessonIds,
    required this.taskCandidates,
  });

  Map<String, dynamic> toJson() {
    return {
      'courseCount': courseIds.length,
      'lessonCount': lessonIds.length,
      'taskCandidateCount': taskCandidates.length,
      'sampleCourseIds': courseIds.take(5).toList(),
      'sampleLessonIds': lessonIds.take(5).toList(),
      'sampleTaskIds': taskCandidates
          .map((task) => task.taskId)
          .take(5)
          .toList(),
    };
  }
}

class _TaskCandidate {
  final int taskId;
  final int lessonId;
  final String correctAnswer;

  const _TaskCandidate({
    required this.taskId,
    required this.lessonId,
    required this.correctAnswer,
  });
}

class _RoundRobinPicker<T> {
  final List<T> _items;
  int _index = 0;

  _RoundRobinPicker(List<T> items) : _items = List<T>.unmodifiable(items);

  T next() {
    final value = _items[_index % _items.length];
    _index++;
    return value;
  }
}
