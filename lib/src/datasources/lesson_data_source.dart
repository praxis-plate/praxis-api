import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class LessonDataSource {
  const LessonDataSource();

  Future<List<Lesson>> listByModuleId(Session session, int moduleId) {
    return Lesson.db.find(
      session,
      where: (t) => t.moduleId.equals(moduleId),
      orderBy: (t) => t.orderIndex,
    );
  }

  Future<List<Lesson>> listByModuleIds(
    Session session,
    List<int> moduleIds,
  ) {
    if (moduleIds.isEmpty) {
      return Future.value([]);
    }
    return Lesson.db.find(
      session,
      where: (t) => t.moduleId.inSet(moduleIds.toSet()),
      orderBy: (t) => t.orderIndex,
    );
  }

  Future<Lesson?> findById(Session session, int id) {
    return Lesson.db.findById(session, id);
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
    required DateTime createdAt,
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
      createdAt: createdAt,
    );

    return Lesson.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }
}
