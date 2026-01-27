enum CoinTransactionType {
  buy('buy'),
  topUp('top_up'),
  hold('hold'),
  capture('capture'),
  release('release'),
  refund('refund'),
  adjustment('adjustment'),
  reversal('reversal')
  ;

  const CoinTransactionType(this.value);

  final String value;

  static CoinTransactionType? fromString(String value) {
    for (final type in CoinTransactionType.values) {
      if (type.value == value) {
        return type;
      }
    }
    return null;
  }
}
