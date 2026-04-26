import 'dart:convert';

import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/task_option_data_source.dart';
import 'package:praxis_server/src/datasources/task_test_case_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/mappers/learning_content_mapper.dart';
import 'package:serverpod/serverpod.dart';

class CmsContentService {
  final CourseDataSource _courseDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonDataSource _lessonDataSource;
  final TaskDataSource _taskDataSource;
  final TaskOptionDataSource _taskOptionDataSource;
  final TaskTestCaseDataSource _taskTestCaseDataSource;

  const CmsContentService({
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

  Future<List<CourseDto>> listCourses(
    Session session, {
    ContentStatus? status,
    String? query,
    int? limit,
    int? offset,
  }) async {
    final courses = await _courseDataSource.listForCms(
      session,
      status: status,
      query: query,
      limit: limit,
      offset: offset,
    );

    if (courses.isEmpty) {
      return [];
    }

    final courseIds = courses.map((course) => course.id!).toList();
    final modules = await _moduleDataSource.listByCourseIds(session, courseIds);
    final moduleIds = modules.map((module) => module.id!).toList();
    final lessons = await _lessonDataSource.listByModuleIds(session, moduleIds);
    final lessonIds = lessons.map((lesson) => lesson.id!).toList();
    final tasks = await _taskDataSource.listByLessonIds(session, lessonIds);

    final totalLessonsByCourseId = <int, int>{};
    for (final lesson in lessons) {
      final module = modules.firstWhere((item) => item.id == lesson.moduleId);
      totalLessonsByCourseId[module.courseId] =
          (totalLessonsByCourseId[module.courseId] ?? 0) + 1;
    }

    final totalTasksByCourseId = <int, int>{};
    for (final task in tasks) {
      final lesson = lessons.firstWhere((item) => item.id == task.lessonId);
      final module = modules.firstWhere((item) => item.id == lesson.moduleId);
      totalTasksByCourseId[module.courseId] =
          (totalTasksByCourseId[module.courseId] ?? 0) + 1;
    }

    return courses
        .map(
          (course) => course.toCourseDto(
            totalLessons: totalLessonsByCourseId[course.id!] ?? 0,
            totalTasks: totalTasksByCourseId[course.id!] ?? 0,
          ),
        )
        .toList();
  }

  Future<CourseDto> createCourse(
    Session session,
    CreateCourseRequest request, {
    Transaction? transaction,
  }) async {
    final now = DateTime.now();
    final title = _requireText(request.title, 'title');
    final description = _requireText(request.description, 'description');
    final author = _requireText(request.author, 'author');
    final category = _requireText(request.category, 'category');
    final thumbnailUrl = _normalizeOptionalUrl(
      request.thumbnailUrl,
      'thumbnailUrl',
    );
    final coverImage = _normalizeOptionalUrl(request.coverImage, 'coverImage');

    final course = await _courseDataSource.insert(
      session,
      title: title,
      description: description,
      author: author,
      category: category,
      priceInCoins: request.priceInCoins ?? 0,
      durationMinutes: request.durationMinutes ?? 0,
      rating: request.rating ?? 0,
      thumbnailUrl: thumbnailUrl,
      coverImage: coverImage,
      createdAt: now,
      updatedAt: now,
      contentStatus: ContentStatus.draft,
      publishedAt: null,
      transaction: transaction,
    );

    return course.toCourseDto(totalLessons: 0, totalTasks: 0);
  }

  Future<CourseDto> updateCourse(
    Session session,
    UpdateCourseRequest request, {
    Transaction? transaction,
  }) async {
    final course = await _requireCourse(
      session,
      request.id,
      transaction: transaction,
    );
    final updated = await _courseDataSource.updateRow(
      session,
      course.copyWith(
        title: _requireText(request.title, 'title'),
        description: _requireText(request.description, 'description'),
        author: _requireText(request.author, 'author'),
        category: _requireText(request.category, 'category'),
        priceInCoins: request.priceInCoins,
        durationMinutes: request.durationMinutes,
        rating: request.rating,
        thumbnailUrl: _normalizeOptionalUrl(
          request.thumbnailUrl,
          'thumbnailUrl',
        ),
        coverImage: _normalizeOptionalUrl(request.coverImage, 'coverImage'),
        updatedAt: DateTime.now(),
      ),
      transaction: transaction,
    );

    final counts = await _countCourseContent(
      session,
      updated.id!,
      transaction: transaction,
    );
    return updated.toCourseDto(
      totalLessons: counts.totalLessons,
      totalTasks: counts.totalTasks,
    );
  }

  Future<CourseDto> publishCourse(
    Session session,
    int courseId, {
    Transaction? transaction,
  }) async {
    return _setCoursePublication(
      session,
      courseId,
      contentStatus: ContentStatus.published,
      publishedAt: DateTime.now(),
      transaction: transaction,
    );
  }

  Future<CourseDto> unpublishCourse(
    Session session,
    int courseId, {
    Transaction? transaction,
  }) async {
    return _setCoursePublication(
      session,
      courseId,
      contentStatus: ContentStatus.draft,
      publishedAt: null,
      transaction: transaction,
    );
  }

  Future<List<ModuleDto>> listModules(
    Session session,
    int courseId, {
    Transaction? transaction,
  }) async {
    await _requireCourse(session, courseId, transaction: transaction);
    final modules = await _moduleDataSource.listByCourseId(
      session,
      courseId,
      transaction: transaction,
    );
    return modules.map((module) => module.toModuleDto()).toList();
  }

  Future<ModuleDto> createModule(
    Session session,
    CreateModuleRequest request, {
    Transaction? transaction,
  }) async {
    final course = await _requireCourse(
      session,
      request.courseId,
      transaction: transaction,
    );
    final now = DateTime.now();
    final modules = await _moduleDataSource.listByCourseId(
      session,
      course.id!,
      transaction: transaction,
    );

    final module = await _moduleDataSource.insert(
      session,
      courseId: course.id!,
      title: _requireText(request.title, 'title'),
      description: _requireText(request.description, 'description'),
      orderIndex: modules.length,
      createdAt: now,
      updatedAt: now,
      transaction: transaction,
    );
    await _touchCourse(session, course.id!, now, transaction: transaction);

    return module.toModuleDto();
  }

  Future<ModuleDto> updateModule(
    Session session,
    UpdateModuleRequest request, {
    Transaction? transaction,
  }) async {
    final module = await _requireModule(
      session,
      request.id,
      transaction: transaction,
    );
    final now = DateTime.now();

    final updated = await _moduleDataSource.updateRow(
      session,
      module.copyWith(
        title: _requireText(request.title, 'title'),
        description: _requireText(request.description, 'description'),
        updatedAt: now,
      ),
      transaction: transaction,
    );
    await _touchCourse(session, module.courseId, now, transaction: transaction);

    return updated.toModuleDto();
  }

  Future<List<ModuleDto>> reorderModules(
    Session session,
    ReorderModulesRequest request, {
    Transaction? transaction,
  }) async {
    final course = await _requireCourse(
      session,
      request.courseId,
      transaction: transaction,
    );
    final modules = await _moduleDataSource.listByCourseId(
      session,
      course.id!,
      transaction: transaction,
    );
    _validateFullReorder(
      expectedIds: modules.map((module) => module.id!).toList(),
      actualIds: request.orderedModuleIds,
      field: 'orderedModuleIds',
    );

    final modulesById = {for (final module in modules) module.id!: module};
    final now = DateTime.now();
    final reordered = <Module>[];
    for (var index = 0; index < request.orderedModuleIds.length; index++) {
      final module = modulesById[request.orderedModuleIds[index]]!;
      final updated = await _moduleDataSource.updateRow(
        session,
        module.copyWith(
          orderIndex: index,
          updatedAt: now,
        ),
        transaction: transaction,
      );
      reordered.add(updated);
    }
    await _touchCourse(session, course.id!, now, transaction: transaction);

    return reordered.map((module) => module.toModuleDto()).toList();
  }

  Future<List<LessonDto>> listLessons(
    Session session,
    int moduleId, {
    Transaction? transaction,
  }) async {
    await _requireModule(session, moduleId, transaction: transaction);
    final lessons = await _lessonDataSource.listByModuleId(
      session,
      moduleId,
      transaction: transaction,
    );
    return lessons.map((lesson) => lesson.toLessonDto()).toList();
  }

  Future<LessonDto> createLesson(
    Session session,
    CreateLessonRequest request, {
    Transaction? transaction,
  }) async {
    final module = await _requireModule(
      session,
      request.moduleId,
      transaction: transaction,
    );
    final now = DateTime.now();
    final lessons = await _lessonDataSource.listByModuleId(
      session,
      module.id!,
      transaction: transaction,
    );

    final lesson = await _lessonDataSource.insert(
      session,
      moduleId: module.id!,
      title: _requireText(request.title, 'title'),
      contentText: _requireText(request.contentText, 'contentText'),
      videoUrl: _normalizeOptionalUrl(request.videoUrl, 'videoUrl'),
      imageUrls: _normalizeImageUrls(request.imageUrls),
      orderIndex: lessons.length,
      durationMinutes: request.durationMinutes ?? 0,
      createdAt: now,
      updatedAt: now,
      transaction: transaction,
    );

    await _touchAncestorsForModule(
      session,
      module.courseId,
      module.id!,
      now,
      transaction: transaction,
    );
    return lesson.toLessonDto();
  }

  Future<LessonDto> updateLesson(
    Session session,
    UpdateLessonRequest request, {
    Transaction? transaction,
  }) async {
    final lesson = await _requireLesson(
      session,
      request.id,
      transaction: transaction,
    );
    final module = await _requireModule(
      session,
      lesson.moduleId,
      transaction: transaction,
    );
    final now = DateTime.now();

    final updated = await _lessonDataSource.updateRow(
      session,
      lesson.copyWith(
        title: _requireText(request.title, 'title'),
        contentText: _requireText(request.contentText, 'contentText'),
        videoUrl: _normalizeOptionalUrl(request.videoUrl, 'videoUrl'),
        imageUrls: _normalizeImageUrls(request.imageUrls),
        durationMinutes: request.durationMinutes,
        updatedAt: now,
      ),
      transaction: transaction,
    );

    await _touchAncestorsForModule(
      session,
      module.courseId,
      module.id!,
      now,
      transaction: transaction,
    );
    return updated.toLessonDto();
  }

  Future<List<LessonDto>> reorderLessons(
    Session session,
    ReorderLessonsRequest request, {
    Transaction? transaction,
  }) async {
    final module = await _requireModule(
      session,
      request.moduleId,
      transaction: transaction,
    );
    final lessons = await _lessonDataSource.listByModuleId(
      session,
      module.id!,
      transaction: transaction,
    );
    _validateFullReorder(
      expectedIds: lessons.map((lesson) => lesson.id!).toList(),
      actualIds: request.orderedLessonIds,
      field: 'orderedLessonIds',
    );

    final lessonsById = {for (final lesson in lessons) lesson.id!: lesson};
    final now = DateTime.now();
    final reordered = <Lesson>[];
    for (var index = 0; index < request.orderedLessonIds.length; index++) {
      final lesson = lessonsById[request.orderedLessonIds[index]]!;
      final updated = await _lessonDataSource.updateRow(
        session,
        lesson.copyWith(
          orderIndex: index,
          updatedAt: now,
        ),
        transaction: transaction,
      );
      reordered.add(updated);
    }

    await _touchAncestorsForModule(
      session,
      module.courseId,
      module.id!,
      now,
      transaction: transaction,
    );
    return reordered.map((lesson) => lesson.toLessonDto()).toList();
  }

  Future<List<TaskDto>> listTasks(
    Session session,
    int lessonId, {
    Transaction? transaction,
  }) async {
    await _requireLesson(session, lessonId, transaction: transaction);
    return _buildTaskDtosForLesson(
      session,
      lessonId,
      transaction: transaction,
    );
  }

  Future<TaskDto> createTask(
    Session session,
    CreateTaskRequest request, {
    Transaction? transaction,
  }) async {
    final lesson = await _requireLesson(
      session,
      request.lessonId,
      transaction: transaction,
    );
    final module = await _requireModule(
      session,
      lesson.moduleId,
      transaction: transaction,
    );
    final now = DateTime.now();
    final tasks = await _taskDataSource.listByLessonId(
      session,
      lesson.id!,
      transaction: transaction,
    );

    final task = await _taskDataSource.insert(
      session,
      lessonId: lesson.id!,
      taskType: request.taskType,
      questionText: _requireText(request.questionText, 'questionText'),
      correctAnswer: (request.correctAnswer ?? '').trim(),
      optionsJson: null,
      codeTemplate: _normalizeOptionalText(request.codeTemplate),
      testCasesJson: null,
      programmingLanguage: _normalizeOptionalText(request.programmingLanguage),
      difficultyLevel: request.difficultyLevel ?? 1,
      xpValue: request.xpValue ?? 0,
      orderIndex: tasks.length,
      fallbackHint: _normalizeOptionalText(request.fallbackHint),
      fallbackExplanation: _normalizeOptionalText(request.fallbackExplanation),
      topic: _normalizeOptionalText(request.topic) ?? 'general',
      createdAt: now,
      updatedAt: now,
      transaction: transaction,
    );

    await _touchAncestorsForLesson(
      session,
      module.courseId,
      module.id!,
      lesson.id!,
      now,
      transaction: transaction,
    );

    return task.toTaskDto(options: const [], testCases: const []);
  }

  Future<TaskDto> updateTask(
    Session session,
    UpdateTaskRequest request, {
    Transaction? transaction,
  }) async {
    final task = await _requireTask(
      session,
      request.id,
      transaction: transaction,
    );
    final lesson = await _requireLesson(
      session,
      task.lessonId,
      transaction: transaction,
    );
    final module = await _requireModule(
      session,
      lesson.moduleId,
      transaction: transaction,
    );
    final now = DateTime.now();

    final updated = await _taskDataSource.updateRow(
      session,
      task.copyWith(
        taskType: request.taskType,
        questionText: _requireText(request.questionText, 'questionText'),
        correctAnswer: request.correctAnswer.trim(),
        codeTemplate: _normalizeOptionalText(request.codeTemplate),
        programmingLanguage: _normalizeOptionalText(
          request.programmingLanguage,
        ),
        difficultyLevel: request.difficultyLevel,
        xpValue: request.xpValue,
        fallbackHint: _normalizeOptionalText(request.fallbackHint),
        fallbackExplanation: _normalizeOptionalText(
          request.fallbackExplanation,
        ),
        topic: _requireText(request.topic, 'topic'),
        updatedAt: now,
      ),
      transaction: transaction,
    );

    await _touchAncestorsForLesson(
      session,
      module.courseId,
      module.id!,
      lesson.id!,
      now,
      transaction: transaction,
    );

    return _buildTaskDto(session, updated, transaction: transaction);
  }

  Future<List<TaskDto>> reorderTasks(
    Session session,
    ReorderTasksRequest request, {
    Transaction? transaction,
  }) async {
    final lesson = await _requireLesson(
      session,
      request.lessonId,
      transaction: transaction,
    );
    final module = await _requireModule(
      session,
      lesson.moduleId,
      transaction: transaction,
    );
    final tasks = await _taskDataSource.listByLessonId(
      session,
      lesson.id!,
      transaction: transaction,
    );
    _validateFullReorder(
      expectedIds: tasks.map((task) => task.id!).toList(),
      actualIds: request.orderedTaskIds,
      field: 'orderedTaskIds',
    );

    final tasksById = {for (final task in tasks) task.id!: task};
    final now = DateTime.now();
    final reordered = <Task>[];
    for (var index = 0; index < request.orderedTaskIds.length; index++) {
      final task = tasksById[request.orderedTaskIds[index]]!;
      final updated = await _taskDataSource.updateRow(
        session,
        task.copyWith(
          orderIndex: index,
          updatedAt: now,
        ),
        transaction: transaction,
      );
      reordered.add(updated);
    }

    await _touchAncestorsForLesson(
      session,
      module.courseId,
      module.id!,
      lesson.id!,
      now,
      transaction: transaction,
    );
    return _buildTaskDtos(session, reordered, transaction: transaction);
  }

  Future<List<TaskOptionDto>> upsertTaskOptions(
    Session session,
    UpsertTaskOptionsRequest request, {
    Transaction? transaction,
  }) async {
    final task = await _requireTask(
      session,
      request.taskId,
      transaction: transaction,
    );
    if (!_supportsTaskOptions(task.taskType)) {
      throw ValidationException(
        message:
            'Task options are supported only for multipleChoice and multipleAnswer tasks',
        field: 'taskId',
      );
    }
    if (request.options.isEmpty) {
      throw ValidationException(
        message: 'Task options must not be empty',
        field: 'options',
      );
    }

    final now = DateTime.now();
    final correctOptions = request.options.where((option) => option.isCorrect);
    final minimumCorrectOptions = task.taskType == TaskType.multipleAnswer
        ? 2
        : 1;
    if (task.taskType == TaskType.multipleChoice &&
        correctOptions.length != 1) {
      throw ValidationException(
        message: 'Exactly one task option must be marked as correct',
        field: 'options',
      );
    }
    if (task.taskType == TaskType.multipleAnswer &&
        correctOptions.length < minimumCorrectOptions) {
      throw ValidationException(
        message: 'Multiple-answer tasks must have at least two correct options',
        field: 'options',
      );
    }

    final existingOptions = await _taskOptionDataSource.listByTaskId(
      session,
      task.id!,
      transaction: transaction,
    );
    final existingById = {
      for (final option in existingOptions)
        if (option.id != null) option.id!: option,
    };
    final requestedIds = request.options
        .map((option) => option.id)
        .nonNulls
        .toSet();
    if (!existingById.keys.toSet().containsAll(requestedIds)) {
      throw ValidationException(
        message: 'Task options contain foreign ids',
        field: 'options',
      );
    }

    final optionTexts = <String>[];
    final result = <TaskOptionDto>[];
    for (var index = 0; index < request.options.length; index++) {
      final input = request.options[index];
      final optionText = _requireText(
        input.optionText,
        'options[$index].optionText',
      );
      if (optionTexts.contains(optionText)) {
        throw ValidationException(
          message: 'Task options must be unique',
          field: 'options[$index].optionText',
        );
      }
      optionTexts.add(optionText);

      if (input.id == null) {
        final inserted = await _taskOptionDataSource.insert(
          session,
          taskId: task.id!,
          optionText: optionText,
          isCorrect: input.isCorrect,
          orderIndex: index,
          updatedAt: now,
          transaction: transaction,
        );
        result.add(inserted.toTaskOptionDto());
        continue;
      }

      final existing = existingById[input.id]!;
      final updated = await _taskOptionDataSource.updateRow(
        session,
        existing.copyWith(
          optionText: optionText,
          isCorrect: input.isCorrect,
          orderIndex: index,
          updatedAt: now,
        ),
        transaction: transaction,
      );
      result.add(updated.toTaskOptionDto());
    }

    final idsToDelete = existingById.keys
        .toSet()
        .difference(requestedIds)
        .cast<int>();
    await _taskOptionDataSource.deleteByIds(
      session,
      idsToDelete,
      transaction: transaction,
    );

    final correctAnswer = _buildCorrectAnswerForTask(
      taskType: task.taskType,
      correctOptions: correctOptions.toList(),
    );
    await _taskDataSource.updateRow(
      session,
      task.copyWith(
        correctAnswer: correctAnswer,
        optionsJson: jsonEncode(optionTexts),
        updatedAt: now,
      ),
      transaction: transaction,
    );
    await _touchLessonAncestorsByTask(
      session,
      task.id!,
      now,
      transaction: transaction,
    );

    return result;
  }

  bool _supportsTaskOptions(TaskType taskType) {
    return taskType == TaskType.multipleChoice ||
        taskType == TaskType.multipleAnswer;
  }

  String _buildCorrectAnswerForTask({
    required TaskType taskType,
    required List<CmsTaskOptionInputDto> correctOptions,
  }) {
    if (taskType == TaskType.multipleChoice) {
      return _requireText(
        correctOptions.single.optionText,
        'options.correctAnswer',
      );
    }

    return jsonEncode(
      correctOptions
          .map(
            (option) => _requireText(
              option.optionText,
              'options.correctAnswer',
            ),
          )
          .toList(),
    );
  }

  Future<List<TaskTestCaseDto>> upsertTaskTestCases(
    Session session,
    UpsertTaskTestCasesRequest request, {
    Transaction? transaction,
  }) async {
    final task = await _requireTask(
      session,
      request.taskId,
      transaction: transaction,
    );
    if (task.taskType != TaskType.codeCompletion) {
      throw ValidationException(
        message: 'Task test cases are supported only for codeCompletion tasks',
        field: 'taskId',
      );
    }
    if (request.testCases.isEmpty) {
      throw ValidationException(
        message: 'Task test cases must not be empty',
        field: 'testCases',
      );
    }

    final now = DateTime.now();
    final existingTestCases = await _taskTestCaseDataSource.listByTaskId(
      session,
      task.id!,
      transaction: transaction,
    );
    final existingById = {
      for (final testCase in existingTestCases)
        if (testCase.id != null) testCase.id!: testCase,
    };
    final requestedIds = request.testCases
        .map((testCase) => testCase.id)
        .nonNulls
        .toSet();
    if (!existingById.keys.toSet().containsAll(requestedIds)) {
      throw ValidationException(
        message: 'Task test cases contain foreign ids',
        field: 'testCases',
      );
    }

    final encodedTestCases = <Map<String, dynamic>>[];
    final result = <TaskTestCaseDto>[];
    for (var index = 0; index < request.testCases.length; index++) {
      final input = request.testCases[index];
      final testInput = _requireText(input.input, 'testCases[$index].input');
      final expectedOutput = _requireText(
        input.expectedOutput,
        'testCases[$index].expectedOutput',
      );
      encodedTestCases.add({
        'input': testInput,
        'expectedOutput': expectedOutput,
        'isHidden': input.isHidden,
      });

      if (input.id == null) {
        final inserted = await _taskTestCaseDataSource.insert(
          session,
          taskId: task.id!,
          input: testInput,
          expectedOutput: expectedOutput,
          isHidden: input.isHidden,
          orderIndex: index,
          updatedAt: now,
          transaction: transaction,
        );
        result.add(inserted.toTaskTestCaseDto());
        continue;
      }

      final existing = existingById[input.id]!;
      final updated = await _taskTestCaseDataSource.updateRow(
        session,
        existing.copyWith(
          input: testInput,
          expectedOutput: expectedOutput,
          isHidden: input.isHidden,
          orderIndex: index,
          updatedAt: now,
        ),
        transaction: transaction,
      );
      result.add(updated.toTaskTestCaseDto());
    }

    final idsToDelete = existingById.keys
        .toSet()
        .difference(requestedIds)
        .cast<int>();
    await _taskTestCaseDataSource.deleteByIds(
      session,
      idsToDelete,
      transaction: transaction,
    );

    await _taskDataSource.updateRow(
      session,
      task.copyWith(
        testCasesJson: jsonEncode(encodedTestCases),
        updatedAt: now,
      ),
      transaction: transaction,
    );
    await _touchLessonAncestorsByTask(
      session,
      task.id!,
      now,
      transaction: transaction,
    );

    return result;
  }

  Future<CourseDto> _setCoursePublication(
    Session session,
    int courseId, {
    required ContentStatus contentStatus,
    required DateTime? publishedAt,
    Transaction? transaction,
  }) async {
    final course = await _requireCourse(
      session,
      courseId,
      transaction: transaction,
    );
    final updated = await _courseDataSource.updateRow(
      session,
      course.copyWith(
        contentStatus: contentStatus,
        publishedAt: publishedAt,
        updatedAt: DateTime.now(),
      ),
      transaction: transaction,
    );
    final counts = await _countCourseContent(
      session,
      updated.id!,
      transaction: transaction,
    );
    return updated.toCourseDto(
      totalLessons: counts.totalLessons,
      totalTasks: counts.totalTasks,
    );
  }

  Future<TaskDto> _buildTaskDto(
    Session session,
    Task task, {
    Transaction? transaction,
  }) async {
    final options = await _taskOptionDataSource.listByTaskId(
      session,
      task.id!,
      transaction: transaction,
    );
    final testCases = await _taskTestCaseDataSource.listByTaskId(
      session,
      task.id!,
      transaction: transaction,
    );

    return task.toTaskDto(
      options: options.map((option) => option.toTaskOptionDto()).toList(),
      testCases: testCases
          .map((testCase) => testCase.toTaskTestCaseDto())
          .toList(),
    );
  }

  Future<List<TaskDto>> _buildTaskDtosForLesson(
    Session session,
    int lessonId, {
    Transaction? transaction,
  }) async {
    final tasks = await _taskDataSource.listByLessonId(
      session,
      lessonId,
      transaction: transaction,
    );
    return _buildTaskDtos(session, tasks, transaction: transaction);
  }

  Future<List<TaskDto>> _buildTaskDtos(
    Session session,
    List<Task> tasks, {
    Transaction? transaction,
  }) async {
    if (tasks.isEmpty) {
      return [];
    }

    final taskIds = tasks.map((task) => task.id!).toList();
    final options = await _taskOptionDataSource.listByTaskIds(
      session,
      taskIds,
      transaction: transaction,
    );
    final testCases = await _taskTestCaseDataSource.listByTaskIds(
      session,
      taskIds,
      transaction: transaction,
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

    return tasks
        .map(
          (task) => task.toTaskDto(
            options: optionsByTaskId[task.id!] ?? const [],
            testCases: testCasesByTaskId[task.id!] ?? const [],
          ),
        )
        .toList();
  }

  Future<_CourseContentCounts> _countCourseContent(
    Session session,
    int courseId, {
    Transaction? transaction,
  }) async {
    final modules = await _moduleDataSource.listByCourseId(
      session,
      courseId,
      transaction: transaction,
    );
    final moduleIds = modules.map((module) => module.id!).toList();
    final lessons = await _lessonDataSource.listByModuleIds(
      session,
      moduleIds,
      transaction: transaction,
    );
    final lessonIds = lessons.map((lesson) => lesson.id!).toList();
    final tasks = await _taskDataSource.listByLessonIds(
      session,
      lessonIds,
      transaction: transaction,
    );
    return _CourseContentCounts(
      totalLessons: lessons.length,
      totalTasks: tasks.length,
    );
  }

  Future<Course> _requireCourse(
    Session session,
    int courseId, {
    Transaction? transaction,
  }) async {
    final course = await _courseDataSource.findById(
      session,
      courseId,
      transaction: transaction,
    );
    if (course == null) {
      throw NotFoundException(message: 'Course not found');
    }
    return course;
  }

  Future<Module> _requireModule(
    Session session,
    int moduleId, {
    Transaction? transaction,
  }) async {
    final module = await _moduleDataSource.findById(
      session,
      moduleId,
      transaction: transaction,
    );
    if (module == null) {
      throw NotFoundException(message: 'Module not found');
    }
    return module;
  }

  Future<Lesson> _requireLesson(
    Session session,
    int lessonId, {
    Transaction? transaction,
  }) async {
    final lesson = await _lessonDataSource.findById(
      session,
      lessonId,
      transaction: transaction,
    );
    if (lesson == null) {
      throw NotFoundException(message: 'Lesson not found');
    }
    return lesson;
  }

  Future<Task> _requireTask(
    Session session,
    int taskId, {
    Transaction? transaction,
  }) async {
    final task = await _taskDataSource.findById(
      session,
      taskId,
      transaction: transaction,
    );
    if (task == null) {
      throw NotFoundException(message: 'Task not found');
    }
    return task;
  }

  Future<void> _touchCourse(
    Session session,
    int courseId,
    DateTime timestamp, {
    Transaction? transaction,
  }) async {
    final course = await _requireCourse(
      session,
      courseId,
      transaction: transaction,
    );
    await _courseDataSource.updateRow(
      session,
      course.copyWith(updatedAt: timestamp),
      transaction: transaction,
    );
  }

  Future<void> _touchAncestorsForModule(
    Session session,
    int courseId,
    int moduleId,
    DateTime timestamp, {
    Transaction? transaction,
  }) async {
    final module = await _requireModule(
      session,
      moduleId,
      transaction: transaction,
    );
    await _moduleDataSource.updateRow(
      session,
      module.copyWith(updatedAt: timestamp),
      transaction: transaction,
    );
    await _touchCourse(session, courseId, timestamp, transaction: transaction);
  }

  Future<void> _touchAncestorsForLesson(
    Session session,
    int courseId,
    int moduleId,
    int lessonId,
    DateTime timestamp, {
    Transaction? transaction,
  }) async {
    final lesson = await _requireLesson(
      session,
      lessonId,
      transaction: transaction,
    );
    await _lessonDataSource.updateRow(
      session,
      lesson.copyWith(updatedAt: timestamp),
      transaction: transaction,
    );
    await _touchAncestorsForModule(
      session,
      courseId,
      moduleId,
      timestamp,
      transaction: transaction,
    );
  }

  Future<void> _touchLessonAncestorsByTask(
    Session session,
    int taskId,
    DateTime timestamp, {
    Transaction? transaction,
  }) async {
    final task = await _requireTask(session, taskId, transaction: transaction);
    final lesson = await _requireLesson(
      session,
      task.lessonId,
      transaction: transaction,
    );
    final module = await _requireModule(
      session,
      lesson.moduleId,
      transaction: transaction,
    );
    await _touchAncestorsForLesson(
      session,
      module.courseId,
      module.id!,
      lesson.id!,
      timestamp,
      transaction: transaction,
    );
  }

  void _validateFullReorder({
    required List<int> expectedIds,
    required List<int> actualIds,
    required String field,
  }) {
    final expected = expectedIds.toSet();
    final actual = actualIds.toSet();
    if (actualIds.length != actual.length) {
      throw ValidationException(
        message: 'Reorder payload contains duplicate ids',
        field: field,
      );
    }
    if (expected.length != actual.length ||
        !expected.containsAll(actual) ||
        !actual.containsAll(expected)) {
      throw ValidationException(
        message: 'Reorder payload must contain the full set of child ids',
        field: field,
      );
    }
  }

  String _requireText(String value, String field) {
    final normalized = value.trim();
    if (normalized.isEmpty) {
      throw ValidationException(
        message: 'Field is required',
        field: field,
      );
    }
    return normalized;
  }

  String? _normalizeOptionalText(String? value) {
    if (value == null) {
      return null;
    }
    final normalized = value.trim();
    return normalized.isEmpty ? null : normalized;
  }

  String? _normalizeOptionalUrl(String? value, String field) {
    final normalized = _normalizeOptionalText(value);
    if (normalized == null) {
      return null;
    }

    final uri = Uri.tryParse(normalized);
    if (uri == null ||
        !uri.hasScheme ||
        !(uri.scheme == 'http' || uri.scheme == 'https')) {
      throw ValidationException(
        message: 'Field must contain a valid http or https URL',
        field: field,
      );
    }
    return normalized;
  }

  String? _normalizeImageUrls(String? value) {
    final normalized = _normalizeOptionalText(value);
    if (normalized == null) {
      return null;
    }

    final decoded = jsonDecode(normalized);
    if (decoded is! List) {
      throw ValidationException(
        message: 'imageUrls must be a JSON array of URLs',
        field: 'imageUrls',
      );
    }

    final normalizedUrls = <String>[];
    for (final item in decoded) {
      if (item is! String) {
        throw ValidationException(
          message: 'imageUrls must contain only string URLs',
          field: 'imageUrls',
        );
      }
      normalizedUrls.add(
        _normalizeOptionalUrl(item, 'imageUrls')!,
      );
    }

    return jsonEncode(normalizedUrls);
  }
}

class _CourseContentCounts {
  final int totalLessons;
  final int totalTasks;

  const _CourseContentCounts({
    required this.totalLessons,
    required this.totalTasks,
  });
}
