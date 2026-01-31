enum CoinTransactionStatus {
  pending('pending'),
  posted('posted'),
  failed('failed')
  ;

  const CoinTransactionStatus(this.value);

  final String value;

  static CoinTransactionStatus? fromString(String value) {
    for (final status in CoinTransactionStatus.values) {
      if (status.value == value) {
        return status;
      }
    }
    return null;
  }
}
