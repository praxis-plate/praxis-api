import 'package:equatable/equatable.dart';

class WalletUpdate extends Equatable {
  final int balance;
  final int available;
  final int held;
  final int amountForLedger;

  const WalletUpdate({
    required this.balance,
    required this.available,
    required this.held,
    required this.amountForLedger,
  });

  @override
  List<Object> get props => [balance, available, held, amountForLedger];

  @override
  bool get stringify => true;
}
