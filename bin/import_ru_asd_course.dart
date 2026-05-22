import 'dart:convert';
import 'dart:io';

import 'package:praxis_server/src/bootstrap/praxis_serverpod_context.dart';
import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/task_option_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

const _defaultCourseTitle = 'Алгоритмы и структуры данных на C++';
const _defaultSourceDir = '../course-ru';
const _courseDescription =
    'Русскоязычный демонстрационный курс по алгоритмам и структурам данных: теория, примеры на C++ и практические задания по ключевым темам.';

Future<void> main(List<String> args) async {
  try {
    final config = _parseConfig(args);
    final context = createPraxisServerpod(_serverpodArgs(args));

    try {
      final importer = _RussianAsdCourseImporter(
        courseDataSource: const CourseDataSource(),
        moduleDataSource: const ModuleDataSource(),
        lessonDataSource: const LessonDataSource(),
        taskDataSource: const TaskDataSource(),
        taskOptionDataSource: const TaskOptionDataSource(),
      );

      final summary = await importer.importCourse(context.pod, config);
      stdout.writeln('Russian ASD demo course import completed.');
      stdout.writeln(const JsonEncoder.withIndent('  ').convert(summary));
    } finally {
      await context.pod.shutdown(exitProcess: false);
    }
  } on _ExitSignal catch (signal) {
    if (signal.code != 0) {
      rethrow;
    }
  }
}

class _RussianAsdCourseImporter {
  final CourseDataSource _courseDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonDataSource _lessonDataSource;
  final TaskDataSource _taskDataSource;
  final TaskOptionDataSource _taskOptionDataSource;

  const _RussianAsdCourseImporter({
    required CourseDataSource courseDataSource,
    required ModuleDataSource moduleDataSource,
    required LessonDataSource lessonDataSource,
    required TaskDataSource taskDataSource,
    required TaskOptionDataSource taskOptionDataSource,
  }) : _courseDataSource = courseDataSource,
       _moduleDataSource = moduleDataSource,
       _lessonDataSource = lessonDataSource,
       _taskDataSource = taskDataSource,
       _taskOptionDataSource = taskOptionDataSource;

  Future<Map<String, Object?>> importCourse(
    Serverpod pod,
    _ImportConfig config,
  ) async {
    final sourceDir = Directory(config.sourceDir);
    if (!sourceDir.existsSync()) {
      throw StateError('Source directory not found: ${config.sourceDir}');
    }

    final labFiles = _findLabFiles(sourceDir);
    if (labFiles.isEmpty) {
      throw StateError('No lab markdown files found in ${config.sourceDir}');
    }

    final session = await pod.createSession(enableLogging: false);
    try {
      final existingCourses = await _courseDataSource.listByTitlePrefix(
        session,
        config.courseTitle,
      );
      if (config.verifyOnly) {
        if (existingCourses.isEmpty) {
          return {
            'verified': false,
            'reason': 'Course not found',
            'courseTitle': config.courseTitle,
            'sourceFiles': labFiles.length,
          };
        }

        return _verifyCourse(session, existingCourses.first);
      }

      if (existingCourses.isNotEmpty && !config.allowDuplicate) {
        if (config.refreshExisting) {
          return _refreshCourse(
            session,
            existingCourses.first,
            labFiles,
            config,
          );
        }

        return {
          'created': false,
          'reason': 'Course already exists',
          'courseId': existingCourses.first.id,
          'courseTitle': existingCourses.first.title,
          'sourceFiles': labFiles.length,
        };
      }

      late final Course course;
      final createdModuleIds = <int>[];
      final createdLessonIds = <int>[];
      final createdTaskIds = <int>[];

      await session.db.transaction((transaction) async {
        final now = DateTime.now();
        course = await _courseDataSource.insert(
          session,
          title: config.courseTitle,
          description: _courseDescription,
          author: 'Praxis',
          category: 'Алгоритмы',
          priceInCoins: config.priceInCoins,
          durationMinutes: labFiles.length * 45,
          rating: 4.8,
          createdAt: now,
          updatedAt: now,
          contentStatus: ContentStatus.published,
          publishedAt: now,
          transaction: transaction,
        );

        for (var index = 0; index < labFiles.length; index++) {
          final lab = _LabContent.fromFile(labFiles[index]);
          final module = await _moduleDataSource.insert(
            session,
            courseId: course.id!,
            title: lab.moduleTitle,
            description: lab.goal,
            orderIndex: index,
            createdAt: now,
            updatedAt: now,
            transaction: transaction,
          );
          createdModuleIds.add(module.id!);

          final lesson = await _lessonDataSource.insert(
            session,
            moduleId: module.id!,
            title: lab.lessonTitle,
            contentText: lab.markdown,
            orderIndex: 0,
            durationMinutes: lab.estimatedMinutes,
            completionXp: 0,
            createdAt: now,
            updatedAt: now,
            transaction: transaction,
          );
          createdLessonIds.add(lesson.id!);

          final taskIds = await _createLessonTasks(
            session,
            lessonId: lesson.id!,
            lab: lab,
            now: now,
            transaction: transaction,
          );
          createdTaskIds.addAll(taskIds);
        }
      });

      return {
        'created': true,
        'courseId': course.id,
        'courseTitle': course.title,
        'moduleCount': createdModuleIds.length,
        'lessonCount': createdLessonIds.length,
        'taskCount': createdTaskIds.length,
        'sourceFiles': labFiles.length,
      };
    } finally {
      await session.close();
    }
  }

