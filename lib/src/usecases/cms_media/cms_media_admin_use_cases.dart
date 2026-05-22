import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/cms_media/cms_media_storage_service.dart';
import 'package:serverpod/serverpod.dart';

class UploadCmsMediaUseCase {
  final CmsMediaStorageService _storageService;

  const UploadCmsMediaUseCase({
    required CmsMediaStorageService storageService,
  }) : _storageService = storageService;

  Future<CmsMediaDto> execute(
    Session session,
    UploadCmsMediaRequest request,
  ) {
    return _storageService.uploadImage(session, request);
  }
}
