import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/cms_content/cms_content_service.dart';
import 'package:praxis_server/src/shared/utils/transaction_runner.dart';
import 'package:serverpod/serverpod.dart';

class ListAdminCoursesUseCase {
  final CmsContentService _cmsContentService;

  const ListAdminCoursesUseCase({
    required CmsContentService cmsContentService,
  }) : _cmsContentService = cmsContentService;

  Future<List<CourseDto>> execute(
    Session session, {
    ContentStatus? status,
    String? query,
    int? limit,
    int? offset,
  }) {
    return _cmsContentService.listCourses(
      session,
      status: status,
      query: query,
      limit: limit,
      offset: offset,
    );
  }
}

class CreateAdminCourseUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const CreateAdminCourseUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<CourseDto> execute(
    Session session,
    CreateCourseRequest request,
  ) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.createCourse(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}

class ImportAdminCourseUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const ImportAdminCourseUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<CourseImportResultDto> execute(
    Session session,
    ImportCourseRequest request,
  ) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.importCourse(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}

class UpdateAdminCourseUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const UpdateAdminCourseUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<CourseDto> execute(
    Session session,
    UpdateCourseRequest request,
  ) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.updateCourse(
        session,
        request,
        transaction: transaction,
      ),
    );
  }
}

class PublishAdminCourseUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const PublishAdminCourseUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<CourseDto> execute(Session session, int courseId) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.publishCourse(
        session,
        courseId,
        transaction: transaction,
      ),
    );
  }
}

class UnpublishAdminCourseUseCase {
  final CmsContentService _cmsContentService;
  final TransactionRunner _transactionRunner;

  const UnpublishAdminCourseUseCase({
    required CmsContentService cmsContentService,
    required TransactionRunner transactionRunner,
  }) : _cmsContentService = cmsContentService,
       _transactionRunner = transactionRunner;

  Future<CourseDto> execute(Session session, int courseId) {
    return _transactionRunner.run(
      session,
      (transaction) => _cmsContentService.unpublishCourse(
        session,
        courseId,
        transaction: transaction,
      ),
    );
  }
}
