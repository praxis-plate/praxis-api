const String defaultCoinCurrency = 'COIN';

class CoinTransactionStatuses {
  static const String pending = 'pending';
  static const String posted = 'posted';
  static const String failed = 'failed';

  static const Set<String> values = {
    pending,
    posted,
    failed,
  };
}

class CoinTransactionTypes {
  static const String buy = 'buy';
  static const String topUp = 'top_up';
  static const String hold = 'hold';
  static const String capture = 'capture';
  static const String release = 'release';
  static const String refund = 'refund';
  static const String adjustment = 'adjustment';
  static const String reversal = 'reversal';

  static const Set<String> values = {
    buy,
    topUp,
    hold,
    capture,
    release,
    refund,
    adjustment,
    reversal,
  };
}

String normalizeCoinTransactionType(String raw) {
  final normalized = raw.trim().toLowerCase();
  if (normalized == 'topup' || normalized == 'top-up') {
    return CoinTransactionTypes.topUp;
  }
  return normalized;
}