  Future<Map<String, Object?>> _verifyCourse(
    Session session,
    Course course,
  ) async {
    final modules = await _moduleDataSource.listByCourseId(session, course.id!);
    final lessonTitles = <String>[];
    final taskQuestions = <String>[];
    final forbiddenMatches = <String>[];
    var lessonCount = 0;
    var taskCount = 0;
    var optionCount = 0;

    void scan(String scope, String? value) {
      final text = value?.trim();
      if (text == null || text.isEmpty) {
        return;
      }

      if (_forbiddenCourseArtifactPattern.hasMatch(text)) {
        forbiddenMatches.add('$scope: ${_clip(text)}');
      }
    }

    scan('course.title', course.title);
    scan('course.description', course.description);

    for (final module in modules) {
      scan('module.${module.id}.title', module.title);
      scan('module.${module.id}.description', module.description);

      final lessons = await _lessonDataSource.listByModuleId(
        session,
        module.id!,
      );
      lessonCount += lessons.length;

      for (final lesson in lessons) {
        lessonTitles.add(lesson.title);
        scan('lesson.${lesson.id}.title', lesson.title);
        scan('lesson.${lesson.id}.contentText', lesson.contentText);

        final tasks = await _taskDataSource.listByLessonId(
          session,
          lesson.id!,
        );
        taskCount += tasks.length;

        for (final task in tasks) {
          taskQuestions.add(task.questionText);
          scan('task.${task.id}.questionText', task.questionText);
          scan('task.${task.id}.correctAnswer', task.correctAnswer);
          scan('task.${task.id}.fallbackHint', task.fallbackHint);
          scan('task.${task.id}.fallbackExplanation', task.fallbackExplanation);

          final options = await _taskOptionDataSource.listByTaskId(
            session,
            task.id!,
          );
          optionCount += options.length;
          for (final option in options) {
            scan('taskOption.${option.id}.optionText', option.optionText);
          }
        }
      }
    }

    return {
      'verified': true,
      'courseId': course.id,
      'courseTitle': course.title,
      'courseDescription': course.description,
      'moduleCount': modules.length,
      'lessonCount': lessonCount,
      'taskCount': taskCount,
      'optionCount': optionCount,
      'moduleTitles': modules.map((module) => module.title).toList(),
      'lessonTitles': lessonTitles,
      'taskQuestions': taskQuestions,
      'forbiddenTermMatchesCount': forbiddenMatches.length,
      'forbiddenTermSamples': forbiddenMatches.take(10).toList(),
    };
  }

