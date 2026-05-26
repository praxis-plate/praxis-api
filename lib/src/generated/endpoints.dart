/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/access_control_endpoint.dart' as _i2;
import '../endpoints/achievement_endpoint.dart' as _i3;
import '../endpoints/admin_governance_endpoint.dart' as _i4;
import '../endpoints/ai_endpoint.dart' as _i5;
import '../endpoints/cms_media_admin_endpoint.dart' as _i6;
import '../endpoints/course_admin_endpoint.dart' as _i7;
import '../endpoints/course_analytics_admin_endpoint.dart' as _i8;
import '../endpoints/course_endpoint.dart' as _i9;
import '../endpoints/email_idp_endpoint.dart' as _i10;
import '../endpoints/external_integration_admin_endpoint.dart' as _i11;
import '../endpoints/health_endpoint.dart' as _i12;
import '../endpoints/jwt_refresh_endpoint.dart' as _i13;
import '../endpoints/lesson_admin_endpoint.dart' as _i14;
import '../endpoints/lesson_endpoint.dart' as _i15;
import '../endpoints/module_admin_endpoint.dart' as _i16;
import '../endpoints/module_endpoint.dart' as _i17;
import '../endpoints/task_admin_endpoint.dart' as _i18;
import '../endpoints/task_endpoint.dart' as _i19;
import '../endpoints/user_statistics_endpoint.dart' as _i20;
import '../endpoints/wallet_endpoint.dart' as _i21;
import 'package:praxis_server/src/generated/enums/user_role.dart' as _i22;
import 'package:praxis_server/src/generated/requests/generate_hint_request.dart'
    as _i23;
import 'package:praxis_server/src/generated/requests/generate_explanation_request.dart'
    as _i24;
import 'package:praxis_server/src/generated/requests/upload_cms_media_request.dart'
    as _i25;
import 'package:praxis_server/src/generated/enums/content_status.dart' as _i26;
import 'package:praxis_server/src/generated/requests/create_course_request.dart'
    as _i27;
import 'package:praxis_server/src/generated/requests/import_course_request.dart'
    as _i28;
import 'package:praxis_server/src/generated/requests/update_course_request.dart'
    as _i29;
import 'package:praxis_server/src/generated/requests/create_course_review_request.dart'
    as _i30;
import 'package:praxis_server/src/generated/requests/sync_course_to_external_provider_request.dart'
    as _i31;
import 'package:praxis_server/src/generated/requests/provision_external_video_session_request.dart'
    as _i32;
import 'package:praxis_server/src/generated/requests/create_lesson_request.dart'
    as _i33;
import 'package:praxis_server/src/generated/requests/update_lesson_request.dart'
    as _i34;
import 'package:praxis_server/src/generated/requests/reorder_lessons_request.dart'
    as _i35;
import 'package:praxis_server/src/generated/requests/complete_lesson_session_request.dart'
    as _i36;
import 'package:praxis_server/src/generated/requests/create_module_request.dart'
    as _i37;
import 'package:praxis_server/src/generated/requests/update_module_request.dart'
    as _i38;
import 'package:praxis_server/src/generated/requests/reorder_modules_request.dart'
    as _i39;
import 'package:praxis_server/src/generated/requests/create_task_request.dart'
    as _i40;
import 'package:praxis_server/src/generated/requests/update_task_request.dart'
    as _i41;
import 'package:praxis_server/src/generated/requests/reorder_tasks_request.dart'
    as _i42;
import 'package:praxis_server/src/generated/requests/upsert_task_options_request.dart'
    as _i43;
import 'package:praxis_server/src/generated/requests/upsert_task_test_cases_request.dart'
    as _i44;
