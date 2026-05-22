import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/auth_scopes.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class CourseAdminEndpoint extends Endpoint {
  Future<List<CourseDto>> list(
    Session session, {
    ContentStatus? status,
    String? query,
    int? limit,
    int? offset,
  }) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.listAdminCoursesUseCase.execute(
      session,
      status: status,
      query: query,
      limit: limit,
      offset: offset,
    );
  }

  Future<CourseDto> create(Session session, CreateCourseRequest request) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.createAdminCourseUseCase.execute(
      session,
      request,
    );
  }

  Future<CourseImportResultDto> importStructured(
    Session session,
    ImportCourseRequest request,
  ) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.importAdminCourseUseCase.execute(
      session,
      request,
    );
  }

  Future<CourseDto> update(Session session, UpdateCourseRequest request) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.updateAdminCourseUseCase.execute(
      session,
      request,
    );
  }

  Future<void> delete(Session session, int courseId) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.deleteAdminCourseUseCase.execute(
      session,
      courseId,
    );
  }

  Future<CourseDto> publish(Session session, int courseId) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.publishAdminCourseUseCase.execute(
      session,
      courseId,
    );
  }

  Future<CourseDto> unpublish(Session session, int courseId) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.unpublishAdminCourseUseCase.execute(
      session,
      courseId,
    );
  }
}
