import 'package:praxis_server/src/app_usecases_binding.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/constants/auth_scopes.dart';
import 'package:praxis_server/src/shared/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class CmsMediaAdminEndpoint extends Endpoint {
  Future<CmsMediaDto> uploadImage(
    Session session,
    UploadCmsMediaRequest request,
  ) {
    AuthUtils.requireScope(session, AuthScopes.contentManage);
    return session.server.useCases.uploadCmsMediaUseCase.execute(
      session,
      request,
    );
  }
}
