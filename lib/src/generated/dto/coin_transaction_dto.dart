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

abstract class CoinTransactionDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CoinTransactionDto._({
    required this.id,
    required this.authUserId,
    required this.transactionKey,
    required this.type,
    required this.status,
    required this.amount,
    required this.currency,
    this.relatedEntityId,
    this.reversalOfTransactionId,
    this.reason,
    this.metadata,
    required this.createdAt,
  });

  factory CoinTransactionDto({
    required int id,
    required String authUserId,
    required String transactionKey,
    required _i2.CoinTransactionType type,
    required String status,
    required int amount,
    required String currency,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
    required DateTime createdAt,
  }) = _CoinTransactionDtoImpl;

  factory CoinTransactionDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CoinTransactionDto(
      id: jsonSerialization['id'] as int,
      authUserId: jsonSerialization['authUserId'] as String,
      transactionKey: jsonSerialization['transactionKey'] as String,
      type: _i2.CoinTransactionType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      status: jsonSerialization['status'] as String,
      amount: jsonSerialization['amount'] as int,
      currency: jsonSerialization['currency'] as String,
      relatedEntityId: jsonSerialization['relatedEntityId'] as String?,
      reversalOfTransactionId:
          jsonSerialization['reversalOfTransactionId'] as int?,
      reason: jsonSerialization['reason'] as String?,
      metadata: jsonSerialization['metadata'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  int id;

  String authUserId;

  String transactionKey;

  _i2.CoinTransactionType type;

  String status;

  int amount;

  String currency;

  String? relatedEntityId;

  int? reversalOfTransactionId;

  String? reason;

  String? metadata;

  DateTime createdAt;

  /// Returns a shallow copy of this [CoinTransactionDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CoinTransactionDto copyWith({
    int? id,
    String? authUserId,
    String? transactionKey,
    _i2.CoinTransactionType? type,
    String? status,
    int? amount,
    String? currency,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CoinTransactionDto',
      'id': id,
      'authUserId': authUserId,
      'transactionKey': transactionKey,
      'type': type.toJson(),
      'status': status,
      'amount': amount,
      'currency': currency,
      if (relatedEntityId != null) 'relatedEntityId': relatedEntityId,
      if (reversalOfTransactionId != null)
        'reversalOfTransactionId': reversalOfTransactionId,
      if (reason != null) 'reason': reason,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CoinTransactionDto',
      'id': id,
      'authUserId': authUserId,
      'transactionKey': transactionKey,
      'type': type.toJson(),
      'status': status,
      'amount': amount,
      'currency': currency,
      if (relatedEntityId != null) 'relatedEntityId': relatedEntityId,
      if (reversalOfTransactionId != null)
        'reversalOfTransactionId': reversalOfTransactionId,
      if (reason != null) 'reason': reason,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CoinTransactionDtoImpl extends CoinTransactionDto {
  _CoinTransactionDtoImpl({
    required int id,
    required String authUserId,
    required String transactionKey,
    required _i2.CoinTransactionType type,
    required String status,
    required int amount,
    required String currency,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
    required DateTime createdAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         transactionKey: transactionKey,
         type: type,
         status: status,
         amount: amount,
         currency: currency,
         relatedEntityId: relatedEntityId,
         reversalOfTransactionId: reversalOfTransactionId,
         reason: reason,
         metadata: metadata,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CoinTransactionDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CoinTransactionDto copyWith({
    int? id,
    String? authUserId,
    String? transactionKey,
    _i2.CoinTransactionType? type,
    String? status,
    int? amount,
    String? currency,
    Object? relatedEntityId = _Undefined,
    Object? reversalOfTransactionId = _Undefined,
    Object? reason = _Undefined,
    Object? metadata = _Undefined,
    DateTime? createdAt,
  }) {
    return CoinTransactionDto(
      id: id ?? this.id,
      authUserId: authUserId ?? this.authUserId,
      transactionKey: transactionKey ?? this.transactionKey,
      type: type ?? this.type,
      status: status ?? this.status,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      relatedEntityId: relatedEntityId is String?
          ? relatedEntityId
          : this.relatedEntityId,
      reversalOfTransactionId: reversalOfTransactionId is int?
          ? reversalOfTransactionId
          : this.reversalOfTransactionId,
      reason: reason is String? ? reason : this.reason,
      metadata: metadata is String? ? metadata : this.metadata,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
