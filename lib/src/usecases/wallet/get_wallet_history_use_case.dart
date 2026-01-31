import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/wallet/wallet_service.dart';
import 'package:serverpod/serverpod.dart';

class GetWalletHistoryUseCase {
  final WalletService _walletService;

  GetWalletHistoryUseCase({required WalletService walletService})
    : _walletService = walletService;

  Future<List<CoinTransactionDto>> execute(
    Session session, {
    required UuidValue authUserId,
    int? limit,
    int? offset,
  }) {
    return _walletService.getHistory(
      session,
      authUserId: authUserId,
      limit: limit,
      offset: offset,
    );
  }
}
