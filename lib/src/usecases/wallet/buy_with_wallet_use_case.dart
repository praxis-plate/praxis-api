import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/wallet/wallet_service.dart';
import 'package:serverpod/serverpod.dart';

class BuyWithWalletUseCase {
  final WalletService _walletService;

  BuyWithWalletUseCase({required WalletService walletService})
    : _walletService = walletService;

  Future<CoinTransactionDto> execute(
    Session session,
    CreateCoinTransactionRequest request, {
    required UuidValue authUserId,
  }) {
    return _walletService.buy(
      session,
      request,
      authUserId: authUserId,
    );
  }
}
