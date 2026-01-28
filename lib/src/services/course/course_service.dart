import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/user_course_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/task_service.dart';
import 'package:praxis_server/src/shared/mappers/learning_content_mapper.dart';
import 'package:serverpod/serverpod.dart';

class CourseService {
  final CourseDataSource _courseDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonDataSource _lessonDataSource;
  final TaskDataSource _taskDataSource;
  final UserCourseDataSource _userCourseDataSource;
  final TaskService _taskService;

  CourseService({
    required CourseDataSource courseDataSource,
    required ModuleDataSource moduleDataSource,
    required LessonDataSource lessonDataSource,
    required TaskDataSource taskDataSource,
    required UserCourseDataSource userCourseDataSource,
    required TaskService taskService,
  }) : _courseDataSource = courseDataSource,
       _moduleDataSource = moduleDataSource,
       _lessonDataSource = lessonDataSource,
       _taskDataSource = taskDataSource,
       _userCourseDataSource = userCourseDataSource,
       _taskService = taskService;

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

    final result = <CourseDto>[];
    for (final course in courses) {
      final counts = await _countContentForCourse(session, course.id!);
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
    final lessons = lessonEntities.map((lesson) => lesson.toLessonDto()).toList();
    final lessonIds = lessonEntities.map((lesson) => lesson.id!).toList();
    final tasks = await _taskService.getTasksByLessonIds(session, lessonIds);
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

    final result = <CourseDto>[];
    for (final enrollment in enrollments) {
      final course = await _courseDataSource.findById(
        session,
        enrollment.courseId,
      );
      if (course == null) {
        continue;
      }
      final counts = await _countContentForCourse(session, course.id!);
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

  Future<_CourseContentCounts> _countContentForCourse(
    Session session,
    int courseId,
  ) async {
    final modules = await _moduleDataSource.listByCourseId(session, courseId);
    if (modules.isEmpty) {
      return const _CourseContentCounts(totalLessons: 0, totalTasks: 0);
    }

    final moduleIds = modules.map((module) => module.id!).toList();
    final lessonEntities = await _lessonDataSource.listByModuleIds(
      session,
      moduleIds,
    );
    if (lessonEntities.isEmpty) {
      return const _CourseContentCounts(totalLessons: 0, totalTasks: 0);
    }

    final lessonIds = lessonEntities.map((lesson) => lesson.id!).toList();
    final tasks = await _taskDataSource.listByLessonIds(session, lessonIds);
    return _CourseContentCounts(
      totalLessons: lessonEntities.length,
      totalTasks: tasks.length,
    );
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
