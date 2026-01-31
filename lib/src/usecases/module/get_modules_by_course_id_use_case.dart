import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/module/module_service.dart';
import 'package:serverpod/serverpod.dart';

class GetModulesByCourseIdUseCase {
  final ModuleService _moduleService;

  GetModulesByCourseIdUseCase({required ModuleService moduleService})
    : _moduleService = moduleService;

  Future<List<ModuleDto>> execute(Session session, int courseId) {
    return _moduleService.getByCourseId(session, courseId);
  }
}
