import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/cms_content/cms_content_service.dart';
import 'package:praxis_server/src/shared/utils/transaction_runner.dart';
import 'package:serverpod/serverpod.dart';

class ListAdminModulesUseCase {
  final CmsContentService _cmsContentService;

  const ListAdminModulesUseCase({
    required CmsContentService cmsContentService,
  }) : _cmsContentService = cmsContentService;

  Future<List<ModuleDto>> execute(Session session, int courseId) {
    return _cmsContentService.listModules(session, courseId);
  }
}

class CreateAdminModuleUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const CreateAdminModuleUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<ModuleDto> execute(Session session, CreateModuleRequest request) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.createModule(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}

class UpdateAdminModuleUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const UpdateAdminModuleUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<ModuleDto> execute(Session session, UpdateModuleRequest request) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.updateModule(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}

class ReorderAdminModulesUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const ReorderAdminModulesUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<List<ModuleDto>> execute(
    Session session,
    ReorderModulesRequest request,
  ) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.reorderModules(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}
