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
import '../enums/coin_transaction_type.dart' as _i2;

abstract class CreateCoinTransactionRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateCoinTransactionRequest._({
    required this.transactionKey,
    required this.amount,
    this.currency,
    required this.type,
    this.relatedEntityId,
    this.reversalOfTransactionId,
    this.reason,
    this.metadata,
  });

  factory CreateCoinTransactionRequest({
    required String transactionKey,
    required int amount,
    String? currency,
    required _i2.CoinTransactionType type,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
  }) = _CreateCoinTransactionRequestImpl;

  factory CreateCoinTransactionRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateCoinTransactionRequest(
      transactionKey: jsonSerialization['transactionKey'] as String,
      amount: jsonSerialization['amount'] as int,
      currency: jsonSerialization['currency'] as String?,
      type: _i2.CoinTransactionType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      relatedEntityId: jsonSerialization['relatedEntityId'] as String?,
      reversalOfTransactionId:
          jsonSerialization['reversalOfTransactionId'] as int?,
      reason: jsonSerialization['reason'] as String?,
      metadata: jsonSerialization['metadata'] as String?,
    );
  }

  String transactionKey;

  int amount;

  String? currency;

  _i2.CoinTransactionType type;

  String? relatedEntityId;

  int? reversalOfTransactionId;

  String? reason;

  String? metadata;

  /// Returns a shallow copy of this [CreateCoinTransactionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateCoinTransactionRequest copyWith({
    String? transactionKey,
    int? amount,
    String? currency,
    _i2.CoinTransactionType? type,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateCoinTransactionRequest',
      'transactionKey': transactionKey,
      'amount': amount,
      if (currency != null) 'currency': currency,
      'type': type.toJson(),
      if (relatedEntityId != null) 'relatedEntityId': relatedEntityId,
      if (reversalOfTransactionId != null)
        'reversalOfTransactionId': reversalOfTransactionId,
      if (reason != null) 'reason': reason,
      if (metadata != null) 'metadata': metadata,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreateCoinTransactionRequest',
      'transactionKey': transactionKey,
      'amount': amount,
      if (currency != null) 'currency': currency,
      'type': type.toJson(),
      if (relatedEntityId != null) 'relatedEntityId': relatedEntityId,
      if (reversalOfTransactionId != null)
        'reversalOfTransactionId': reversalOfTransactionId,
      if (reason != null) 'reason': reason,
      if (metadata != null) 'metadata': metadata,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateCoinTransactionRequestImpl extends CreateCoinTransactionRequest {
  _CreateCoinTransactionRequestImpl({
    required String transactionKey,
    required int amount,
    String? currency,
    required _i2.CoinTransactionType type,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
  }) : super._(
         transactionKey: transactionKey,
         amount: amount,
         currency: currency,
         type: type,
         relatedEntityId: relatedEntityId,
         reversalOfTransactionId: reversalOfTransactionId,
         reason: reason,
         metadata: metadata,
       );

  /// Returns a shallow copy of this [CreateCoinTransactionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateCoinTransactionRequest copyWith({
    String? transactionKey,
    int? amount,
    Object? currency = _Undefined,
    _i2.CoinTransactionType? type,
    Object? relatedEntityId = _Undefined,
    Object? reversalOfTransactionId = _Undefined,
    Object? reason = _Undefined,
    Object? metadata = _Undefined,
  }) {
    return CreateCoinTransactionRequest(
      transactionKey: transactionKey ?? this.transactionKey,
      amount: amount ?? this.amount,
      currency: currency is String? ? currency : this.currency,
      type: type ?? this.type,
      relatedEntityId: relatedEntityId is String?
          ? relatedEntityId
          : this.relatedEntityId,
      reversalOfTransactionId: reversalOfTransactionId is int?
          ? reversalOfTransactionId
          : this.reversalOfTransactionId,
      reason: reason is String? ? reason : this.reason,
      metadata: metadata is String? ? metadata : this.metadata,
    );
  }
}
