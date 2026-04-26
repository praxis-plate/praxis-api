enum LoadTestProfile {
  mixed,
  read,
  answer
  ;

  static LoadTestProfile parse(String value) {
    return LoadTestProfile.values.firstWhere(
      (profile) => profile.name == value,
      orElse: () => throw ArgumentError.value(value, 'profile'),
    );
  }
}

class LoadTestConfig {
  final String host;
  final int parallelClients;
  final int requestsPerScenario;
  final int warmupRequests;
  final int courseFetchLimit;
  final String seedPrefix;
  final bool authenticate;
  final String learnerEmail;
  final String learnerPassword;
  final LoadTestProfile profile;
  final int shuffleSeed;
  final String? jsonOutputPath;

  const LoadTestConfig({
    this.host = 'http://127.0.0.1:8080/',
    this.parallelClients = 20,
    this.requestsPerScenario = 250,
    this.warmupRequests = 1,
    this.courseFetchLimit = 500,
    this.seedPrefix = '[LoadTest] Course',
    this.authenticate = true,
    this.learnerEmail = 'loadtest.learner@praxis.local',
    this.learnerPassword = 'LoadTest123!',
    this.profile = LoadTestProfile.mixed,
    this.shuffleSeed = 42,
    this.jsonOutputPath,
  });

  int get totalPlannedRequests {
    return requestsPerScenario * scenarioNames.length;
  }

  List<String> get scenarioNames {
    switch (profile) {
      case LoadTestProfile.read:
        return const [
          'health.ping',
          'course.get',
          'course.getTableOfContents',
          'task.getByLessonId',
        ];
      case LoadTestProfile.answer:
        return const ['task.answer'];
      case LoadTestProfile.mixed:
        return const [
          'health.ping',
          'course.get',
          'course.getTableOfContents',
          'task.getByLessonId',
          'task.answer',
        ];
    }
  }

  static LoadTestConfig parse(List<String> args) {
    var config = const LoadTestConfig();

    for (final arg in args) {
      if (arg == '--help' || arg == '-h') {
        throw const LoadTestHelpSignal();
      }
      if (arg.startsWith('--host=')) {
        config = config._copyWith(host: arg.split('=').last);
        continue;
      }
      if (arg.startsWith('--clients=')) {
        config = config._copyWith(
          parallelClients: int.parse(arg.split('=').last),
        );
        continue;
      }
      if (arg.startsWith('--requests-per-scenario=')) {
        config = config._copyWith(
          requestsPerScenario: int.parse(arg.split('=').last),
        );
        continue;
      }
      if (arg.startsWith('--warmup-requests=')) {
        config = config._copyWith(
          warmupRequests: int.parse(arg.split('=').last),
        );
        continue;
      }
      if (arg.startsWith('--course-fetch-limit=')) {
        config = config._copyWith(
          courseFetchLimit: int.parse(arg.split('=').last),
        );
        continue;
      }
      if (arg.startsWith('--seed-prefix=')) {
        config = config._copyWith(seedPrefix: arg.split('=').last);
        continue;
      }
      if (arg.startsWith('--authenticate=')) {
        config = config._copyWith(
          authenticate: _parseBool(arg.split('=').last),
        );
        continue;
      }
      if (arg.startsWith('--learner-email=')) {
        config = config._copyWith(learnerEmail: arg.split('=').last);
        continue;
      }
      if (arg.startsWith('--learner-password=')) {
        config = config._copyWith(learnerPassword: arg.split('=').last);
        continue;
      }
      if (arg.startsWith('--profile=')) {
        config = config._copyWith(
          profile: LoadTestProfile.parse(arg.split('=').last),
        );
        continue;
      }
      if (arg.startsWith('--shuffle-seed=')) {
        config = config._copyWith(shuffleSeed: int.parse(arg.split('=').last));
        continue;
      }
      if (arg.startsWith('--json-out=')) {
        config = config._copyWith(jsonOutputPath: arg.split('=').last);
      }
    }

    if (config.parallelClients < 1) {
      throw ArgumentError.value(config.parallelClients, 'parallelClients');
    }
    if (config.requestsPerScenario < 1) {
      throw ArgumentError.value(
        config.requestsPerScenario,
        'requestsPerScenario',
      );
    }
    if (config.courseFetchLimit < 1) {
      throw ArgumentError.value(config.courseFetchLimit, 'courseFetchLimit');
    }

    return config;
  }

  LoadTestConfig _copyWith({
    String? host,
    int? parallelClients,
    int? requestsPerScenario,
    int? warmupRequests,
    int? courseFetchLimit,
    String? seedPrefix,
    bool? authenticate,
    String? learnerEmail,
    String? learnerPassword,
    LoadTestProfile? profile,
    int? shuffleSeed,
    Object? jsonOutputPath = _undefined,
  }) {
    return LoadTestConfig(
      host: host ?? this.host,
      parallelClients: parallelClients ?? this.parallelClients,
      requestsPerScenario: requestsPerScenario ?? this.requestsPerScenario,
      warmupRequests: warmupRequests ?? this.warmupRequests,
      courseFetchLimit: courseFetchLimit ?? this.courseFetchLimit,
      seedPrefix: seedPrefix ?? this.seedPrefix,
      authenticate: authenticate ?? this.authenticate,
      learnerEmail: learnerEmail ?? this.learnerEmail,
      learnerPassword: learnerPassword ?? this.learnerPassword,
      profile: profile ?? this.profile,
      shuffleSeed: shuffleSeed ?? this.shuffleSeed,
      jsonOutputPath: jsonOutputPath == _undefined
          ? this.jsonOutputPath
          : jsonOutputPath as String?,
    );
  }
}

const _undefined = Object();

bool _parseBool(String value) {
  switch (value.toLowerCase()) {
    case 'true':
    case '1':
    case 'yes':
      return true;
    case 'false':
    case '0':
    case 'no':
      return false;
    default:
      throw ArgumentError.value(value, 'authenticate');
  }
}

class LoadTestHelpSignal implements Exception {
  const LoadTestHelpSignal();
}
