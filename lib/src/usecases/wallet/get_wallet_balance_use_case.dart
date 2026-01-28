import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/wallet/wallet_service.dart';
import 'package:serverpod/serverpod.dart';

class GetWalletBalanceUseCase {
  final WalletService _walletService;

  GetWalletBalanceUseCase({required WalletService walletService})
    : _walletService = walletService;

  Future<UserWallet> execute(
    Session session, {
    required UuidValue authUserId,
  }) {
    return _walletService.getBalance(
      session,
      authUserId: authUserId,
    );
  }
}
