import 'package:praxis_server/src/services/lesson/lesson_service.dart';
import 'package:praxis_server/src/shared/transaction_runner.dart';
import 'package:serverpod/serverpod.dart';

class MarkLessonCompleteUseCase {
  final LessonService _lessonService;
  final TransactionRunner _transactionRunner;

  MarkLessonCompleteUseCase({
    required LessonService lessonService,
    required TransactionRunner transactionRunner,
  }) : _lessonService = lessonService,
       _transactionRunner = transactionRunner;

  Future<void> execute(
    Session session, {
    required UuidValue authUserId,
    required int lessonId,
    int timeSpentSeconds = 0,
  }) {
    return _transactionRunner.run(
      session,
      (transaction) => _lessonService.markCompleteInTransaction(
        session,
        authUserId: authUserId,
        lessonId: lessonId,
        timeSpentSeconds: timeSpentSeconds,
        transaction: transaction,
      ),
    );
  }
}
