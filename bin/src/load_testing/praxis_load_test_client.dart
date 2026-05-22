import 'dart:async' as async;

import 'package:praxis_server/src/generated/protocol.dart' as protocol;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as auth_core;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as auth_idp;
import 'package:serverpod_client/serverpod_client.dart' as serverpod_client;

class LoadTestCourseEndpoint extends serverpod_client.EndpointRef {
  LoadTestCourseEndpoint(super.caller);

  @override
  String get name => 'course';

  async.Future<List<protocol.CourseDto>> get({
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<protocol.CourseDto>>(
    'course',
    'get',
    {
      'limit': limit,
      'offset': offset,
    },
  );

  async.Future<protocol.CourseStructureDto> getTableOfContents(int courseId) =>
      caller.callServerEndpoint<protocol.CourseStructureDto>(
        'course',
        'getTableOfContents',
        {'courseId': courseId},
      );
}

class LoadTestTaskEndpoint extends serverpod_client.EndpointRef {
  LoadTestTaskEndpoint(super.caller);

  @override
  String get name => 'task';

  async.Future<List<protocol.TaskDto>> getByLessonId(int lessonId) =>
      caller.callServerEndpoint<List<protocol.TaskDto>>(
        'task',
        'getByLessonId',
        {'lessonId': lessonId},
      );

  async.Future<protocol.TaskAnswerResultDto> answer(
    int taskId,
    String userAnswer,
  ) => caller.callServerEndpoint<protocol.TaskAnswerResultDto>(
    'task',
    'answer',
    {
      'taskId': taskId,
      'userAnswer': userAnswer,
    },
  );
}

class LoadTestHealthEndpoint extends serverpod_client.EndpointRef {
  LoadTestHealthEndpoint(super.caller);

  @override
  String get name => 'health';

  async.Future<String> ping() =>
      caller.callServerEndpoint<String>('health', 'ping', {});
}

class LoadTestEmailIdpEndpoint extends auth_idp.EndpointEmailIdpBase {
  LoadTestEmailIdpEndpoint(super.caller);

  @override
  String get name => 'emailIdp';

  @override
  async.Future<auth_core.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<auth_core.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  @override
  async.Future<serverpod_client.UuidValue> startRegistration({
    required String email,
  }) => caller.callServerEndpoint<serverpod_client.UuidValue>(
    'emailIdp',
    'startRegistration',
    {'email': email},
  );

  @override
  async.Future<String> verifyRegistrationCode({
    required serverpod_client.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  @override
  async.Future<auth_core.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<auth_core.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  @override
  async.Future<serverpod_client.UuidValue> startPasswordReset({
    required String email,
  }) => caller.callServerEndpoint<serverpod_client.UuidValue>(
    'emailIdp',
    'startPasswordReset',
    {'email': email},
  );

  @override
  async.Future<String> verifyPasswordResetCode({
    required serverpod_client.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  @override
  async.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );
}

class LoadTestJwtRefreshEndpoint extends auth_core.EndpointRefreshJwtTokens {
  LoadTestJwtRefreshEndpoint(super.caller);

  @override
  String get name => 'jwtRefresh';

  @override
  async.Future<auth_core.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<auth_core.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

class LoadTestModules {
  LoadTestModules(LoadTestClient client) {
    serverpodAuthCore = auth_core.Caller(client);
    serverpodAuthIdp = auth_idp.Caller(client);
  }

  late final auth_core.Caller serverpodAuthCore;
  late final auth_idp.Caller serverpodAuthIdp;
}

class LoadTestClient extends serverpod_client.ServerpodClientShared {
  LoadTestClient(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    void Function(
      serverpod_client.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    void Function(serverpod_client.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         protocol.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    course = LoadTestCourseEndpoint(this);
    emailIdp = LoadTestEmailIdpEndpoint(this);
    health = LoadTestHealthEndpoint(this);
    jwtRefresh = LoadTestJwtRefreshEndpoint(this);
    task = LoadTestTaskEndpoint(this);
    modules = LoadTestModules(this);
  }

  late final LoadTestCourseEndpoint course;
  late final LoadTestEmailIdpEndpoint emailIdp;
  late final LoadTestHealthEndpoint health;
  late final LoadTestJwtRefreshEndpoint jwtRefresh;
  late final LoadTestTaskEndpoint task;
  late final LoadTestModules modules;

  @override
  Map<String, serverpod_client.EndpointRef> get endpointRefLookup => {
    'course': course,
    'emailIdp': emailIdp,
    'health': health,
    'jwtRefresh': jwtRefresh,
    'task': task,
  };

  @override
  Map<String, serverpod_client.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_core': modules.serverpodAuthCore,
    'serverpod_auth_idp': modules.serverpodAuthIdp,
  };
}
