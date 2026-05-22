import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/auth_scopes.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class TaskAdminEndpoint extends Endpoint {
  Future<List<TaskDto>> list(Session session, int lessonId) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.listAdminTasksUseCase.execute(
      session,
      lessonId,
    );
  }

  Future<TaskDto> create(Session session, CreateTaskRequest request) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.createAdminTaskUseCase.execute(
      session,
      request,
    );
  }

  Future<TaskDto> update(Session session, UpdateTaskRequest request) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.updateAdminTaskUseCase.execute(
      session,
      request,
    );
  }

  Future<List<TaskDto>> reorder(
    Session session,
    ReorderTasksRequest request,
  ) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.reorderAdminTasksUseCase.execute(
      session,
      request,
    );
  }

  Future<List<TaskOptionDto>> upsertOptions(
    Session session,
    UpsertTaskOptionsRequest request,
  ) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.upsertAdminTaskOptionsUseCase.execute(
      session,
      request,
    );
  }

  Future<List<TaskTestCaseDto>> upsertTestCases(
    Session session,
    UpsertTaskTestCasesRequest request,
  ) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.upsertAdminTaskTestCasesUseCase.execute(
      session,
      request,
    );
  }
}
