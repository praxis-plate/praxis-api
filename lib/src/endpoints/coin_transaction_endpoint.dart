import 'package:serverpod/serverpod.dart';
import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/wallet/wallet.dart';

class CoinTransactionEndpoint extends Endpoint {
  final walletService = WalletService();

  Future<CoinTransactionDto> buy(
    Session session,
    CreateCoinTransactionRequest request,
  ) {
    return walletService.buy(session, request);
  }

  Future<List<CoinTransactionDto>> getHistory(
    Session session,
  ) {
    return walletService.getHistory(session);
  }
}
