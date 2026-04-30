import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ModuleDataSource {
  const ModuleDataSource();

  Future<List<Module>> listByCourseId(
    Session session,
    int courseId, {
    Transaction? transaction,
  }) {
    return Module.db.find(
      session,
      where: (t) => t.courseId.equals(courseId),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<List<Module>> listByCourseIds(
    Session session,
    List<int> courseIds, {
    Transaction? transaction,
  }) {
    if (courseIds.isEmpty) {
      return Future.value([]);
    }
    return Module.db.find(
      session,
      where: (t) => t.courseId.inSet(courseIds.toSet()),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<Module?> findById(
    Session session,
    int id, {
    Transaction? transaction,
  }) {
    return Module.db.findById(session, id, transaction: transaction);
  }

  Future<List<Module>> listByIds(
    Session session,
    List<int> moduleIds, {
    Transaction? transaction,
  }) {
    if (moduleIds.isEmpty) {
      return Future.value([]);
    }

    return Module.db.find(
      session,
      where: (t) => t.id.inSet(moduleIds.toSet()),
      orderBy: (t) => t.orderIndex,
      transaction: transaction,
    );
  }

  Future<Module> insert(
    Session session, {
    required int courseId,
    required String title,
    required String description,
    required int orderIndex,
    required DateTime createdAt,
    required DateTime updatedAt,
    Transaction? transaction,
  }) {
    final row = Module(
      courseId: courseId,
      title: title,
      description: description,
      orderIndex: orderIndex,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

    return Module.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<Module> updateRow(
    Session session,
    Module row, {
    Transaction? transaction,
  }) {
    return Module.db.updateRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<void> deleteByIds(
    Session session,
    Set<int> moduleIds, {
    Transaction? transaction,
  }) async {
    if (moduleIds.isEmpty) {
      return;
    }
    await Module.db.deleteWhere(
      session,
      where: (t) => t.id.inSet(moduleIds),
      transaction: transaction,
    );
  }
}
