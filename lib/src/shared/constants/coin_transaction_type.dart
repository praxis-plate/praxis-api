enum CoinTransactionType {
  buy('buy'),
  topUp('topUp'),
  hold('hold'),
  capture('capture'),
  release('release'),
  refund('refund'),
  adjustment('adjustment'),
  reversal('reversal')
  ;

  const CoinTransactionType(this.value);

  final String value;
}
