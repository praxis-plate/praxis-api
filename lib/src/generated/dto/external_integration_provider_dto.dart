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
import '../enums/external_integration_kind.dart' as _i3;
import '../enums/external_integration_auth_scheme.dart' as _i4;

abstract class ExternalIntegrationProviderDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ExternalIntegrationProviderDto._({
    required this.provider,
    required this.kind,
    required this.displayName,
    required this.authScheme,
    required this.requiresBaseUrl,
    required this.supportsCourseSync,
    required this.supportsLessonVideoSession,
  });

  factory ExternalIntegrationProviderDto({
    required _i2.ExternalIntegrationProvider provider,
    required _i3.ExternalIntegrationKind kind,
    required String displayName,
    required _i4.ExternalIntegrationAuthScheme authScheme,
    required bool requiresBaseUrl,
    required bool supportsCourseSync,
    required bool supportsLessonVideoSession,
  }) = _ExternalIntegrationProviderDtoImpl;

  factory ExternalIntegrationProviderDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ExternalIntegrationProviderDto(
      provider: _i2.ExternalIntegrationProvider.fromJson(
        (jsonSerialization['provider'] as String),
      ),
      kind: _i3.ExternalIntegrationKind.fromJson(
        (jsonSerialization['kind'] as String),
      ),
      displayName: jsonSerialization['displayName'] as String,
      authScheme: _i4.ExternalIntegrationAuthScheme.fromJson(
        (jsonSerialization['authScheme'] as String),
      ),
      requiresBaseUrl: jsonSerialization['requiresBaseUrl'] as bool,
      supportsCourseSync: jsonSerialization['supportsCourseSync'] as bool,
      supportsLessonVideoSession:
          jsonSerialization['supportsLessonVideoSession'] as bool,
    );
  }

  _i2.ExternalIntegrationProvider provider;

  _i3.ExternalIntegrationKind kind;

  String displayName;

  _i4.ExternalIntegrationAuthScheme authScheme;

  bool requiresBaseUrl;

  bool supportsCourseSync;

  bool supportsLessonVideoSession;

  /// Returns a shallow copy of this [ExternalIntegrationProviderDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ExternalIntegrationProviderDto copyWith({
    _i2.ExternalIntegrationProvider? provider,
    _i3.ExternalIntegrationKind? kind,
    String? displayName,
    _i4.ExternalIntegrationAuthScheme? authScheme,
    bool? requiresBaseUrl,
    bool? supportsCourseSync,
    bool? supportsLessonVideoSession,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ExternalIntegrationProviderDto',
      'provider': provider.toJson(),
      'kind': kind.toJson(),
      'displayName': displayName,
      'authScheme': authScheme.toJson(),
      'requiresBaseUrl': requiresBaseUrl,
      'supportsCourseSync': supportsCourseSync,
      'supportsLessonVideoSession': supportsLessonVideoSession,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ExternalIntegrationProviderDto',
      'provider': provider.toJson(),
      'kind': kind.toJson(),
      'displayName': displayName,
      'authScheme': authScheme.toJson(),
      'requiresBaseUrl': requiresBaseUrl,
      'supportsCourseSync': supportsCourseSync,
      'supportsLessonVideoSession': supportsLessonVideoSession,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ExternalIntegrationProviderDtoImpl
    extends ExternalIntegrationProviderDto {
  _ExternalIntegrationProviderDtoImpl({
    required _i2.ExternalIntegrationProvider provider,
    required _i3.ExternalIntegrationKind kind,
    required String displayName,
    required _i4.ExternalIntegrationAuthScheme authScheme,
    required bool requiresBaseUrl,
    required bool supportsCourseSync,
    required bool supportsLessonVideoSession,
  }) : super._(
         provider: provider,
         kind: kind,
         displayName: displayName,
         authScheme: authScheme,
         requiresBaseUrl: requiresBaseUrl,
         supportsCourseSync: supportsCourseSync,
         supportsLessonVideoSession: supportsLessonVideoSession,
       );

  /// Returns a shallow copy of this [ExternalIntegrationProviderDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ExternalIntegrationProviderDto copyWith({
    _i2.ExternalIntegrationProvider? provider,
    _i3.ExternalIntegrationKind? kind,
    String? displayName,
    _i4.ExternalIntegrationAuthScheme? authScheme,
    bool? requiresBaseUrl,
    bool? supportsCourseSync,
    bool? supportsLessonVideoSession,
  }) {
    return ExternalIntegrationProviderDto(
      provider: provider ?? this.provider,
      kind: kind ?? this.kind,
      displayName: displayName ?? this.displayName,
      authScheme: authScheme ?? this.authScheme,
      requiresBaseUrl: requiresBaseUrl ?? this.requiresBaseUrl,
      supportsCourseSync: supportsCourseSync ?? this.supportsCourseSync,
      supportsLessonVideoSession:
          supportsLessonVideoSession ?? this.supportsLessonVideoSession,
    );
  }
}
