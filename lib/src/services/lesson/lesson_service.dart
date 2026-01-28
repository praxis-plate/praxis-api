import 'package:praxis_server/src/datasources/lesson_data_source.dart';
import 'package:praxis_server/src/datasources/lesson_progress_data_source.dart';
import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/mappers/learning_content_mapper.dart';
import 'package:praxis_server/src/shared/utils/transaction_runner.dart';
import 'package:serverpod/serverpod.dart';

class LessonService {
  final LessonDataSource _lessonDataSource;
  final ModuleDataSource _moduleDataSource;
  final LessonProgressDataSource _lessonProgressDataSource;
  final TransactionRunner _transactionRunner;

  LessonService({
    required LessonDataSource lessonDataSource,
    required ModuleDataSource moduleDataSource,
    required LessonProgressDataSource lessonProgressDataSource,
    required TransactionRunner transactionRunner,
  }) : _lessonDataSource = lessonDataSource,
       _moduleDataSource = moduleDataSource,
       _lessonProgressDataSource = lessonProgressDataSource,
       _transactionRunner = transactionRunner;

  Future<List<LessonDto>> getByModuleId(
    Session session,
    int moduleId,
  ) async {
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
    final modules = await _moduleDataSource.listByCourseId(
      session,
      courseId,
    );
    final lessons = <LessonDto>[];
    for (final module in modules) {
      final moduleLessons = await _lessonDataSource.listByModuleId(
        session,
        module.id!,
      );
      lessons.addAll(moduleLessons.map((lesson) => lesson.toLessonDto()));
    }

    return lessons;
  }

  Future<void> markComplete(
    Session session, {
    required UuidValue authUserId,
    required int lessonId,
    int timeSpentSeconds = 0,
    Transaction? transaction,
  }) async {
    return _transactionRunner.run(
      session,
      (transaction) async {
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
          return;
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
      },
      transaction: transaction,
    );
  }
}