import 'package:praxis_server/src/generated/requests/create_coin_transaction_request.dart'
    as _i45;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i46;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i47;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'accessControl': _i2.AccessControlEndpoint()
        ..initialize(
          server,
          'accessControl',
          null,
        ),
      'achievement': _i3.AchievementEndpoint()
        ..initialize(
          server,
          'achievement',
          null,
        ),
      'adminGovernance': _i4.AdminGovernanceEndpoint()
        ..initialize(
          server,
          'adminGovernance',
          null,
        ),
      'ai': _i5.AiEndpoint()
        ..initialize(
          server,
          'ai',
          null,
        ),
      'cmsMediaAdmin': _i6.CmsMediaAdminEndpoint()
        ..initialize(
          server,
          'cmsMediaAdmin',
          null,
        ),
      'courseAdmin': _i7.CourseAdminEndpoint()
        ..initialize(
          server,
          'courseAdmin',
          null,
        ),
      'courseAnalyticsAdmin': _i8.CourseAnalyticsAdminEndpoint()
        ..initialize(
          server,
          'courseAnalyticsAdmin',
          null,
        ),
      'course': _i9.CourseEndpoint()
        ..initialize(
          server,
          'course',
          null,
        ),
      'emailIdp': _i10.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'externalIntegrationAdmin': _i11.ExternalIntegrationAdminEndpoint()
        ..initialize(
          server,
          'externalIntegrationAdmin',
          null,
        ),
      'health': _i12.HealthEndpoint()
        ..initialize(
          server,
          'health',
          null,
        ),
      'jwtRefresh': _i13.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'lessonAdmin': _i14.LessonAdminEndpoint()
        ..initialize(
          server,
          'lessonAdmin',
          null,
        ),
      'lesson': _i15.LessonEndpoint()
        ..initialize(
          server,
          'lesson',
          null,
        ),
      'moduleAdmin': _i16.ModuleAdminEndpoint()
        ..initialize(
          server,
          'moduleAdmin',
          null,
        ),
      'module': _i17.ModuleEndpoint()
        ..initialize(
          server,
          'module',
          null,
        ),
      'taskAdmin': _i18.TaskAdminEndpoint()
        ..initialize(
          server,
          'taskAdmin',
          null,
        ),
      'task': _i19.TaskEndpoint()
        ..initialize(
          server,
          'task',
          null,
        ),
      'userStatistics': _i20.UserStatisticsEndpoint()
        ..initialize(
          server,
          'userStatistics',
          null,
        ),
      'wallet': _i21.WalletEndpoint()
        ..initialize(
          server,
          'wallet',
          null,
        ),
    };
    connectors['accessControl'] = _i1.EndpointConnector(
      name: 'accessControl',
      endpoint: endpoints['accessControl']!,
      methodConnectors: {
        'getMyAccess': _i1.MethodConnector(
          name: 'getMyAccess',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['accessControl'] as _i2.AccessControlEndpoint)
                      .getMyAccess(session),
        ),
        'getCmsAccess': _i1.MethodConnector(
          name: 'getCmsAccess',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['accessControl'] as _i2.AccessControlEndpoint)
                      .getCmsAccess(session),
        ),
        'getAdminAccess': _i1.MethodConnector(
          name: 'getAdminAccess',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['accessControl'] as _i2.AccessControlEndpoint)
                      .getAdminAccess(session),
        ),
        'getUserAccess': _i1.MethodConnector(
          name: 'getUserAccess',
          params: {
            'authUserId': _i1.ParameterDescription(
              name: 'authUserId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['accessControl'] as _i2.AccessControlEndpoint)
                      .getUserAccess(
                        session,
                        params['authUserId'],
                      ),
        ),
        'assignRole': _i1.MethodConnector(
          name: 'assignRole',
          params: {
            'authUserId': _i1.ParameterDescription(
              name: 'authUserId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'role': _i1.ParameterDescription(
              name: 'role',
              type: _i1.getType<_i22.UserRole>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['accessControl'] as _i2.AccessControlEndpoint)
                      .assignRole(
                        session,
                        authUserId: params['authUserId'],
                        role: params['role'],
                      ),
        ),
        'revokeRole': _i1.MethodConnector(
          name: 'revokeRole',
          params: {
            'authUserId': _i1.ParameterDescription(
              name: 'authUserId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'role': _i1.ParameterDescription(
              name: 'role',
              type: _i1.getType<_i22.UserRole>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['accessControl'] as _i2.AccessControlEndpoint)
                      .revokeRole(
                        session,
                        authUserId: params['authUserId'],
                        role: params['role'],
                      ),
        ),
      },
    );
    connectors['achievement'] = _i1.EndpointConnector(
      name: 'achievement',
      endpoint: endpoints['achievement']!,
      methodConnectors: {
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['achievement'] as _i3.AchievementEndpoint)
                  .getAll(session),
        ),
        'getUserAchievements': _i1.MethodConnector(
          name: 'getUserAchievements',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['achievement'] as _i3.AchievementEndpoint)
                  .getUserAchievements(session),
        ),
        'unlock': _i1.MethodConnector(
          name: 'unlock',
          params: {
            'achievementId': _i1.ParameterDescription(
              name: 'achievementId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['achievement'] as _i3.AchievementEndpoint).unlock(
                    session,
                    params['achievementId'],
                  ),
        ),
        'isUnlocked': _i1.MethodConnector(
          name: 'isUnlocked',
          params: {
            'achievementId': _i1.ParameterDescription(
              name: 'achievementId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['achievement'] as _i3.AchievementEndpoint)
                  .isUnlocked(
                    session,
                    params['achievementId'],
                  ),
        ),
      },
    );
    connectors['adminGovernance'] = _i1.EndpointConnector(
      name: 'adminGovernance',
      endpoint: endpoints['adminGovernance']!,
      methodConnectors: {
        'listUsers': _i1.MethodConnector(
          name: 'listUsers',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminGovernance'] as _i4.AdminGovernanceEndpoint)
                      .listUsers(session),
        ),
        'assignRole': _i1.MethodConnector(
          name: 'assignRole',
          params: {
            'authUserId': _i1.ParameterDescription(
              name: 'authUserId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'role': _i1.ParameterDescription(
              name: 'role',
              type: _i1.getType<_i22.UserRole>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminGovernance'] as _i4.AdminGovernanceEndpoint)
                      .assignRole(
                        session,
                        authUserId: params['authUserId'],
                        role: params['role'],
                      ),
        ),
        'revokeRole': _i1.MethodConnector(
          name: 'revokeRole',
          params: {
            'authUserId': _i1.ParameterDescription(
              name: 'authUserId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'role': _i1.ParameterDescription(
              name: 'role',
              type: _i1.getType<_i22.UserRole>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminGovernance'] as _i4.AdminGovernanceEndpoint)
                      .revokeRole(
                        session,
                        authUserId: params['authUserId'],
                        role: params['role'],
                      ),
        ),
        'listPublicationQueue': _i1.MethodConnector(
          name: 'listPublicationQueue',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminGovernance'] as _i4.AdminGovernanceEndpoint)
                      .listPublicationQueue(
                        session,
                        query: params['query'],
                        limit: params['limit'],
                        offset: params['offset'],
                      ),
        ),
        'listPublishedCourses': _i1.MethodConnector(
          name: 'listPublishedCourses',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminGovernance'] as _i4.AdminGovernanceEndpoint)
                      .listPublishedCourses(
                        session,
                        query: params['query'],
                        limit: params['limit'],
                        offset: params['offset'],
                      ),
        ),
        'approvePublication': _i1.MethodConnector(
          name: 'approvePublication',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminGovernance'] as _i4.AdminGovernanceEndpoint)
                      .approvePublication(
                        session,
                        params['courseId'],
                      ),
        ),
        'unpublishCourse': _i1.MethodConnector(
          name: 'unpublishCourse',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminGovernance'] as _i4.AdminGovernanceEndpoint)
                      .unpublishCourse(
                        session,
                        params['courseId'],
                      ),
        ),
      },
    );
    connectors['ai'] = _i1.EndpointConnector(
      name: 'ai',
      endpoint: endpoints['ai']!,
      methodConnectors: {
        'generateHint': _i1.MethodConnector(
          name: 'generateHint',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i23.GenerateHintRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['ai'] as _i5.AiEndpoint).generateHint(
                session,
                params['request'],
              ),
        ),
        'generateExplanation': _i1.MethodConnector(
          name: 'generateExplanation',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i24.GenerateExplanationRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['ai'] as _i5.AiEndpoint).generateExplanation(
                    session,
                    params['request'],
                  ),
        ),
      },
    );
    connectors['cmsMediaAdmin'] = _i1.EndpointConnector(
      name: 'cmsMediaAdmin',
      endpoint: endpoints['cmsMediaAdmin']!,
      methodConnectors: {
        'uploadImage': _i1.MethodConnector(
          name: 'uploadImage',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i25.UploadCmsMediaRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['cmsMediaAdmin'] as _i6.CmsMediaAdminEndpoint)
                      .uploadImage(
                        session,
                        params['request'],
                      ),
        ),
      },
    );
    connectors['courseAdmin'] = _i1.EndpointConnector(
      name: 'courseAdmin',
      endpoint: endpoints['courseAdmin']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i26.ContentStatus?>(),
              nullable: true,
            ),
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseAdmin'] as _i7.CourseAdminEndpoint).list(
                    session,
                    status: params['status'],
                    query: params['query'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i27.CreateCourseRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseAdmin'] as _i7.CourseAdminEndpoint).create(
                    session,
                    params['request'],
                  ),
        ),
        'importStructured': _i1.MethodConnector(
          name: 'importStructured',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i28.ImportCourseRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['courseAdmin'] as _i7.CourseAdminEndpoint)
                  .importStructured(
                    session,
                    params['request'],
                  ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i29.UpdateCourseRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseAdmin'] as _i7.CourseAdminEndpoint).update(
                    session,
                    params['request'],
                  ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseAdmin'] as _i7.CourseAdminEndpoint).delete(
                    session,
                    params['courseId'],
                  ),
        ),
        'publish': _i1.MethodConnector(
          name: 'publish',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseAdmin'] as _i7.CourseAdminEndpoint).publish(
                    session,
                    params['courseId'],
                  ),
        ),
        'unpublish': _i1.MethodConnector(
          name: 'unpublish',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['courseAdmin'] as _i7.CourseAdminEndpoint)
                  .unpublish(
                    session,
                    params['courseId'],
                  ),
        ),
      },
    );
    connectors['courseAnalyticsAdmin'] = _i1.EndpointConnector(
      name: 'courseAnalyticsAdmin',
      endpoint: endpoints['courseAnalyticsAdmin']!,
      methodConnectors: {
        'getDashboard': _i1.MethodConnector(
          name: 'getDashboard',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'commonWrongAnswersLimit': _i1.ParameterDescription(
              name: 'commonWrongAnswersLimit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseAnalyticsAdmin']
                          as _i8.CourseAnalyticsAdminEndpoint)
                      .getDashboard(
                        session,
                        params['courseId'],
                        commonWrongAnswersLimit:
                            params['commonWrongAnswersLimit'],
                      ),
        ),
      },
    );
    connectors['course'] = _i1.EndpointConnector(
      name: 'course',
      endpoint: endpoints['course']!,
      methodConnectors: {
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['course'] as _i9.CourseEndpoint).get(
                session,
                limit: params['limit'],
                offset: params['offset'],
              ),
        ),
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['course'] as _i9.CourseEndpoint).getById(
                session,
                params['courseId'],
              ),
        ),
        'getEnrolled': _i1.MethodConnector(
          name: 'getEnrolled',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['course'] as _i9.CourseEndpoint)
                  .getEnrolled(session),
        ),
        'enroll': _i1.MethodConnector(
          name: 'enroll',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['course'] as _i9.CourseEndpoint).enroll(
                session,
                params['courseId'],
              ),
        ),
        'unenroll': _i1.MethodConnector(
          name: 'unenroll',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['course'] as _i9.CourseEndpoint).unenroll(
                session,
                params['courseId'],
              ),
        ),
        'getRecommendations': _i1.MethodConnector(
          name: 'getRecommendations',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['course'] as _i9.CourseEndpoint)
                  .getRecommendations(
                    session,
                    limit: params['limit'],
                  ),
        ),
        'getAdaptiveLearningPath': _i1.MethodConnector(
          name: 'getAdaptiveLearningPath',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['course'] as _i9.CourseEndpoint)
                  .getAdaptiveLearningPath(
                    session,
                    params['courseId'],
                  ),
        ),
        'getTableOfContents': _i1.MethodConnector(
          name: 'getTableOfContents',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['course'] as _i9.CourseEndpoint)
                  .getTableOfContents(
                    session,
                    params['courseId'],
                  ),
        ),
        'submitReview': _i1.MethodConnector(
          name: 'submitReview',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i30.CreateCourseReviewRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['course'] as _i9.CourseEndpoint).submitReview(
                    session,
                    params['courseId'],
                    params['request'],
                  ),
        ),
      },
    );
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i10.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i10.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i10.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i10.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i10.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i10.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i10.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
      },
    );
    connectors['externalIntegrationAdmin'] = _i1.EndpointConnector(
      name: 'externalIntegrationAdmin',
      endpoint: endpoints['externalIntegrationAdmin']!,
      methodConnectors: {
        'listProviders': _i1.MethodConnector(
          name: 'listProviders',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['externalIntegrationAdmin']
                          as _i11.ExternalIntegrationAdminEndpoint)
                      .listProviders(session),
        ),
        'syncCourse': _i1.MethodConnector(
          name: 'syncCourse',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i31.SyncCourseToExternalProviderRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['externalIntegrationAdmin']
                          as _i11.ExternalIntegrationAdminEndpoint)
                      .syncCourse(
                        session,
                        params['request'],
                      ),
        ),
        'provisionLessonVideoSession': _i1.MethodConnector(
          name: 'provisionLessonVideoSession',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i32.ProvisionExternalVideoSessionRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['externalIntegrationAdmin']
                          as _i11.ExternalIntegrationAdminEndpoint)
                      .provisionLessonVideoSession(
                        session,
                        params['request'],
                      ),
        ),
      },
    );
    connectors['health'] = _i1.EndpointConnector(
      name: 'health',
      endpoint: endpoints['health']!,
      methodConnectors: {
        'ping': _i1.MethodConnector(
          name: 'ping',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['health'] as _i12.HealthEndpoint).ping(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i13.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['lessonAdmin'] = _i1.EndpointConnector(
      name: 'lessonAdmin',
      endpoint: endpoints['lessonAdmin']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'moduleId': _i1.ParameterDescription(
              name: 'moduleId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['lessonAdmin'] as _i14.LessonAdminEndpoint).list(
                    session,
                    params['moduleId'],
                  ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i33.CreateLessonRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['lessonAdmin'] as _i14.LessonAdminEndpoint).create(
                    session,
                    params['request'],
                  ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i34.UpdateLessonRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['lessonAdmin'] as _i14.LessonAdminEndpoint).update(
                    session,
                    params['request'],
                  ),
        ),
        'reorder': _i1.MethodConnector(
          name: 'reorder',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i35.ReorderLessonsRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lessonAdmin'] as _i14.LessonAdminEndpoint)
                  .reorder(
                    session,
                    params['request'],
                  ),
        ),
      },
    );
    connectors['lesson'] = _i1.EndpointConnector(
      name: 'lesson',
      endpoint: endpoints['lesson']!,
      methodConnectors: {
        'getByCourseId': _i1.MethodConnector(
          name: 'getByCourseId',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['lesson'] as _i15.LessonEndpoint).getByCourseId(
                    session,
                    params['courseId'],
                  ),
        ),
        'getByModuleId': _i1.MethodConnector(
          name: 'getByModuleId',
          params: {
            'moduleId': _i1.ParameterDescription(
              name: 'moduleId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['lesson'] as _i15.LessonEndpoint).getByModuleId(
                    session,
                    params['moduleId'],
                  ),
        ),
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'lessonId': _i1.ParameterDescription(
              name: 'lessonId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lesson'] as _i15.LessonEndpoint).getById(
                session,
                params['lessonId'],
              ),
        ),
        'getProgressByCourseId': _i1.MethodConnector(
          name: 'getProgressByCourseId',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lesson'] as _i15.LessonEndpoint)
                  .getProgressByCourseId(
                    session,
                    params['courseId'],
                  ),
        ),
        'markComplete': _i1.MethodConnector(
          name: 'markComplete',
          params: {
            'lessonId': _i1.ParameterDescription(
              name: 'lessonId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'timeSpentSeconds': _i1.ParameterDescription(
              name: 'timeSpentSeconds',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['lesson'] as _i15.LessonEndpoint).markComplete(
                    session,
                    params['lessonId'],
                    timeSpentSeconds: params['timeSpentSeconds'],
                  ),
        ),
        'complete': _i1.MethodConnector(
          name: 'complete',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i36.CompleteLessonSessionRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lesson'] as _i15.LessonEndpoint).complete(
                session,
                params['request'],
              ),
        ),
      },
    );
    connectors['moduleAdmin'] = _i1.EndpointConnector(
      name: 'moduleAdmin',
      endpoint: endpoints['moduleAdmin']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['moduleAdmin'] as _i16.ModuleAdminEndpoint).list(
                    session,
                    params['courseId'],
                  ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i37.CreateModuleRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['moduleAdmin'] as _i16.ModuleAdminEndpoint).create(
                    session,
                    params['request'],
                  ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i38.UpdateModuleRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['moduleAdmin'] as _i16.ModuleAdminEndpoint).update(
                    session,
                    params['request'],
                  ),
        ),
        'reorder': _i1.MethodConnector(
          name: 'reorder',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i39.ReorderModulesRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['moduleAdmin'] as _i16.ModuleAdminEndpoint)
                  .reorder(
                    session,
                    params['request'],
                  ),
        ),
      },
    );
    connectors['module'] = _i1.EndpointConnector(
      name: 'module',
      endpoint: endpoints['module']!,
      methodConnectors: {
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'courseId': _i1.ParameterDescription(
              name: 'courseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['module'] as _i17.ModuleEndpoint).get(
                session,
                params['courseId'],
              ),
        ),
      },
    );
    connectors['taskAdmin'] = _i1.EndpointConnector(
      name: 'taskAdmin',
      endpoint: endpoints['taskAdmin']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {
            'lessonId': _i1.ParameterDescription(
              name: 'lessonId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['taskAdmin'] as _i18.TaskAdminEndpoint).list(
                    session,
                    params['lessonId'],
                  ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i40.CreateTaskRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['taskAdmin'] as _i18.TaskAdminEndpoint).create(
                    session,
                    params['request'],
                  ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i41.UpdateTaskRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['taskAdmin'] as _i18.TaskAdminEndpoint).update(
                    session,
                    params['request'],
                  ),
        ),
        'reorder': _i1.MethodConnector(
          name: 'reorder',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i42.ReorderTasksRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['taskAdmin'] as _i18.TaskAdminEndpoint).reorder(
                    session,
                    params['request'],
                  ),
        ),
        'upsertOptions': _i1.MethodConnector(
          name: 'upsertOptions',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i43.UpsertTaskOptionsRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['taskAdmin'] as _i18.TaskAdminEndpoint)
                  .upsertOptions(
                    session,
                    params['request'],
                  ),
        ),
        'upsertTestCases': _i1.MethodConnector(
          name: 'upsertTestCases',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i44.UpsertTaskTestCasesRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['taskAdmin'] as _i18.TaskAdminEndpoint)
                  .upsertTestCases(
                    session,
                    params['request'],
                  ),
        ),
      },
    );
    connectors['task'] = _i1.EndpointConnector(
      name: 'task',
      endpoint: endpoints['task']!,
      methodConnectors: {
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'taskId': _i1.ParameterDescription(
              name: 'taskId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['task'] as _i19.TaskEndpoint).getById(
                session,
                params['taskId'],
              ),
        ),
        'getByLessonId': _i1.MethodConnector(
          name: 'getByLessonId',
          params: {
            'lessonId': _i1.ParameterDescription(
              name: 'lessonId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['task'] as _i19.TaskEndpoint).getByLessonId(
                session,
                params['lessonId'],
              ),
        ),
        'answer': _i1.MethodConnector(
          name: 'answer',
          params: {
            'taskId': _i1.ParameterDescription(
              name: 'taskId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userAnswer': _i1.ParameterDescription(
              name: 'userAnswer',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['task'] as _i19.TaskEndpoint).answer(
                session,
                params['taskId'],
                params['userAnswer'],
              ),
        ),
      },
    );
    connectors['userStatistics'] = _i1.EndpointConnector(
      name: 'userStatistics',
      endpoint: endpoints['userStatistics']!,
      methodConnectors: {
        'get': _i1.MethodConnector(
          name: 'get',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['userStatistics'] as _i20.UserStatisticsEndpoint)
                      .get(session),
        ),
      },
    );
    connectors['wallet'] = _i1.EndpointConnector(
      name: 'wallet',
      endpoint: endpoints['wallet']!,
      methodConnectors: {
        'getBalance': _i1.MethodConnector(
          name: 'getBalance',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['wallet'] as _i21.WalletEndpoint)
                  .getBalance(session),
        ),
        'topUp': _i1.MethodConnector(
          name: 'topUp',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i45.CreateCoinTransactionRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['wallet'] as _i21.WalletEndpoint).topUp(
                session,
                params['request'],
              ),
        ),
        'buy': _i1.MethodConnector(
          name: 'buy',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i45.CreateCoinTransactionRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['wallet'] as _i21.WalletEndpoint).buy(
                session,
                params['request'],
              ),
        ),
        'getHistory': _i1.MethodConnector(
          name: 'getHistory',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['wallet'] as _i21.WalletEndpoint).getHistory(
                    session,
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_core'] = _i46.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_idp'] = _i47.Endpoints()
      ..initializeEndpoints(server);
  }
}
