import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:praxis_server/src/datasources/base_data_source.dart';

class ModuleDataSource extends BaseDataSource {
  const ModuleDataSource();

  Future<List<Module>> listByCourseId(Session session, int courseId) {
    return Module.db.find(
      session,
      where: (t) => t.courseId.equals(courseId),
      orderBy: (t) => t.orderIndex,
    );
  }

  Future<List<Module>> listByCourseIds(
    Session session,
    List<int> courseIds,
  ) {
    if (courseIds.isEmpty) {
      return Future.value([]);
    }
    return Module.db.find(
      session,
      where: (t) => t.courseId.inSet(courseIds.toSet()),
      orderBy: (t) => t.orderIndex,
    );
  }

  Future<Module?> findById(Session session, int id) {
    return Module.db.findById(session, id);
  }

  Future<Module> insert(
    Session session, {
    required int courseId,
    required String title,
    required String description,
    required int orderIndex,
    required DateTime createdAt,
    Transaction? transaction,
  }) {
    final row = Module(
      courseId: courseId,
      title: title,
      description: description,
      orderIndex: orderIndex,
      createdAt: createdAt,
    );

    return Module.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }
}
