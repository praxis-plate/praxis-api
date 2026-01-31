import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TaskDataSource {
  const TaskDataSource();

  Future<List<Task>> listByLessonId(Session session, int lessonId) {
    return Task.db.find(
      session,
      where: (t) => t.lessonId.equals(lessonId),
      orderBy: (t) => t.orderIndex,
    );
  }

  Future<List<Task>> listByLessonIds(Session session, List<int> lessonIds) {
    if (lessonIds.isEmpty) {
      return Future.value([]);
    }
    return Task.db.find(
      session,
      where: (t) => t.lessonId.inSet(lessonIds.toSet()),
      orderBy: (t) => t.orderIndex,
    );
  }

  Future<Task?> findById(Session session, int id) {
    return Task.db.findById(session, id);
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
    );

    return Task.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }
}
