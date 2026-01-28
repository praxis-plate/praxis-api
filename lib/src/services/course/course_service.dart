import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/task_option_data_source.dart';
import 'package:praxis_server/src/datasources/task_test_case_data_source.dart';
import 'package:praxis_server/src/datasources/user_course_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/course/entities/course_content_counts.dart';
import 'package:praxis_server/src/shared/mappers/learning_content_mapper.dart';
import 'package:serverpod/serverpod.dart';

class CourseService {
  final CourseDataSource _courseDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonDataSource _lessonDataSource;
  final TaskDataSource _taskDataSource;
  final TaskOptionDataSource _taskOptionDataSource;
  final TaskTestCaseDataSource _taskTestCaseDataSource;
  final UserCourseDataSource _userCourseDataSource;

  CourseService({
    required CourseDataSource courseDataSource,
    required ModuleDataSource moduleDataSource,
    required LessonDataSource lessonDataSource,
    required TaskDataSource taskDataSource,
    required TaskOptionDataSource taskOptionDataSource,
    required TaskTestCaseDataSource taskTestCaseDataSource,
    required UserCourseDataSource userCourseDataSource,
  }) : _courseDataSource = courseDataSource,
       _moduleDataSource = moduleDataSource,
       _lessonDataSource = lessonDataSource,
       _taskDataSource = taskDataSource,
       _taskOptionDataSource = taskOptionDataSource,
       _taskTestCaseDataSource = taskTestCaseDataSource,
       _userCourseDataSource = userCourseDataSource;

  Future<List<CourseDto>> getCourses(
    Session session, {
    required int limit,
    required int offset,
  }) async {
    final courses = await _courseDataSource.list(
      session,
      limit: limit,
      offset: offset,
    );

    if (courses.isEmpty) {
      return [];
    }

    final courseIds = courses.map((course) => course.id!).toList();
    final contentCounts = await _countContentForCourses(session, courseIds);

    final result = <CourseDto>[];
    for (final course in courses) {
      final counts =
          contentCounts[course.id!] ?? const CourseContentCounts.empty();
      result.add(
        course.toCourseDto(
          totalLessons: counts.totalLessons,
          totalTasks: counts.totalTasks,
        ),
      );
    }

    return result;
  }

  Future<CourseDetailDto> getCourseById(Session session, int courseId) async {
    final course = await _courseDataSource.findById(session, courseId);
    if (course == null) {
      throw NotFoundException(message: 'Course not found');
    }

    final modules = await _moduleDataSource.listByCourseId(session, courseId);
    final moduleIds = modules.map((module) => module.id!).toList();
    final lessonEntities = await _lessonDataSource.listByModuleIds(
      session,
      moduleIds,
    );
    final lessons = lessonEntities
        .map((lesson) => lesson.toLessonDto())
        .toList();
    final lessonIds = lessonEntities.map((lesson) => lesson.id!).toList();
    final tasks = await _getTasksByLessonIds(session, lessonIds);
    final totalLessons = lessonEntities.length;
    final totalTasks = tasks.length;

    return CourseDetailDto(
      course: course.toCourseDto(
        totalLessons: totalLessons,
        totalTasks: totalTasks,
      ),
      modules: modules.map((module) => module.toModuleDto()).toList(),
      lessons: lessons,
      tasks: tasks,
    );
  }

  Future<List<CourseDto>> getEnrolledCourses(
    Session session, {
    required UuidValue authUserId,
  }) async {
    final enrollments = await _userCourseDataSource.listByAuthUserId(
      session,
      authUserId,
    );

    if (enrollments.isEmpty) {
      return [];
    }

    final courseIds = enrollments
        .map((enrollment) => enrollment.courseId)
        .toList();
    final courses = await _courseDataSource.listByIds(session, courseIds);
    final coursesById = <int, Course>{
      for (final course in courses) course.id!: course,
    };
    final contentCounts = await _countContentForCourses(session, courseIds);

    final result = <CourseDto>[];
    for (final enrollment in enrollments) {
      final course = coursesById[enrollment.courseId];
      if (course == null) {
        continue;
      }
      final counts =
          contentCounts[course.id!] ?? const CourseContentCounts.empty();
      result.add(
        course.toCourseDto(
          totalLessons: counts.totalLessons,
          totalTasks: counts.totalTasks,
        ),
      );
    }

    return result;
  }

  Future<void> enroll(
    Session session,
    int courseId, {
    required UuidValue authUserId,
  }) async {
    final existing = await _userCourseDataSource.findByAuthUserAndCourse(
      session,
      authUserId,
      courseId,
    );
    if (existing != null) {
      return;
    }

    await _userCourseDataSource.insert(
      session,
      authUserId: authUserId,
      courseId: courseId,
      enrolledAt: DateTime.now(),
      isCompleted: false,
    );
  }

  Future<void> unenroll(
    Session session,
    int courseId, {
    required UuidValue authUserId,
  }) async {
    final existing = await _userCourseDataSource.findByAuthUserAndCourse(
      session,
      authUserId,
      courseId,
    );
    if (existing == null) {
      return;
    }

    await _userCourseDataSource.deleteById(session, existing.id!);
  }

