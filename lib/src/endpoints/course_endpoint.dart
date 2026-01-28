import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/task_data_source.dart';
import 'package:praxis_server/src/datasources/task_option_data_source.dart';
import 'package:praxis_server/src/datasources/task_test_case_data_source.dart';
import 'package:praxis_server/src/datasources/user_course_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/course/course_service.dart';
import 'package:praxis_server/src/services/task/task_service.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class CourseEndpoint extends Endpoint {
  CourseEndpoint()
    : _courseService = CourseService(
        courseDataSource: const CourseDataSource(),
        moduleDataSource: const ModuleDataSource(),
        lessonDataSource: const LessonDataSource(),
        taskDataSource: const TaskDataSource(),
        userCourseDataSource: const UserCourseDataSource(),
        taskService: TaskService(
          taskDataSource: const TaskDataSource(),
          taskOptionDataSource: const TaskOptionDataSource(),
          taskTestCaseDataSource: const TaskTestCaseDataSource(),
        ),
      );

  final CourseService _courseService;

  Future<List<CourseDto>> get(
    Session session, {
    required int limit,
    required int offset,
  }) {
    return _courseService.getCourses(
      session,
      limit: limit,
      offset: offset,
    );
  }

  Future<CourseDetailDto> getById(Session session, int courseId) {
    return _courseService.getCourseById(session, courseId);
  }

  Future<List<CourseDto>> getEnrolled(Session session) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return _courseService.getEnrolledCourses(
      session,
      authUserId: authUserId,
    );
  }

  Future<void> enroll(Session session, int courseId) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return _courseService.enroll(
      session,
      courseId,
      authUserId: authUserId,
    );
  }

  Future<void> unenroll(Session session, int courseId) {
    final authUserId = AuthUtils.getAuthUserId(session);
    return _courseService.unenroll(
      session,
      courseId,
      authUserId: authUserId,
    );
  }

  Future<CourseStructureDto> getTableOfContents(Session session, int courseId) {
    return _courseService.getCourseStructure(session, courseId);
  }
}