  Future<Map<String, Object?>> _refreshCourse(
    Session session,
    Course existingCourse,
    List<File> labFiles,
    _ImportConfig config,
  ) async {
    var updatedModuleCount = 0;
    var updatedLessonCount = 0;
    var updatedTaskCount = 0;

    await session.db.transaction((transaction) async {
      final now = DateTime.now();
      final course = await _courseDataSource.updateRow(
        session,
        existingCourse.copyWith(
          title: config.courseTitle,
          description: _courseDescription,
          priceInCoins: config.priceInCoins,
          durationMinutes: labFiles.length * 45,
          updatedAt: now,
          contentStatus: ContentStatus.published,
          publishedAt: existingCourse.publishedAt ?? now,
        ),
        transaction: transaction,
      );

      final modules = await _moduleDataSource.listByCourseId(
        session,
        course.id!,
        transaction: transaction,
      );

      for (var index = 0; index < labFiles.length; index++) {
        final lab = _LabContent.fromFile(labFiles[index]);
        final module = index < modules.length
            ? await _moduleDataSource.updateRow(
                session,
                modules[index].copyWith(
                  title: lab.moduleTitle,
                  description: lab.goal,
                  orderIndex: index,
                  updatedAt: now,
                ),
                transaction: transaction,
              )
            : await _moduleDataSource.insert(
                session,
                courseId: course.id!,
                title: lab.moduleTitle,
                description: lab.goal,
                orderIndex: index,
                createdAt: now,
                updatedAt: now,
                transaction: transaction,
              );
        updatedModuleCount++;

        final lessons = await _lessonDataSource.listByModuleId(
          session,
          module.id!,
          transaction: transaction,
        );
        final lesson = lessons.isNotEmpty
            ? await _lessonDataSource.updateRow(
                session,
                lessons.first.copyWith(
                  title: lab.lessonTitle,
                  contentText: lab.markdown,
                  orderIndex: 0,
                  durationMinutes: lab.estimatedMinutes,
                  updatedAt: now,
                ),
                transaction: transaction,
              )
            : await _lessonDataSource.insert(
                session,
                moduleId: module.id!,
                title: lab.lessonTitle,
                contentText: lab.markdown,
                orderIndex: 0,
                durationMinutes: lab.estimatedMinutes,
                completionXp: 0,
                createdAt: now,
                updatedAt: now,
                transaction: transaction,
              );
        updatedLessonCount++;

        updatedTaskCount += await _syncLessonTasks(
          session,
          lessonId: lesson.id!,
          lab: lab,
          now: now,
          transaction: transaction,
        );
      }
    });

    return {
      'created': false,
      'refreshed': true,
      'courseId': existingCourse.id,
      'courseTitle': config.courseTitle,
      'moduleCount': updatedModuleCount,
      'lessonCount': updatedLessonCount,
      'taskCount': updatedTaskCount,
      'sourceFiles': labFiles.length,
    };
  }

  List<File> _findLabFiles(Directory sourceDir) {
    final files =
        sourceDir
            .listSync(followLinks: false)
            .whereType<File>()
            .where((file) => file.path.toLowerCase().endsWith('.md'))
            .where((file) => _extractLabNumber(file.path) != null)
            .toList()
          ..sort(
            (a, b) => _extractLabNumber(a.path)!.compareTo(
              _extractLabNumber(b.path)!,
            ),
          );
    return files;
  }

  Future<List<int>> _createLessonTasks(
    Session session, {
    required int lessonId,
    required _LabContent lab,
    required DateTime now,
    required Transaction transaction,
  }) async {
    final tasks = <Task>[];
    final specs = _quizSpecsForLab(lab);
    for (var index = 0; index < specs.length; index++) {
      final spec = specs[index];
      tasks.add(
        await _createMultipleChoiceTask(
          session,
          lessonId: lessonId,
          spec: spec,
          topic: lab.topic,
          orderIndex: index,
          now: now,
          transaction: transaction,
        ),
      );
    }

    return tasks.map((task) => task.id!).toList();
  }

  Future<int> _syncLessonTasks(
    Session session, {
    required int lessonId,
    required _LabContent lab,
    required DateTime now,
    required Transaction transaction,
  }) async {
    final specs = _quizSpecsForLab(lab);
    final existingTasks = await _taskDataSource.listByLessonId(
      session,
      lessonId,
      transaction: transaction,
    );

    for (var index = 0; index < specs.length; index++) {
      final spec = specs[index];
      final task = index < existingTasks.length
          ? await _taskDataSource.updateRow(
              session,
              existingTasks[index].copyWith(
                lessonId: lessonId,
                taskType: TaskType.multipleChoice,
                questionText: spec.questionText,
                correctAnswer: spec.correctAnswer,
                optionsJson: jsonEncode(spec.options),
                codeTemplate: null,
                testCasesJson: null,
                programmingLanguage: null,
                difficultyLevel: spec.difficultyLevel,
                xpValue: spec.xpValue,
                orderIndex: index,
                fallbackHint: spec.hint,
                fallbackExplanation: spec.explanation,
                topic: lab.topic.toLowerCase(),
                updatedAt: now,
              ),
              transaction: transaction,
            )
          : await _createMultipleChoiceTask(
              session,
              lessonId: lessonId,
              spec: spec,
              topic: lab.topic,
              orderIndex: index,
              now: now,
              transaction: transaction,
            );
      await _syncTaskOptions(
        session,
        taskId: task.id!,
        spec: spec,
        now: now,
        transaction: transaction,
      );
    }

    if (existingTasks.length > specs.length) {
      final extraTaskIds = existingTasks
          .skip(specs.length)
          .map((task) => task.id!)
          .toSet();
      await _taskOptionDataSource.deleteByTaskIds(
        session,
        extraTaskIds,
        transaction: transaction,
      );
      await _taskDataSource.deleteByIds(
        session,
        extraTaskIds,
        transaction: transaction,
      );
    }

    return specs.length;
  }

