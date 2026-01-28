import 'package:praxis_server/src/generated/protocol.dart';

extension WalletBalanceMapper on UserWallet {
  WalletBalanceDto toWalletBalanceDto() {
    return WalletBalanceDto(
      balance: balance,
      available: available,
      held: held,
      currency: currency,
    );
  }
}
