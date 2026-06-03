import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/user_profile/user_profile.dart';
import 'package:praxis_server/src/shared/utils/transaction_runner.dart';
import 'package:serverpod/serverpod.dart';

class RemoveCurrentUserAvatarUseCase {
  final UserProfileService _userProfileService;
  final TransactionRunner _transactionRunner;

  const RemoveCurrentUserAvatarUseCase({
    required UserProfileService userProfileService,
    required TransactionRunner transactionRunner,
  }) : _userProfileService = userProfileService,
       _transactionRunner = transactionRunner;

  Future<UserProfileDto> execute(
    Session session, {
    required UuidValue authUserId,
  }) {
    return _transactionRunner.run(
      session,
      (transaction) => _userProfileService.removeAvatar(
        session,
        authUserId: authUserId,
        transaction: transaction,
      ),
    );
  }
}