  Future<Task> _createMultipleChoiceTask(
    Session session, {
    required int lessonId,
    required _QuizSpec spec,
    required String topic,
    required int orderIndex,
    required DateTime now,
    required Transaction transaction,
  }) async {
    final task = await _taskDataSource.insert(
      session,
      lessonId: lessonId,
      taskType: TaskType.multipleChoice,
      questionText: spec.questionText,
      correctAnswer: spec.correctAnswer,
      optionsJson: jsonEncode(spec.options),
      difficultyLevel: spec.difficultyLevel,
      xpValue: spec.xpValue,
      orderIndex: orderIndex,
      fallbackHint: spec.hint,
      fallbackExplanation: spec.explanation,
      topic: topic.toLowerCase(),
      createdAt: now,
      updatedAt: now,
      transaction: transaction,
    );

    await _syncTaskOptions(
      session,
      taskId: task.id!,
      spec: spec,
      now: now,
      transaction: transaction,
    );

    return task;
  }

  Future<void> _syncTaskOptions(
    Session session, {
    required int taskId,
    required _QuizSpec spec,
    required DateTime now,
    required Transaction transaction,
  }) async {
    final existingOptions = await _taskOptionDataSource.listByTaskId(
      session,
      taskId,
      transaction: transaction,
    );

    for (var index = 0; index < spec.options.length; index++) {
      final option = spec.options[index];
      if (index < existingOptions.length) {
        await _taskOptionDataSource.updateRow(
          session,
          existingOptions[index].copyWith(
            taskId: taskId,
            optionText: option,
            isCorrect: option == spec.correctAnswer,
            orderIndex: index,
            updatedAt: now,
          ),
          transaction: transaction,
        );
        continue;
      }

      await _taskOptionDataSource.insert(
        session,
        taskId: taskId,
        optionText: option,
        isCorrect: option == spec.correctAnswer,
        orderIndex: index,
        updatedAt: now,
        transaction: transaction,
      );
    }

    if (existingOptions.length > spec.options.length) {
      await _taskOptionDataSource.deleteByIds(
        session,
        existingOptions
            .skip(spec.options.length)
            .map((option) => option.id!)
            .toSet(),
        transaction: transaction,
      );
    }
  }
}

class _LabContent {
  final int number;
  final String topic;
  final String markdown;
  final String goal;

  const _LabContent({
    required this.number,
    required this.topic,
    required this.markdown,
    required this.goal,
  });

  String get moduleTitle => 'Раздел $number. $topic';

  String get lessonTitle => 'Теория и практика: $topic';

  int get estimatedMinutes {
    final words = markdown.split(RegExp(r'\s+')).where((word) {
      return word.trim().isNotEmpty;
    }).length;
    return (words / 180).ceil().clamp(15, 60);
  }

  factory _LabContent.fromFile(File file) {
    final raw = file.readAsStringSync();
    final number = _extractLabNumber(file.path) ?? 0;
    final topic = _normalizeTopicByLabNumber(
      number,
      _extractTopic(raw, file.path),
    );
    final markdown = _adaptMarkdownForCourse(raw, topic);
    final goal = _extractGoal(markdown) ?? 'Изучение темы "$topic".';
    return _LabContent(
      number: number,
      topic: topic,
      markdown: markdown,
      goal: goal,
    );
  }
}

class _QuizSpec {
  final String questionText;
  final String correctAnswer;
  final List<String> options;
  final String hint;
  final String explanation;
  final int difficultyLevel = 1;
  final int xpValue = 10;

