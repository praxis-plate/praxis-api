import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_answer_attempt_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/task_option_data_source.dart';
import 'package:praxis_server/src/datasources/task_test_case_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_result.dart';
import 'package:praxis_server/src/services/task/task_answer_validation_service.dart';
import 'package:praxis_server/src/shared/mappers/learning_content_mapper.dart';
import 'package:serverpod/serverpod.dart';

class TaskService {
  final CourseDataSource _courseDataSource;
  final LessonDataSource _lessonDataSource;
  final ModuleDataSource _moduleDataSource;
  final TaskAnswerAttemptDataSource _taskAnswerAttemptDataSource;
  final TaskDataSource _taskDataSource;
  final TaskOptionDataSource _taskOptionDataSource;
  final TaskTestCaseDataSource _taskTestCaseDataSource;
  final TaskAnswerValidationService _validationService;

  TaskService({
    required CourseDataSource courseDataSource,
    required LessonDataSource lessonDataSource,
    required ModuleDataSource moduleDataSource,
    required TaskAnswerAttemptDataSource taskAnswerAttemptDataSource,
    required TaskDataSource taskDataSource,
    required TaskOptionDataSource taskOptionDataSource,
    required TaskTestCaseDataSource taskTestCaseDataSource,
    required TaskAnswerValidationService validationService,
  }) : _courseDataSource = courseDataSource,
       _lessonDataSource = lessonDataSource,
       _moduleDataSource = moduleDataSource,
       _taskAnswerAttemptDataSource = taskAnswerAttemptDataSource,
       _taskDataSource = taskDataSource,
       _taskOptionDataSource = taskOptionDataSource,
       _taskTestCaseDataSource = taskTestCaseDataSource,
       _validationService = validationService;

  Future<TaskAnswerResult> validateAnswer(
    TaskDto task,
    String userAnswer,
  ) {
    return _validationService.validateAnswer(task, userAnswer);
  }

  Future<TaskAnswerResult> answerTask(
    Session session,
    int taskId,
    String userAnswer,
  ) async {
    final task = await getTaskById(session, taskId);
    final result = await _validationService.validateAnswer(task, userAnswer);

    await _taskAnswerAttemptDataSource.insert(
      session,
      authUserId: _extractAuthUserId(session),
      taskId: task.id,
      userAnswer: _normalizeUserAnswer(userAnswer),
      isCorrect: result.isCorrect,
      feedbackType: result.feedbackType.value,
      submittedAt: DateTime.now(),
    );

    return result;
  }

  Future<TaskDto> getTaskById(
    Session session,
    int taskId,
  ) async {
    final task = await _taskDataSource.findById(session, taskId);
    if (task == null) {
      throw NotFoundException(message: 'Task not found');
    }
    await _ensurePublishedTask(session, task);

    final options = await _taskOptionDataSource.listByTaskId(
      session,
      taskId,
    );
    final testCases = await _taskTestCaseDataSource.listByTaskId(
      session,
      taskId,
    );

    return task.toTaskDto(
      options: options.map((option) => option.toTaskOptionDto()).toList(),
      testCases: testCases
          .map((testCase) => testCase.toTaskTestCaseDto())
          .toList(),
    );
  }

  Future<List<TaskDto>> getTasksByLessonId(
    Session session,
    int lessonId,
  ) async {
    return getTasksByLessonIds(session, [lessonId]);
  }

  Future<List<TaskDto>> getTasksByLessonIds(
    Session session,
    List<int> lessonIds,
  ) async {
    if (lessonIds.isEmpty) {
      return [];
    }

    final lessons = await _lessonDataSource.listByIds(session, lessonIds);
    if (lessons.isEmpty) {
      return [];
    }

    final moduleIds = lessons.map((lesson) => lesson.moduleId).toSet().toList();
    final modules = await _moduleDataSource.listByIds(session, moduleIds);
    if (modules.isEmpty) {
      return [];
    }

    final courseIds = modules.map((module) => module.courseId).toSet().toList();
    final courses = await _courseDataSource.listPublishedByIds(
      session,
      courseIds,
    );
    if (courses.isEmpty) {
      return [];
    }

    final publishedCourseIds = courses.map((course) => course.id!).toSet();
    final moduleByCourseId = <int, Module>{};
    for (final module in modules) {
      if (publishedCourseIds.contains(module.courseId)) {
        moduleByCourseId[module.id!] = module;
      }
    }

    final publishedLessonIds = <int>[];
    for (final lesson in lessons) {
      if (moduleByCourseId.containsKey(lesson.moduleId)) {
        publishedLessonIds.add(lesson.id!);
      }
    }

    if (publishedLessonIds.isEmpty) {
      return [];
    }

    final tasks = await _taskDataSource.listByLessonIds(
      session,
      publishedLessonIds,
    );
    if (tasks.isEmpty) {
      return [];
    }

    final taskIds = tasks.map((task) => task.id!).toList();
    final options = await _taskOptionDataSource.listByTaskIds(
      session,
      taskIds,
    );
    final testCases = await _taskTestCaseDataSource.listByTaskIds(
      session,
      taskIds,
    );

    final optionsByTaskId = <int, List<TaskOptionDto>>{};
    for (final option in options) {
      final list = optionsByTaskId.putIfAbsent(option.taskId, () => []);
      list.add(option.toTaskOptionDto());
    }

    final testCasesByTaskId = <int, List<TaskTestCaseDto>>{};
    for (final testCase in testCases) {
      final list = testCasesByTaskId.putIfAbsent(testCase.taskId, () => []);
      list.add(testCase.toTaskTestCaseDto());
    }

    final sortedTasks = List<Task>.from(tasks)
      ..sort((a, b) {
        final lessonCompare = a.lessonId.compareTo(b.lessonId);
        if (lessonCompare != 0) {
          return lessonCompare;
        }
        return a.orderIndex.compareTo(b.orderIndex);
      });

    return sortedTasks
        .map(
          (task) => task.toTaskDto(
            options: optionsByTaskId[task.id!] ?? const [],
            testCases: testCasesByTaskId[task.id!] ?? const [],
          ),
        )
        .toList();
  }

  Future<void> _ensurePublishedTask(Session session, Task task) async {
    final lesson = await _lessonDataSource.findById(session, task.lessonId);
    if (lesson == null) {
      throw NotFoundException(message: 'Task not found');
    }
    final module = await _moduleDataSource.findById(session, lesson.moduleId);
    if (module == null) {
      throw NotFoundException(message: 'Task not found');
    }
    final course = await _courseDataSource.findPublishedById(
      session,
      module.courseId,
    );
    if (course == null) {
      throw NotFoundException(message: 'Task not found');
    }
  }

  UuidValue? _extractAuthUserId(Session session) {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      return null;
    }

    try {
      return UuidValue.fromString(authInfo.userIdentifier);
    } catch (_) {
      return null;
    }
  }

  String? _normalizeUserAnswer(String userAnswer) {
    final normalized = userAnswer.trim();
    if (normalized.isEmpty) {
      return null;
    }

    if (normalized.length <= 500) {
      return normalized;
    }

    return normalized.substring(0, 500);
  }
}
