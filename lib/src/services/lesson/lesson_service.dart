import 'package:praxis_server/src/datasources/course_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_progress_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/datasources/user_course_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/mappers/learning_content_mapper.dart';
import 'package:praxis_server/src/shared/utils/transaction_runner.dart';
import 'package:serverpod/serverpod.dart';

class LessonCompletionMarkResult {
  final Lesson lesson;
  final int courseId;
  final bool isFirstCompletion;

  const LessonCompletionMarkResult({
    required this.lesson,
    required this.courseId,
    required this.isFirstCompletion,
  });
}

class LessonService {
  final CourseDataSource _courseDataSource;
  final LessonDataSource _lessonDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonProgressDataSource _lessonProgressDataSource;
  final UserCourseDataSource _userCourseDataSource;
  final TransactionRunner _transactionRunner;

  LessonService({
    required CourseDataSource courseDataSource,
    required LessonDataSource lessonDataSource,
    required ModuleDataSource moduleDataSource,
    required LessonProgressDataSource lessonProgressDataSource,
    required UserCourseDataSource userCourseDataSource,
    required TransactionRunner transactionRunner,
  }) : _courseDataSource = courseDataSource,
       _lessonDataSource = lessonDataSource,
       _moduleDataSource = moduleDataSource,
       _lessonProgressDataSource = lessonProgressDataSource,
       _userCourseDataSource = userCourseDataSource,
       _transactionRunner = transactionRunner;

  Future<List<LessonDto>> getByModuleId(
    Session session,
    int moduleId,
  ) async {
    final module = await _moduleDataSource.findById(session, moduleId);
    if (module == null) {
      return [];
    }
    final course = await _courseDataSource.findPublishedById(
      session,
      module.courseId,
    );
    if (course == null) {
      return [];
    }

    final lessons = await _lessonDataSource.listByModuleId(
      session,
      moduleId,
    );
    return lessons.map((lesson) => lesson.toLessonDto()).toList();
  }

  Future<List<LessonDto>> getByCourseId(
    Session session,
    int courseId,
  ) async {
    final course = await _courseDataSource.findPublishedById(session, courseId);
    if (course == null) {
      return [];
    }

    final modules = await _moduleDataSource.listByCourseId(
      session,
      courseId,
    );

    if (modules.isEmpty) {
      return [];
    }

    final moduleIds = modules.map((module) => module.id!).toList();
    final lessons = await _lessonDataSource.listByModuleIds(
      session,
      moduleIds,
    );

    return lessons.map((lesson) => lesson.toLessonDto()).toList();
  }

  Future<LessonDto> getById(
    Session session,
    int lessonId,
  ) async {
    final lesson = await _lessonDataSource.findById(session, lessonId);
    if (lesson == null) {
      throw NotFoundException(message: 'Lesson not found');
    }
    final module = await _moduleDataSource.findById(session, lesson.moduleId);
    if (module == null) {
      throw NotFoundException(message: 'Lesson not found');
    }
    final course = await _courseDataSource.findPublishedById(
      session,
      module.courseId,
    );
    if (course == null) {
      throw NotFoundException(message: 'Lesson not found');
    }

    return lesson.toLessonDto();
  }

  Future<List<LessonProgress>> getProgressByCourseId(
    Session session, {
    required UuidValue authUserId,
    required int courseId,
  }) async {
    final course = await _courseDataSource.findPublishedById(session, courseId);
    if (course == null) {
      throw NotFoundException(message: 'Course not found');
    }

    final modules = await _moduleDataSource.listByCourseId(session, courseId);
    if (modules.isEmpty) {
      return [];
    }

    final moduleIds = modules.map((module) => module.id!).toList();
    final lessons = await _lessonDataSource.listByModuleIds(session, moduleIds);
    if (lessons.isEmpty) {
      return [];
    }

    final lessonIds = lessons.map((lesson) => lesson.id!).toList();
    return _lessonProgressDataSource.listByAuthUserIdAndLessonIds(
      session,
      authUserId,
      lessonIds,
    );
  }

  Future<LessonCompletionMarkResult> markComplete(
    Session session, {
    required UuidValue authUserId,
    required int lessonId,
    int timeSpentSeconds = 0,
    Transaction? transaction,
  }) async {
    return _transactionRunner.run(
      session,
      (transaction) async {
        final lesson = await _lessonDataSource.findById(
          session,
          lessonId,
          transaction: transaction,
        );
        if (lesson == null) {
          throw NotFoundException(message: 'Lesson not found');
        }
        final module = await _moduleDataSource.findById(
          session,
          lesson.moduleId,
          transaction: transaction,
        );
        if (module == null) {
          throw NotFoundException(message: 'Lesson not found');
        }
        final course = await _courseDataSource.findPublishedById(
          session,
          module.courseId,
          transaction: transaction,
        );
        if (course == null) {
          throw NotFoundException(message: 'Lesson not found');
        }

        final existing = await _lessonProgressDataSource
            .findByAuthUserIdAndLessonId(
              session,
              authUserId,
              lessonId,
              transaction: transaction,
            );

        if (existing != null) {
          await _lessonProgressDataSource.updateById(
            session,
            existing.id!,
            isCompleted: true,
            completedAt: DateTime.now(),
            timeSpentSeconds: timeSpentSeconds,
            transaction: transaction,
          );
          return LessonCompletionMarkResult(
            lesson: lesson,
            courseId: course.id!,
            isFirstCompletion: !existing.isCompleted,
          );
        }

        await _lessonProgressDataSource.insert(
          session,
          authUserId: authUserId,
          lessonId: lessonId,
          isCompleted: true,
          completedAt: DateTime.now(),
          timeSpentSeconds: timeSpentSeconds,
          transaction: transaction,
        );
        return LessonCompletionMarkResult(
          lesson: lesson,
          courseId: course.id!,
          isFirstCompletion: true,
        );
      },
      transaction: transaction,
    );
  }

  Future<bool> syncCourseCompletion(
    Session session, {
    required UuidValue authUserId,
    required int courseId,
    Transaction? transaction,
  }) async {
    final enrollment = await _userCourseDataSource.findByAuthUserAndCourse(
      session,
      authUserId,
      courseId,
      transaction: transaction,
    );
    if (enrollment == null) {
      return false;
    }

    final modules = await _moduleDataSource.listByCourseId(
      session,
      courseId,
      transaction: transaction,
    );
    if (modules.isEmpty) {
      return false;
    }

    final lessons = await _lessonDataSource.listByModuleIds(
      session,
      modules.map((module) => module.id!).toList(),
      transaction: transaction,
    );
    if (lessons.isEmpty) {
      return false;
    }

    final lessonIds = lessons.map((lesson) => lesson.id!).toList();
    final progress = await _lessonProgressDataSource
        .listByAuthUserIdAndLessonIds(
          session,
          authUserId,
          lessonIds,
          transaction: transaction,
        );
    final completedLessonIds = progress
        .where((item) => item.isCompleted)
        .map((item) => item.lessonId)
        .toSet();
    final isCompleted = completedLessonIds.length == lessonIds.length;

    if (isCompleted && !enrollment.isCompleted) {
      await _userCourseDataSource.updateById(
        session,
        enrollment.id!,
        isCompleted: true,
        completedAt: DateTime.now(),
        transaction: transaction,
      );
    }

    return isCompleted;
  }
}