  const _QuizSpec({
    required this.questionText,
    required this.correctAnswer,
    required this.options,
    required this.hint,
    required this.explanation,
  });
}

class _ImportConfig {
  final String sourceDir;
  final String courseTitle;
  final int priceInCoins;
  final bool allowDuplicate;
  final bool refreshExisting;
  final bool verifyOnly;

  const _ImportConfig({
    required this.sourceDir,
    required this.courseTitle,
    required this.priceInCoins,
    required this.allowDuplicate,
    required this.refreshExisting,
    required this.verifyOnly,
  });
}

_ImportConfig _parseConfig(List<String> args) {
  var sourceDir = _defaultSourceDir;
  var courseTitle = _defaultCourseTitle;
  var priceInCoins = 0;
  var allowDuplicate = false;
  var refreshExisting = false;
  var verifyOnly = false;

  for (final arg in args) {
    if (arg == '--help' || arg == '-h') {
      _printUsage();
      throw _ExitSignal(0);
    }
    if (arg.startsWith('--source-dir=')) {
      sourceDir = arg.split('=').last;
      continue;
    }
    if (arg.startsWith('--title=')) {
      courseTitle = arg.substring('--title='.length);
      continue;
    }
    if (arg.startsWith('--price=')) {
      priceInCoins = int.parse(arg.split('=').last);
      continue;
    }
    if (arg == '--allow-duplicate') {
      allowDuplicate = true;
      continue;
    }
    if (arg == '--refresh-existing') {
      refreshExisting = true;
      continue;
    }
    if (arg == '--verify-only') {
      verifyOnly = true;
      continue;
    }
  }

  return _ImportConfig(
    sourceDir: sourceDir,
    courseTitle: courseTitle,
    priceInCoins: priceInCoins,
    allowDuplicate: allowDuplicate,
    refreshExisting: refreshExisting,
    verifyOnly: verifyOnly,
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

int? _extractLabNumber(String value) {
  final match = RegExp(
    r'Лаб\s*([0-9]+)|Лабораторная работа №\s*([0-9]+)',
  ).firstMatch(value);
  final raw = match?.group(1) ?? match?.group(2);
  return raw == null ? null : int.tryParse(raw);
}

String _extractTopic(String markdown, String path) {
  final headingMatches = RegExp(r'^##\s+(.+)$', multiLine: true)
      .allMatches(markdown)
      .map((match) => match.group(1)!.trim())
      .where((line) {
        return !line.contains('Лабораторная работа') &&
            !line.contains('Теоретические сведения') &&
            !line.contains('Задание') &&
            !line.contains('Варианты заданий');
      })
      .toList();

  if (headingMatches.isNotEmpty) {
    return _cleanTopic(headingMatches.first);
  }

  final filename = path.split(Platform.pathSeparator).last;
  final withoutExtension = filename.replaceFirst(RegExp(r'\.md$'), '');
  final parts = withoutExtension.split('.');
  return _cleanTopic(parts.length > 1 ? parts.last : withoutExtension);
}

String? _extractGoal(String markdown) {
  final match = RegExp(
    r'\*\*Цель урока:\*\*\s*(.+?)(?:\n\n|$)',
    dotAll: true,
  ).firstMatch(markdown);
  return match?.group(1)?.replaceAll('\n', ' ').trim();
}

String _cleanTopic(String value) {
  return value
      .replaceAll('*', '')
      .replaceAll('_', '')
      .replaceAll(RegExp(r'\s+'), ' ')
      .replaceAll(RegExp(r'\.$'), '')
      .trim();
}

String _normalizeTopicByLabNumber(int number, String topic) {
  return switch (number) {
    6 => 'Библиотека STL',
    _ => topic,
  };
}

String _clip(String value, {int maxLength = 160}) {
  final normalized = value.replaceAll(RegExp(r'\s+'), ' ').trim();
  if (normalized.length <= maxLength) {
    return normalized;
  }
  return '${normalized.substring(0, maxLength)}...';
}

String _normalizeMarkdown(String raw) {
  return raw
      .replaceAll('\r\n', '\n')
      .replaceAll(RegExp(r'\n{3,}'), '\n\n')
      .trim();
}

final _forbiddenCourseArtifactPattern = RegExp(
  r'лаборатор|цель работы|тема этой',
  caseSensitive: false,
);

String _adaptMarkdownForCourse(String raw, String topic) {
  final lines = _normalizeMarkdown(raw).split('\n');
  final adaptedLines = <String>['# $topic', ''];
  var skippedTopicHeading = false;

  for (final line in lines) {
    final trimmed = line.trim();
    if (trimmed.isEmpty) {
      adaptedLines.add(line);
      continue;
    }
    if (trimmed.contains('Лабораторный практикум по дисциплине')) {
      continue;
    }
    if (RegExp(r'^##\s+Лабораторная работа').hasMatch(trimmed)) {
      continue;
    }
    if (!skippedTopicHeading &&
        RegExp(r'^##\s+').hasMatch(trimmed) &&
        _cleanTopic(trimmed.replaceFirst(RegExp(r'^#+\s*'), '')) == topic) {
      skippedTopicHeading = true;
      continue;
    }

    adaptedLines.add(line);
  }

  return _normalizeMarkdown(
    adaptedLines
        .join('\n')
        .replaceAll('**Цель работы:**', '**Цель урока:**')
        .replaceAll('Цель работы:', 'Цель урока:')
        .replaceAll(RegExp(r'##\s+\*\*Теоретические сведения\*\*'), '## Теория')
        .replaceAll(RegExp(r'##\s+\*\*Задание\*\*'), '## Практика')
        .replaceAll(
          RegExp(r'##\s+\*\*Варианты заданий\*\*'),
          '## Практические варианты',
        )
        .replaceAll(
          RegExp(
            r'Отчет по лабораторной работе №\s*\d+\s+должен содержать',
            caseSensitive: false,
          ),
          'Итоговая проверка по уроку должна включать',
        )
        .replaceAll(
          RegExp(
            r'в лабораторной работе №\s*\d+',
            caseSensitive: false,
          ),
          'в предыдущем практическом уроке',
        )
        .replaceAll(
          RegExp(
            r'лабораторной работе №\s*\d+',
            caseSensitive: false,
          ),
          'практическом уроке',
        )
        .replaceAll(
          RegExp(
            r'лабораторн\w*\s+работ\w*(?:\s*№\s*\d+)?',
            caseSensitive: false,
          ),
          'практический урок',
        )
        .replaceAll(
          RegExp('лабораторной работы', caseSensitive: false),
          'урока',
        )
        .replaceAll(
          RegExp('лабораторную работу', caseSensitive: false),
          'урок',
        )
        .replaceAll(
          RegExp('лабораторная работа', caseSensitive: false),
          'урок',
        )
        .replaceAll(
          RegExp('лабораторные работы', caseSensitive: false),
          'практические уроки',
        ),
  );
}

List<_QuizSpec> _quizSpecsForLab(_LabContent lab) {
  final specs = _quizSpecsByNumber[lab.number];
  if (specs != null) {
    return specs;
  }

  return [
    _QuizSpec(
      questionText:
          'Какой практический результат ожидается после изучения темы?',
      correctAnswer: 'Понимать идею темы и применять ее в коде',
      options: const [
        'Понимать идею темы и применять ее в коде',
        'Запомнить только название раздела',
        'Игнорировать ограничения алгоритмов',
        'Использовать случайную структуру данных',
      ],
      hint:
          'Сфокусируйтесь на том, что ученик должен уметь делать после урока.',
      explanation:
          'Урок проверяет понимание идеи и умение применить ее на практике.',
    ),
    _QuizSpec(
      questionText: 'Что помогает проверить корректность решения по этой теме?',
      correctAnswer: 'Тестирование на обычных и граничных входных данных',
      options: const [
        'Тестирование на обычных и граничных входных данных',
        'Проверка только одного удобного примера',
        'Оценка кода без запуска',
        'Удаление сложных случаев из входных данных',
      ],
      hint: 'Подумайте, как обнаруживаются ошибки в алгоритмах.',
      explanation:
          'Граничные случаи часто показывают ошибки, которые не видны на простых данных.',
    ),
  ];
}

const _quizSpecsByNumber = <int, List<_QuizSpec>>{
  1: [
    _QuizSpec(
      questionText: 'Зачем в C++ используют шаблоны функций и классов?',
      correctAnswer: 'Чтобы описывать обобщенный код для разных типов данных',
      options: [
        'Чтобы описывать обобщенный код для разных типов данных',
        'Чтобы запретить использование пользовательских типов',
        'Чтобы выполнять код только во время выполнения программы',
        'Чтобы заменить все классы глобальными переменными',
      ],
      hint: 'Шаблон отделяет алгоритм от конкретного типа данных.',
      explanation:
          'Шаблоны позволяют переиспользовать одну реализацию с разными фактическими типами.',
    ),
    _QuizSpec(
      questionText:
          'Что должен поддерживать тип, переданный в шаблонную функцию max?',
      correctAnswer: 'Операцию сравнения, которую использует тело функции',
      options: [
        'Операцию сравнения, которую использует тело функции',
        'Наличие только конструктора без параметров',
        'Обязательное наследование от стандартного класса',
        'Хранение данных только в динамической памяти',
      ],
      hint:
          'Посмотрите, какая операция выполняется внутри алгоритма выбора максимума.',
      explanation:
          'Если шаблон использует оператор >, фактический тип должен поддерживать такое сравнение.',
    ),
  ],
  2: [
    _QuizSpec(
      questionText: 'Что показывает асимптотическая сложность алгоритма?',
      correctAnswer:
          'Как растет потребление ресурсов при увеличении размера входа',
      options: [
        'Как растет потребление ресурсов при увеличении размера входа',
        'Сколько строк занимает исходный код',
        'На каком языке написана программа',
        'Сколько файлов подключено к проекту',
      ],
      hint: 'Сложность связывает размер входных данных и затраты алгоритма.',
      explanation:
          'Асимптотика описывает рост времени или памяти, когда размер входа становится больше.',
    ),
    _QuizSpec(
      questionText: 'Почему O(n log n) обычно лучше O(n²) на больших данных?',
      correctAnswer:
          'Потому что количество операций растет существенно медленнее',
      options: [
        'Потому что количество операций растет существенно медленнее',
        'Потому что алгоритм всегда занимает меньше памяти',
        'Потому что такой алгоритм не требует тестирования',
        'Потому что он работает только с отсортированными данными',
      ],
      hint: 'Сравните скорость роста функций при большом n.',
      explanation:
          'Квадратичный рост быстро становится дорогим, а n log n масштабируется заметно лучше.',
    ),
  ],
  3: [
    _QuizSpec(
      questionText:
          'Какое свойство означает устойчивость алгоритма сортировки?',
      correctAnswer: 'Равные элементы сохраняют исходный относительный порядок',
      options: [
        'Равные элементы сохраняют исходный относительный порядок',
        'Алгоритм никогда не использует дополнительную память',
        'Массив всегда сортируется за один проход',
        'Алгоритм работает только с целыми числами',
      ],
      hint: 'Устойчивость важна, когда у элементов есть одинаковые ключи.',
      explanation:
          'Устойчивая сортировка не меняет порядок элементов с равными ключами.',
    ),
    _QuizSpec(
      questionText: 'Для чего сравнивают сортировки по времени и памяти?',
      correctAnswer:
          'Чтобы выбрать алгоритм под размер данных и ограничения задачи',
      options: [
        'Чтобы выбрать алгоритм под размер данных и ограничения задачи',
        'Чтобы всегда использовать самый короткий исходный код',
        'Чтобы отказаться от проверки результата',
        'Чтобы сортировать только уже упорядоченные массивы',
      ],
      hint: 'Разные сортировки дают разные компромиссы.',
      explanation:
          'Выбор сортировки зависит от размера входа, требуемой памяти, устойчивости и характера данных.',
    ),
  ],
  4: [
    _QuizSpec(
      questionText:
          'Какое условие необходимо для корректного бинарного поиска?',
      correctAnswer: 'Данные должны быть упорядочены по ключу поиска',
      options: [
        'Данные должны быть упорядочены по ключу поиска',
        'Все элементы должны быть различными строками',
        'Массив должен храниться только в файле',
        'Количество элементов должно быть нечетным',
      ],
      hint: 'Бинарный поиск отбрасывает половину области поиска.',
      explanation:
          'Без упорядоченности нельзя понять, какую половину данных можно исключить.',
    ),
    _QuizSpec(
      questionText:
          'В чем главное преимущество бинарного поиска перед линейным?',
      correctAnswer: 'Он уменьшает область поиска вдвое на каждом шаге',
      options: [
        'Он уменьшает область поиска вдвое на каждом шаге',
        'Он проверяет каждый элемент без исключений',
        'Он не зависит от порядка данных',
        'Он всегда изменяет исходный массив',
      ],
      hint: 'Сравните количество проверок при большом массиве.',
      explanation:
          'Бинарный поиск имеет логарифмический рост числа шагов при условии отсортированных данных.',
    ),
  ],
  5: [
    _QuizSpec(
      questionText: 'Чем связный список принципиально отличается от массива?',
      correctAnswer:
          'Элементы связаны ссылками и не обязаны лежать подряд в памяти',
      options: [
        'Элементы связаны ссылками и не обязаны лежать подряд в памяти',
        'Все элементы всегда хранятся в одной непрерывной области',
        'Размер списка обязан быть известен на этапе компиляции',
        'Доступ к любому элементу всегда выполняется за O(1)',
      ],
      hint: 'Динамические структуры строятся через связи между узлами.',
      explanation:
          'Связный список хранит данные в узлах, а переход между ними выполняется по ссылкам.',
    ),
    _QuizSpec(
      questionText: 'Когда динамическая структура данных особенно полезна?',
      correctAnswer:
          'Когда размер набора данных часто меняется во время работы программы',
      options: [
        'Когда размер набора данных часто меняется во время работы программы',
        'Когда нужно запретить вставку новых элементов',
        'Когда все данные заранее фиксированы и неизменны',
        'Когда требуется хранить только один элемент',
      ],
      hint: 'Подумайте о добавлении и удалении элементов во время выполнения.',
      explanation:
          'Динамические структуры удобны, когда элементы нужно часто добавлять или удалять.',
    ),
  ],
  6: [
    _QuizSpec(
      questionText: 'Какую роль выполняют контейнеры STL?',
      correctAnswer: 'Предоставляют готовые структуры хранения данных',
      options: [
        'Предоставляют готовые структуры хранения данных',
        'Заменяют компилятор C++',
        'Запрещают использование алгоритмов',
        'Хранят только текстовые строки',
      ],
      hint: 'Вспомните vector, list, set и map.',
      explanation:
          'Контейнеры STL дают стандартные структуры данных с готовым интерфейсом.',
    ),
    _QuizSpec(
      questionText: 'Зачем в STL используются итераторы?',
      correctAnswer:
          'Чтобы единообразно проходить по элементам разных контейнеров',
      options: [
        'Чтобы единообразно проходить по элементам разных контейнеров',
        'Чтобы полностью отключить шаблоны',
        'Чтобы хранить только числовые индексы',
        'Чтобы сортировать данные без контейнера',
      ],
      hint: 'Итератор связывает алгоритмы и контейнеры.',
      explanation:
          'Итераторы позволяют алгоритмам работать с разными контейнерами через общий способ обхода.',
    ),
  ],
  7: [
    _QuizSpec(
      questionText: 'Что обычно моделируют вершины и ребра графа?',
      correctAnswer: 'Объекты и связи между ними',
      options: [
        'Объекты и связи между ними',
        'Только отсортированные массивы',
        'Только строки исходного кода',
        'Исключительно арифметические выражения',
      ],
      hint: 'Граф описывает отношения между сущностями.',
      explanation:
          'Вершины представляют объекты, а ребра показывают связи или переходы между ними.',
    ),
    _QuizSpec(
      questionText: 'Для какой задачи подходит обход графа в ширину?',
      correctAnswer:
          'Поиск кратчайшего пути по числу ребер в невзвешенном графе',
      options: [
        'Поиск кратчайшего пути по числу ребер в невзвешенном графе',
        'Сортировка массива методом вставок',
        'Подсчет размера шаблонного класса',
        'Выбор контейнера STL без обхода данных',
      ],
      hint: 'BFS просматривает вершины слоями от стартовой вершины.',
      explanation:
          'В невзвешенном графе BFS находит минимальное число переходов от стартовой вершины.',
    ),
  ],
};

void _printUsage() {
  stdout.writeln('''
Import the Russian ASD demo course from markdown laboratory files.

Options:
  --source-dir=<path>      Directory with lab .md files. Default: $_defaultSourceDir
  --title=<text>           Course title. Default: $_defaultCourseTitle
  --price=<int>            Course price in coins. Default: 0
  --allow-duplicate        Create a new course even when one with the same title exists.
  --refresh-existing       Update the existing course with adapted lesson text and tasks.
  --verify-only            Read the existing course and report imported content quality.
  --mode=<name>            Serverpod mode. Defaults to development.
''');
}

class _ExitSignal implements Exception {
  final int code;

  const _ExitSignal(this.code);
}
