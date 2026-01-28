import 'package:praxis_server/src/app_services_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ModuleEndpoint extends Endpoint {
  Future<List<ModuleDto>> get(Session session, int courseId) {
    return session.server.services.moduleService.getByCourseId(
      session,
      courseId,
    );
  }
}
