import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/wallet/wallet_service.dart';
import 'package:serverpod/serverpod.dart';

class TopUpWalletUseCase {
  final WalletService _walletService;

  TopUpWalletUseCase({required WalletService walletService})
    : _walletService = walletService;

  Future<CoinTransactionDto> execute(
    Session session,
    CreateCoinTransactionRequest request, {
    required UuidValue authUserId,
  }) {
    return _walletService.topUp(
      session,
      request,
      authUserId: authUserId,
    );
  }
}
