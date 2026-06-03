import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/user_profile/user_profile.dart';
import 'package:praxis_server/src/shared/utils/transaction_runner.dart';
import 'package:serverpod/serverpod.dart';

class UpdateCurrentUserProfileUseCase {
  final UserProfileService _userProfileService;
  final TransactionRunner _transactionRunner;

  const UpdateCurrentUserProfileUseCase({
    required UserProfileService userProfileService,
    required TransactionRunner transactionRunner,
  }) : _userProfileService = userProfileService,
       _transactionRunner = transactionRunner;

  Future<UserProfileDto> execute(
    Session session, {
    required UuidValue authUserId,
    required UpdateUserProfileRequest request,
  }) {
    return _transactionRunner.run(
      session,
      (transaction) => _userProfileService.updateCurrentProfile(
        session,
        authUserId: authUserId,
        request: request,
        transaction: transaction,
      ),
    );
  }
}
