import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/auth_scopes.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class LessonAdminEndpoint extends Endpoint {
  Future<List<LessonDto>> list(Session session, int moduleId) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.listAdminLessonsUseCase.execute(
      session,
      moduleId,
    );
  }

  Future<LessonDto> create(Session session, CreateLessonRequest request) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.createAdminLessonUseCase.execute(
      session,
      request,
    );
  }

  Future<LessonDto> update(Session session, UpdateLessonRequest request) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.updateAdminLessonUseCase.execute(
      session,
      request,
    );
  }

  Future<List<LessonDto>> reorder(
    Session session,
    ReorderLessonsRequest request,
  ) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.reorderAdminLessonsUseCase.execute(
      session,
      request,
    );
  }
}
