import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ModuleEndpoint extends Endpoint {
  Future<List<ModuleDto>> get(Session session, int courseId) {
    return session.server.useCases.getModulesByCourseIdUseCase.execute(
      session,
      courseId,
    );
  }
}