  Future<CourseStructureDto> getCourseStructure(
    Session session,
    int courseId,
  ) async {
    final course = await _courseDataSource.findById(session, courseId);
    if (course == null) {
      throw NotFoundException(message: 'Course not found');
    }

    final modules = await _moduleDataSource.listByCourseId(session, courseId);
    final moduleIds = modules.map((module) => module.id!).toList();
    final lessonEntities = await _lessonDataSource.listByModuleIds(
      session,
      moduleIds,
    );
    final lessonIds = lessonEntities.map((lesson) => lesson.id!).toList();
    final taskEntities = await _taskDataSource.listByLessonIds(
      session,
      lessonIds,
    );

    final lessonsByModuleId = <int, List<Lesson>>{};
    for (final lesson in lessonEntities) {
      final list = lessonsByModuleId.putIfAbsent(lesson.moduleId, () => []);
      list.add(lesson);
    }
    for (final lessons in lessonsByModuleId.values) {
      lessons.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    }

    final tasksByLessonId = <int, List<Task>>{};
    for (final task in taskEntities) {
      final list = tasksByLessonId.putIfAbsent(task.lessonId, () => []);
      list.add(task);
    }
    for (final tasks in tasksByLessonId.values) {
      tasks.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    }

    final structureModules = <CourseStructureModuleDto>[];
    for (final module in modules) {
      final lessons = lessonsByModuleId[module.id!] ?? const [];
      final structureLessons = lessons
          .map(
            (lesson) => CourseStructureLessonDto(
              id: lesson.id!,
              title: lesson.title,
              orderIndex: lesson.orderIndex,
              durationMinutes: lesson.durationMinutes,
              tasks: (tasksByLessonId[lesson.id!] ?? const [])
                  .map(
                    (task) => CourseStructureTaskDto(
                      id: task.id!,
                      taskType: task.taskType,
                      questionText: task.questionText,
                      orderIndex: task.orderIndex,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList();

      structureModules.add(
        CourseStructureModuleDto(
          id: module.id!,
          title: module.title,
          description: module.description,
          orderIndex: module.orderIndex,
          lessons: structureLessons,
        ),
      );
    }

    return CourseStructureDto(
      courseId: course.id!,
      title: course.title,
      modules: structureModules,
    );
  }

  Future<Map<int, CourseContentCounts>> _countContentForCourses(
    Session session,
    List<int> courseIds,
  ) async {
    if (courseIds.isEmpty) {
      return {};
    }

    final totalLessonsByCourse = <int, int>{};
    final totalTasksByCourse = <int, int>{};

    final modules = await _moduleDataSource.listByCourseIds(
      session,
      courseIds,
    );
    if (modules.isEmpty) {
      return _buildContentCounts(totalLessonsByCourse, totalTasksByCourse);
    }

    final moduleIds = modules.map((module) => module.id!).toList();
    final moduleToCourseId = <int, int>{
      for (final module in modules) module.id!: module.courseId,
    };

    final lessonEntities = await _lessonDataSource.listByModuleIds(
      session,
      moduleIds,
    );
    if (lessonEntities.isEmpty) {
      return _buildContentCounts(totalLessonsByCourse, totalTasksByCourse);
    }

    final lessonIds = <int>[];
    final lessonToCourseId = <int, int>{};
    for (final lesson in lessonEntities) {
      final courseId = moduleToCourseId[lesson.moduleId];
      if (courseId == null) {
        continue;
      }
      totalLessonsByCourse[courseId] =
          (totalLessonsByCourse[courseId] ?? 0) + 1;
      lessonIds.add(lesson.id!);
      lessonToCourseId[lesson.id!] = courseId;
    }

    final tasks = await _taskDataSource.listByLessonIds(session, lessonIds);
    for (final task in tasks) {
      final courseId = lessonToCourseId[task.lessonId];
      if (courseId == null) {
        continue;
      }
      totalTasksByCourse[courseId] = (totalTasksByCourse[courseId] ?? 0) + 1;
    }

    return _buildContentCounts(totalLessonsByCourse, totalTasksByCourse);
  }

  Map<int, CourseContentCounts> _buildContentCounts(
    Map<int, int> totalLessonsByCourse,
    Map<int, int> totalTasksByCourse,
  ) {
    final result = <int, CourseContentCounts>{};
    for (final courseId in totalLessonsByCourse.keys) {
      result[courseId] = CourseContentCounts(
        totalLessons: totalLessonsByCourse[courseId] ?? 0,
        totalTasks: totalTasksByCourse[courseId] ?? 0,
      );
    }
    return result;
  }

  Future<List<TaskDto>> _getTasksByLessonIds(
    Session session,
    List<int> lessonIds,
  ) async {
    if (lessonIds.isEmpty) {
      return [];
    }

    final tasks = await _taskDataSource.listByLessonIds(session, lessonIds);
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
}
