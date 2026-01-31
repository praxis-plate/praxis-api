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

abstract class WalletBalanceDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  WalletBalanceDto._({
    required this.balance,
    required this.available,
    required this.held,
    required this.currency,
  });

  factory WalletBalanceDto({
    required int balance,
    required int available,
    required int held,
    required String currency,
  }) = _WalletBalanceDtoImpl;

  factory WalletBalanceDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return WalletBalanceDto(
      balance: jsonSerialization['balance'] as int,
      available: jsonSerialization['available'] as int,
      held: jsonSerialization['held'] as int,
      currency: jsonSerialization['currency'] as String,
    );
  }

  int balance;

  int available;

  int held;

  String currency;

  /// Returns a shallow copy of this [WalletBalanceDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WalletBalanceDto copyWith({
    int? balance,
    int? available,
    int? held,
    String? currency,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WalletBalanceDto',
      'balance': balance,
      'available': available,
      'held': held,
      'currency': currency,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'WalletBalanceDto',
      'balance': balance,
      'available': available,
      'held': held,
      'currency': currency,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _WalletBalanceDtoImpl extends WalletBalanceDto {
  _WalletBalanceDtoImpl({
    required int balance,
    required int available,
    required int held,
    required String currency,
  }) : super._(
         balance: balance,
         available: available,
         held: held,
         currency: currency,
       );

  /// Returns a shallow copy of this [WalletBalanceDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WalletBalanceDto copyWith({
    int? balance,
    int? available,
    int? held,
    String? currency,
  }) {
    return WalletBalanceDto(
      balance: balance ?? this.balance,
      available: available ?? this.available,
      held: held ?? this.held,
      currency: currency ?? this.currency,
    );
  }
}
