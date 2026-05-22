import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TaskDataSource {
  const TaskDataSource();

  Future<List<Task>> listByLessonId(
    Session session,
    int lessonId, {
    Transaction? transaction,
  }) {
    return Task.db.find(
      session,
      where: (t) => t.lessonId.equals(lessonId),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<List<Task>> listByLessonIds(
    Session session,
    List<int> lessonIds, {
    Transaction? transaction,
  }) {
    if (lessonIds.isEmpty) {
      return Future.value([]);
    }
    return Task.db.find(
      session,
      where: (t) => t.lessonId.inSet(lessonIds.toSet()),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<Task?> findById(
    Session session,
    int id, {
    Transaction? transaction,
  }) {
    return Task.db.findById(session, id, transaction: transaction);
  }

  Future<List<Task>> listByIds(
    Session session,
    List<int> taskIds, {
    Transaction? transaction,
  }) {
    if (taskIds.isEmpty) {
      return Future.value([]);
    }

    return Task.db.find(
      session,
      where: (t) => t.id.inSet(taskIds.toSet()),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<Task> insert(
    Session session, {
    required int lessonId,
    required TaskType taskType,
    required String questionText,
    required String correctAnswer,
    String? optionsJson,
    String? codeTemplate,
    String? testCasesJson,
    String? programmingLanguage,
    required int difficultyLevel,
    required int xpValue,
    required int orderIndex,
    String? fallbackHint,
    String? fallbackExplanation,
    required String topic,
    required DateTime createdAt,
    required DateTime updatedAt,
    Transaction? transaction,
  }) {
    final row = Task(
      lessonId: lessonId,
      taskType: taskType,
      questionText: questionText,
      correctAnswer: correctAnswer,
      optionsJson: optionsJson,
      codeTemplate: codeTemplate,
      testCasesJson: testCasesJson,
      programmingLanguage: programmingLanguage,
      difficultyLevel: difficultyLevel,
      xpValue: xpValue,
      orderIndex: orderIndex,
      fallbackHint: fallbackHint,
      fallbackExplanation: fallbackExplanation,
      topic: topic,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

    return Task.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<Task> updateRow(
    Session session,
    Task row, {
    Transaction? transaction,
  }) {
    return Task.db.updateRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<void> deleteByIds(
    Session session,
    Set<int> taskIds, {
    Transaction? transaction,
  }) async {
    if (taskIds.isEmpty) {
      return;
    }
    await Task.db.deleteWhere(
      session,
      where: (t) => t.id.inSet(taskIds),
      transaction: transaction,
    );
  }
}
