import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/cms_content/cms_content_service.dart';
import 'package:praxis_server/src/shared/utils/transaction_runner.dart';
import 'package:serverpod/serverpod.dart';

class ListAdminTasksUseCase {
  final CmsContentService _cmsContentService;

  const ListAdminTasksUseCase({
    required CmsContentService cmsContentService,
  }) : _cmsContentService = cmsContentService;

  Future<List<TaskDto>> execute(Session session, int lessonId) {
    return _cmsContentService.listTasks(session, lessonId);
  }
}

class CreateAdminTaskUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const CreateAdminTaskUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<TaskDto> execute(Session session, CreateTaskRequest request) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.createTask(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}

class UpdateAdminTaskUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const UpdateAdminTaskUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<TaskDto> execute(Session session, UpdateTaskRequest request) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.updateTask(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}

class ReorderAdminTasksUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const ReorderAdminTasksUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<List<TaskDto>> execute(
    Session session,
    ReorderTasksRequest request,
  ) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.reorderTasks(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}

class UpsertAdminTaskOptionsUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const UpsertAdminTaskOptionsUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<List<TaskOptionDto>> execute(
    Session session,
    UpsertTaskOptionsRequest request,
  ) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.upsertTaskOptions(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}

class UpsertAdminTaskTestCasesUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const UpsertAdminTaskTestCasesUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<List<TaskTestCaseDto>> execute(
    Session session,
    UpsertTaskTestCasesRequest request,
  ) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.upsertTaskTestCases(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}
