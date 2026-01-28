import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/mappers/learning_content_mapper.dart';
import 'package:serverpod/serverpod.dart';

class ModuleService {
  final ModuleDataSource _moduleDataSource;

  ModuleService({required ModuleDataSource moduleDataSource})
    : _moduleDataSource = moduleDataSource;

  Future<List<ModuleDto>> getByCourseId(Session session, int courseId) async {
    final modules = await _moduleDataSource.listByCourseId(session, courseId);
    return modules.map((module) => module.toModuleDto()).toList();
  }
}
