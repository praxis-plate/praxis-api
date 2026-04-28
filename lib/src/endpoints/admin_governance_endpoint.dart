import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/auth_scopes.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class AdminGovernanceEndpoint extends Endpoint {
  Future<List<GovernanceUserDto>> listUsers(Session session) {
    AuthUtils.requireScope(session, AuthScopes.usersManage);
    return session.server.useCases.listGovernanceUsersUseCase.execute(session);
  }

  Future<AccessProfileDto> assignRole(
    Session session, {
    required UuidValue authUserId,
    required UserRole role,
  }) {
    AuthUtils.requireScope(session, AuthScopes.usersManage);
    return session.server.useCases.assignUserRoleUseCase.execute(
      session,
      authUserId: authUserId,
      role: role,
    );
  }

  Future<AccessProfileDto> revokeRole(
    Session session, {
    required UuidValue authUserId,
    required UserRole role,
  }) {
    AuthUtils.requireScope(session, AuthScopes.usersManage);
    return session.server.useCases.revokeUserRoleUseCase.execute(
      session,
      authUserId: authUserId,
      role: role,
    );
  }

  Future<List<CourseDto>> listPublicationQueue(
    Session session, {
    String? query,
    int? limit,
    int? offset,
  }) {
    AuthUtils.requireScope(session, AuthScopes.adminAccess);
    return session.server.useCases.listAdminCoursesUseCase.execute(
      session,
      status: ContentStatus.draft,
      query: query,
      limit: limit,
      offset: offset,
    );
  }

  Future<List<CourseDto>> listPublishedCourses(
    Session session, {
    String? query,
    int? limit,
    int? offset,
  }) {
    AuthUtils.requireScope(session, AuthScopes.adminAccess);
    return session.server.useCases.listAdminCoursesUseCase.execute(
      session,
      status: ContentStatus.published,
      query: query,
      limit: limit,
      offset: offset,
    );
  }

  Future<CourseDto> approvePublication(Session session, int courseId) {
    AuthUtils.requireScope(session, AuthScopes.adminAccess);
    return session.server.useCases.publishAdminCourseUseCase.execute(
      session,
      courseId,
    );
  }

  Future<CourseDto> unpublishCourse(Session session, int courseId) {
    AuthUtils.requireScope(session, AuthScopes.adminAccess);
    return session.server.useCases.unpublishAdminCourseUseCase.execute(
      session,
      courseId,
    );
  }
}
