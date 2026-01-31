/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum CoinTransactionType implements _i1.SerializableModel {
  buy,
  topUp,
  hold,
  capture,
  release,
  refund,
  adjustment,
  reversal
  ;

  static CoinTransactionType fromJson(String name) {
    switch (name) {
      case 'buy':
        return CoinTransactionType.buy;
      case 'topUp':
        return CoinTransactionType.topUp;
      case 'hold':
        return CoinTransactionType.hold;
      case 'capture':
        return CoinTransactionType.capture;
      case 'release':
        return CoinTransactionType.release;
      case 'refund':
        return CoinTransactionType.refund;
      case 'adjustment':
        return CoinTransactionType.adjustment;
      case 'reversal':
        return CoinTransactionType.reversal;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "CoinTransactionType"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
