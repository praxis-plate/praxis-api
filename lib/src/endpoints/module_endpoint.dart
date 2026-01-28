import 'package:praxis_server/src/datasources/module_data_source.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/module/module_service.dart';
import 'package:serverpod/serverpod.dart';

class ModuleEndpoint extends Endpoint {
  ModuleEndpoint()
    : _moduleService = ModuleService(
        moduleDataSource: const ModuleDataSource(),
      );

  final ModuleService _moduleService;

  Future<List<ModuleDto>> get(Session session, int courseId) {
    return _moduleService.getByCourseId(session, courseId);
  }
}
