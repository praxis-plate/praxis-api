import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
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
  final TaskDataSource _taskDataSource;
  final TaskOptionDataSource _taskOptionDataSource;
  final TaskTestCaseDataSource _taskTestCaseDataSource;
  final TaskAnswerValidationService _validationService;

  TaskService({
    required CourseDataSource courseDataSource,
    required LessonDataSource lessonDataSource,
    required ModuleDataSource moduleDataSource,
    required TaskDataSource taskDataSource,
    required TaskOptionDataSource taskOptionDataSource,
    required TaskTestCaseDataSource taskTestCaseDataSource,
    required TaskAnswerValidationService validationService,
  }) : _courseDataSource = courseDataSource,
       _lessonDataSource = lessonDataSource,
       _moduleDataSource = moduleDataSource,
       _taskDataSource = taskDataSource,
       _taskOptionDataSource = taskOptionDataSource,
       _taskTestCaseDataSource = taskTestCaseDataSource,
       _validationService = validationService;

  TaskAnswerResult validateAnswer(
    TaskDto task,
    String userAnswer,
  ) {
    return _validationService.validateAnswer(task, userAnswer);
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

    final publishedLessonIds = <int>[];
    for (final lessonId in lessonIds) {
      final lesson = await _lessonDataSource.findById(session, lessonId);
      if (lesson == null) {
        continue;
      }
      final module = await _moduleDataSource.findById(session, lesson.moduleId);
      if (module == null) {
        continue;
      }
      final course = await _courseDataSource.findPublishedById(
        session,
        module.courseId,
      );
      if (course != null) {
        publishedLessonIds.add(lessonId);
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
}
