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

abstract class SyncCourseToExternalProviderRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SyncCourseToExternalProviderRequest._({
    required this.provider,
    required this.baseUrl,
    required this.accessToken,
    this.accountIdentifier,
    required this.courseId,
  });

  factory SyncCourseToExternalProviderRequest({
    required _i2.ExternalIntegrationProvider provider,
    required String baseUrl,
    required String accessToken,
    String? accountIdentifier,
    required int courseId,
  }) = _SyncCourseToExternalProviderRequestImpl;

  factory SyncCourseToExternalProviderRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return SyncCourseToExternalProviderRequest(
      provider: _i2.ExternalIntegrationProvider.fromJson(
        (jsonSerialization['provider'] as String),
      ),
      baseUrl: jsonSerialization['baseUrl'] as String,
      accessToken: jsonSerialization['accessToken'] as String,
      accountIdentifier: jsonSerialization['accountIdentifier'] as String?,
      courseId: jsonSerialization['courseId'] as int,
    );
  }

  _i2.ExternalIntegrationProvider provider;

  String baseUrl;

  String accessToken;

  String? accountIdentifier;

  int courseId;

  /// Returns a shallow copy of this [SyncCourseToExternalProviderRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SyncCourseToExternalProviderRequest copyWith({
    _i2.ExternalIntegrationProvider? provider,
    String? baseUrl,
    String? accessToken,
    String? accountIdentifier,
    int? courseId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SyncCourseToExternalProviderRequest',
      'provider': provider.toJson(),
      'baseUrl': baseUrl,
      'accessToken': accessToken,
      if (accountIdentifier != null) 'accountIdentifier': accountIdentifier,
      'courseId': courseId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SyncCourseToExternalProviderRequest',
      'provider': provider.toJson(),
      'baseUrl': baseUrl,
      'accessToken': accessToken,
      if (accountIdentifier != null) 'accountIdentifier': accountIdentifier,
      'courseId': courseId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SyncCourseToExternalProviderRequestImpl
    extends SyncCourseToExternalProviderRequest {
  _SyncCourseToExternalProviderRequestImpl({
    required _i2.ExternalIntegrationProvider provider,
    required String baseUrl,
    required String accessToken,
    String? accountIdentifier,
    required int courseId,
  }) : super._(
         provider: provider,
         baseUrl: baseUrl,
         accessToken: accessToken,
         accountIdentifier: accountIdentifier,
         courseId: courseId,
       );

  /// Returns a shallow copy of this [SyncCourseToExternalProviderRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SyncCourseToExternalProviderRequest copyWith({
    _i2.ExternalIntegrationProvider? provider,
    String? baseUrl,
    String? accessToken,
    Object? accountIdentifier = _Undefined,
    int? courseId,
  }) {
    return SyncCourseToExternalProviderRequest(
      provider: provider ?? this.provider,
      baseUrl: baseUrl ?? this.baseUrl,
      accessToken: accessToken ?? this.accessToken,
      accountIdentifier: accountIdentifier is String?
          ? accountIdentifier
          : this.accountIdentifier,
      courseId: courseId ?? this.courseId,
    );
  }
}
