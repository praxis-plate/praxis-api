import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class LessonDataSource {
  const LessonDataSource();

  Future<List<Lesson>> listByModuleId(
    Session session,
    int moduleId, {
    Transaction? transaction,
  }) {
    return Lesson.db.find(
      session,
      where: (t) => t.moduleId.equals(moduleId),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<List<Lesson>> listByModuleIds(
    Session session,
    List<int> moduleIds, {
    Transaction? transaction,
  }) {
    if (moduleIds.isEmpty) {
      return Future.value([]);
    }
    return Lesson.db.find(
      session,
      where: (t) => t.moduleId.inSet(moduleIds.toSet()),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<Lesson?> findById(
    Session session,
    int id, {
    Transaction? transaction,
  }) {
    return Lesson.db.findById(session, id, transaction: transaction);
  }

  Future<List<Lesson>> listByIds(
    Session session,
    List<int> lessonIds, {
    Transaction? transaction,
  }) {
    if (lessonIds.isEmpty) {
      return Future.value([]);
    }

    return Lesson.db.find(
      session,
      where: (t) => t.id.inSet(lessonIds.toSet()),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<Lesson> insert(
    Session session, {
    required int moduleId,
    required String title,
    required String contentText,
    String? videoUrl,
    String? imageUrls,
    required int orderIndex,
    required int durationMinutes,
    required int completionXp,
    required DateTime createdAt,
    required DateTime updatedAt,
    Transaction? transaction,
  }) {
    final row = Lesson(
      moduleId: moduleId,
      title: title,
      contentText: contentText,
      videoUrl: videoUrl,
      imageUrls: imageUrls,
      orderIndex: orderIndex,
      durationMinutes: durationMinutes,
      completionXp: completionXp,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

    return Lesson.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<Lesson> updateRow(
    Session session,
    Lesson row, {
    Transaction? transaction,
  }) {
    return Lesson.db.updateRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<void> deleteByIds(
    Session session,
    Set<int> lessonIds, {
    Transaction? transaction,
  }) async {
    if (lessonIds.isEmpty) {
      return;
    }
    await Lesson.db.deleteWhere(
      session,
      where: (t) => t.id.inSet(lessonIds),
      transaction: transaction,
    );
  }
}
