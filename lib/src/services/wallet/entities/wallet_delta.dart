import 'package:equatable/equatable.dart';

class WalletDelta extends Equatable {
  final int balanceDelta;
  final int availableDelta;
  final int heldDelta;

  const WalletDelta({
    required this.balanceDelta,
    required this.availableDelta,
    required this.heldDelta,
  });

  WalletDelta add({int balance = 0, int available = 0, int held = 0}) {
    return WalletDelta(
      balanceDelta: balanceDelta + balance,
      availableDelta: availableDelta + available,
      heldDelta: heldDelta + held,
    );
  }

  @override
  List<Object> get props => [balanceDelta, availableDelta, heldDelta];

  @override
  bool get stringify => true;
}
