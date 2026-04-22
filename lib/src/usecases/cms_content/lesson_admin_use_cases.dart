import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/cms_content/cms_content_service.dart';
import 'package:praxis_server/src/shared/utils/transaction_runner.dart';
import 'package:serverpod/serverpod.dart';

class ListAdminLessonsUseCase {
  final CmsContentService _cmsContentService;

  const ListAdminLessonsUseCase({
    required CmsContentService cmsContentService,
  }) : _cmsContentService = cmsContentService;

  Future<List<LessonDto>> execute(Session session, int moduleId) {
    return _cmsContentService.listLessons(session, moduleId);
  }
}

class CreateAdminLessonUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const CreateAdminLessonUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<LessonDto> execute(Session session, CreateLessonRequest request) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.createLesson(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}

class UpdateAdminLessonUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const UpdateAdminLessonUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<LessonDto> execute(Session session, UpdateLessonRequest request) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.updateLesson(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}

class ReorderAdminLessonsUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const ReorderAdminLessonsUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<List<LessonDto>> execute(
    Session session,
    ReorderLessonsRequest request,
  ) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.reorderLessons(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}
