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
import '../endpoints/achievement_endpoint.dart' as _i2;
import '../endpoints/ai_endpoint.dart' as _i3;
import '../endpoints/course_endpoint.dart' as _i4;
import '../endpoints/email_idp_endpoint.dart' as _i5;
import '../endpoints/health_endpoint.dart' as _i6;
import '../endpoints/jwt_refresh_endpoint.dart' as _i7;
import '../endpoints/lesson_endpoint.dart' as _i8;
import '../endpoints/module_endpoint.dart' as _i9;
import '../endpoints/task_endpoint.dart' as _i10;
import '../endpoints/user_statistics_endpoint.dart' as _i11;
import '../endpoints/wallet_endpoint.dart' as _i12;
import 'package:praxis_server/src/generated/requests/generate_hint_request.dart'
    as _i13;
import 'package:praxis_server/src/generated/requests/generate_explanation_request.dart'
    as _i14;
import 'package:praxis_server/src/generated/requests/complete_lesson_session_request.dart'
    as _i15;
import 'package:praxis_server/src/generated/requests/create_coin_transaction_request.dart'
    as _i16;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i17;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i18;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'achievement': _i2.AchievementEndpoint()
        ..initialize(
          server,
          'achievement',
          null,
        ),
      'ai': _i3.AiEndpoint()
        ..initialize(
          server,
          'ai',
          null,
        ),
      'course': _i4.CourseEndpoint()
        ..initialize(
          server,
          'course',
          null,
        ),
      'emailIdp': _i5.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'health': _i6.HealthEndpoint()
        ..initialize(
          server,
          'health',
          null,
        ),
      'jwtRefresh': _i7.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'lesson': _i8.LessonEndpoint()
        ..initialize(
          server,
          'lesson',
          null,
        ),
      'module': _i9.ModuleEndpoint()
        ..initialize(
          server,
          'module',
          null,
        ),
      'task': _i10.TaskEndpoint()
        ..initialize(
          server,
          'task',
          null,
        ),
      'userStatistics': _i11.UserStatisticsEndpoint()
        ..initialize(
          server,
          'userStatistics',
          null,
        ),
      'wallet': _i12.WalletEndpoint()
        ..initialize(
          server,
          'wallet',
          null,
        ),
    };
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
              ) async => (endpoints['achievement'] as _i2.AchievementEndpoint)
                  .getAll(session),
        ),
        'getUserAchievements': _i1.MethodConnector(
          name: 'getUserAchievements',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['achievement'] as _i2.AchievementEndpoint)
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
                  (endpoints['achievement'] as _i2.AchievementEndpoint).unlock(
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
              ) async => (endpoints['achievement'] as _i2.AchievementEndpoint)
                  .isUnlocked(
                    session,
                    params['achievementId'],
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
              type: _i1.getType<_i13.GenerateHintRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['ai'] as _i3.AiEndpoint).generateHint(
                session,
                params['request'],
              ),
        ),
        'generateExplanation': _i1.MethodConnector(
          name: 'generateExplanation',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i14.GenerateExplanationRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['ai'] as _i3.AiEndpoint).generateExplanation(
                    session,
                    params['request'],
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
              ) async => (endpoints['course'] as _i4.CourseEndpoint).get(
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
              ) async => (endpoints['course'] as _i4.CourseEndpoint).getById(
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
              ) async => (endpoints['course'] as _i4.CourseEndpoint)
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
              ) async => (endpoints['course'] as _i4.CourseEndpoint).enroll(
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
              ) async => (endpoints['course'] as _i4.CourseEndpoint).unenroll(
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
              ) async => (endpoints['course'] as _i4.CourseEndpoint)
                  .getTableOfContents(
                    session,
                    params['courseId'],
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
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint).login(
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
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i5.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
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
                  (endpoints['health'] as _i6.HealthEndpoint).ping(session),
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
              ) async => (endpoints['jwtRefresh'] as _i7.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
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
                  (endpoints['lesson'] as _i8.LessonEndpoint).getByCourseId(
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
                  (endpoints['lesson'] as _i8.LessonEndpoint).getByModuleId(
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
              ) async => (endpoints['lesson'] as _i8.LessonEndpoint).getById(
                session,
                params['lessonId'],
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
                  (endpoints['lesson'] as _i8.LessonEndpoint).markComplete(
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
              type: _i1.getType<_i15.CompleteLessonSessionRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lesson'] as _i8.LessonEndpoint).complete(
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
              ) async => (endpoints['module'] as _i9.ModuleEndpoint).get(
                session,
                params['courseId'],
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
              ) async => (endpoints['task'] as _i10.TaskEndpoint).getById(
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
              ) async => (endpoints['task'] as _i10.TaskEndpoint).getByLessonId(
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
              ) async => (endpoints['task'] as _i10.TaskEndpoint).answer(
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
                  (endpoints['userStatistics'] as _i11.UserStatisticsEndpoint)
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
              ) async => (endpoints['wallet'] as _i12.WalletEndpoint)
                  .getBalance(session),
        ),
        'topUp': _i1.MethodConnector(
          name: 'topUp',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i16.CreateCoinTransactionRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['wallet'] as _i12.WalletEndpoint).topUp(
                session,
                params['request'],
              ),
        ),
        'buy': _i1.MethodConnector(
          name: 'buy',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i16.CreateCoinTransactionRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['wallet'] as _i12.WalletEndpoint).buy(
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
                  (endpoints['wallet'] as _i12.WalletEndpoint).getHistory(
                    session,
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i17.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i18.Endpoints()
      ..initializeEndpoints(server);
  }
}
