import 'dart:convert';

import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/task_option_data_source.dart';
import 'package:praxis_server/src/services/course_seed/course_seed_data.dart';
import 'package:praxis_server/src/services/course_seed/course_seed_models.dart';
import 'package:praxis_server/src/services/course_seed/lesson_seed_data.dart';
import 'package:praxis_server/src/services/course_seed/module_seed_data.dart';
import 'package:praxis_server/src/services/course_seed/task_seed_data.dart';
import 'package:serverpod/serverpod.dart';

class CourseSeedService {
  final CourseDataSource _courseDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonDataSource _lessonDataSource;
  final TaskDataSource _taskDataSource;
  final TaskOptionDataSource _taskOptionDataSource;

  CourseSeedService({
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

  Future<void> seedFirstCourse(Serverpod pod) async {
    if (!_shouldSeedForRunMode(pod.runMode)) {
      return;
    }

    final session = await pod.createSession(enableLogging: false);
    try {
      final hasCourses = await _courseDataSource.hasAny(session);
      if (hasCourses) {
        return;
      }

      final now = DateTime.now();
      final courseSeed = CourseSeedData.programmingFundamentals();
      final course = await _courseDataSource.insert(
        session,
        title: courseSeed.title,
        description: courseSeed.description,
        author: courseSeed.author,
        category: courseSeed.category,
        priceInCoins: courseSeed.priceInCoins,
        durationMinutes: courseSeed.durationMinutes,
        rating: courseSeed.rating,
        thumbnailUrl: courseSeed.thumbnailUrl,
        coverImage: courseSeed.coverImage,
        createdAt: now,
      );

      final modules = ModuleSeedData.programmingFundamentals();
      for (final moduleSeed in modules) {
        final module = await _moduleDataSource.insert(
          session,
          courseId: course.id!,
          title: moduleSeed.title,
          description: moduleSeed.description,
          orderIndex: moduleSeed.orderIndex,
          createdAt: now,
        );

        final lessons = LessonSeedData.getLessonsForModule(moduleSeed.title);
        for (final lessonSeed in lessons) {
          final lesson = await _lessonDataSource.insert(
            session,
            moduleId: module.id!,
            title: lessonSeed.title,
            contentText: lessonSeed.contentText,
            videoUrl: lessonSeed.videoUrl,
            imageUrls: lessonSeed.imageUrls,
            orderIndex: lessonSeed.orderIndex,
            durationMinutes: lessonSeed.durationMinutes,
            createdAt: now,
          );

          await _seedTasksForLesson(
            session,
            lessonId: lesson.id!,
            lessonTitle: lessonSeed.title,
            moduleTitle: moduleSeed.title,
            now: now,
          );
        }
      }
    } finally {
      await session.close();
    }
  }

  Future<void> _seedTasksForLesson(
    Session session, {
    required int lessonId,
    required String lessonTitle,
    required String moduleTitle,
    required DateTime now,
  }) async {
    final tasks = TaskSeedData.getTasksForLesson(lessonTitle, moduleTitle);

    for (final taskSeed in tasks) {
      final optionsJson = taskSeed.options == null
          ? null
          : jsonEncode(taskSeed.options);

      final task = await _taskDataSource.insert(
        session,
        lessonId: lessonId,
        taskType: taskSeed.taskType,
        questionText: taskSeed.questionText,
        correctAnswer: taskSeed.correctAnswer,
        optionsJson: optionsJson,
        codeTemplate: taskSeed.codeTemplate,
        testCasesJson: taskSeed.testCasesJson,
        programmingLanguage: taskSeed.programmingLanguage,
        difficultyLevel: taskSeed.difficultyLevel,
        xpValue: taskSeed.xpValue,
        orderIndex: taskSeed.orderIndex,
        fallbackHint: taskSeed.fallbackHint,
        fallbackExplanation: taskSeed.fallbackExplanation,
        topic: taskSeed.topic,
        createdAt: now,
      );

      await _seedTaskOptions(
        session,
        taskId: task.id!,
        taskSeed: taskSeed,
      );
    }
  }

  Future<void> _seedTaskOptions(
    Session session, {
    required int taskId,
    required TaskSeed taskSeed,
  }) async {
    final options = taskSeed.options;
    if (options == null || options.isEmpty) {
      return;
    }

    for (var i = 0; i < options.length; i++) {
      final optionText = options[i];
      await _taskOptionDataSource.insert(
        session,
        taskId: taskId,
        optionText: optionText,
        isCorrect: optionText == taskSeed.correctAnswer,
        orderIndex: i,
      );
    }
  }

  bool _shouldSeedForRunMode(String runMode) {
    return runMode == ServerpodRunMode.test ||
        runMode == ServerpodRunMode.development;
  }
}
