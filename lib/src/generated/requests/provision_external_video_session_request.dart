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
import '../enums/external_integration_provider.dart' as _i2;

abstract class ProvisionExternalVideoSessionRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ProvisionExternalVideoSessionRequest._({
    required this.provider,
    this.baseUrl,
    required this.accessToken,
    this.accountIdentifier,
    required this.lessonId,
    this.sessionTitle,
  });

  factory ProvisionExternalVideoSessionRequest({
    required _i2.ExternalIntegrationProvider provider,
    String? baseUrl,
    required String accessToken,
    String? accountIdentifier,
    required int lessonId,
    String? sessionTitle,
  }) = _ProvisionExternalVideoSessionRequestImpl;

  factory ProvisionExternalVideoSessionRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ProvisionExternalVideoSessionRequest(
      provider: _i2.ExternalIntegrationProvider.fromJson(
        (jsonSerialization['provider'] as String),
      ),
      baseUrl: jsonSerialization['baseUrl'] as String?,
      accessToken: jsonSerialization['accessToken'] as String,
      accountIdentifier: jsonSerialization['accountIdentifier'] as String?,
      lessonId: jsonSerialization['lessonId'] as int,
      sessionTitle: jsonSerialization['sessionTitle'] as String?,
    );
  }

  _i2.ExternalIntegrationProvider provider;

  String? baseUrl;

  String accessToken;

  String? accountIdentifier;

  int lessonId;

  String? sessionTitle;

  /// Returns a shallow copy of this [ProvisionExternalVideoSessionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProvisionExternalVideoSessionRequest copyWith({
    _i2.ExternalIntegrationProvider? provider,
    String? baseUrl,
    String? accessToken,
    String? accountIdentifier,
    int? lessonId,
    String? sessionTitle,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProvisionExternalVideoSessionRequest',
      'provider': provider.toJson(),
      if (baseUrl != null) 'baseUrl': baseUrl,
      'accessToken': accessToken,
      if (accountIdentifier != null) 'accountIdentifier': accountIdentifier,
      'lessonId': lessonId,
      if (sessionTitle != null) 'sessionTitle': sessionTitle,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProvisionExternalVideoSessionRequest',
      'provider': provider.toJson(),
      if (baseUrl != null) 'baseUrl': baseUrl,
      'accessToken': accessToken,
      if (accountIdentifier != null) 'accountIdentifier': accountIdentifier,
      'lessonId': lessonId,
      if (sessionTitle != null) 'sessionTitle': sessionTitle,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProvisionExternalVideoSessionRequestImpl
    extends ProvisionExternalVideoSessionRequest {
  _ProvisionExternalVideoSessionRequestImpl({
    required _i2.ExternalIntegrationProvider provider,
    String? baseUrl,
    required String accessToken,
    String? accountIdentifier,
    required int lessonId,
    String? sessionTitle,
  }) : super._(
         provider: provider,
         baseUrl: baseUrl,
         accessToken: accessToken,
         accountIdentifier: accountIdentifier,
         lessonId: lessonId,
         sessionTitle: sessionTitle,
       );

  /// Returns a shallow copy of this [ProvisionExternalVideoSessionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProvisionExternalVideoSessionRequest copyWith({
    _i2.ExternalIntegrationProvider? provider,
    Object? baseUrl = _Undefined,
    String? accessToken,
    Object? accountIdentifier = _Undefined,
    int? lessonId,
    Object? sessionTitle = _Undefined,
  }) {
    return ProvisionExternalVideoSessionRequest(
      provider: provider ?? this.provider,
      baseUrl: baseUrl is String? ? baseUrl : this.baseUrl,
      accessToken: accessToken ?? this.accessToken,
      accountIdentifier: accountIdentifier is String?
          ? accountIdentifier
          : this.accountIdentifier,
      lessonId: lessonId ?? this.lessonId,
      sessionTitle: sessionTitle is String? ? sessionTitle : this.sessionTitle,
    );
  }
}
