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

abstract class ExternalVideoSessionDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ExternalVideoSessionDto._({
    required this.provider,
    required this.kind,
    required this.lessonId,
    required this.sessionTitle,
    required this.lessonVideoUrl,
    this.hostUrl,
    required this.meetingCode,
    this.accountIdentifier,
    required this.provisionedAt,
  });

  factory ExternalVideoSessionDto({
    required _i2.ExternalIntegrationProvider provider,
    required _i3.ExternalIntegrationKind kind,
    required int lessonId,
    required String sessionTitle,
    required String lessonVideoUrl,
    String? hostUrl,
    required String meetingCode,
    String? accountIdentifier,
    required DateTime provisionedAt,
  }) = _ExternalVideoSessionDtoImpl;

  factory ExternalVideoSessionDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ExternalVideoSessionDto(
      provider: _i2.ExternalIntegrationProvider.fromJson(
        (jsonSerialization['provider'] as String),
      ),
      kind: _i3.ExternalIntegrationKind.fromJson(
        (jsonSerialization['kind'] as String),
      ),
      lessonId: jsonSerialization['lessonId'] as int,
      sessionTitle: jsonSerialization['sessionTitle'] as String,
      lessonVideoUrl: jsonSerialization['lessonVideoUrl'] as String,
      hostUrl: jsonSerialization['hostUrl'] as String?,
      meetingCode: jsonSerialization['meetingCode'] as String,
      accountIdentifier: jsonSerialization['accountIdentifier'] as String?,
      provisionedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['provisionedAt'],
      ),
    );
  }

  _i2.ExternalIntegrationProvider provider;

  _i3.ExternalIntegrationKind kind;

  int lessonId;

  String sessionTitle;

  String lessonVideoUrl;

  String? hostUrl;

  String meetingCode;

  String? accountIdentifier;

  DateTime provisionedAt;

  /// Returns a shallow copy of this [ExternalVideoSessionDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ExternalVideoSessionDto copyWith({
    _i2.ExternalIntegrationProvider? provider,
    _i3.ExternalIntegrationKind? kind,
    int? lessonId,
    String? sessionTitle,
    String? lessonVideoUrl,
    String? hostUrl,
    String? meetingCode,
    String? accountIdentifier,
    DateTime? provisionedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ExternalVideoSessionDto',
      'provider': provider.toJson(),
      'kind': kind.toJson(),
      'lessonId': lessonId,
      'sessionTitle': sessionTitle,
      'lessonVideoUrl': lessonVideoUrl,
      if (hostUrl != null) 'hostUrl': hostUrl,
      'meetingCode': meetingCode,
      if (accountIdentifier != null) 'accountIdentifier': accountIdentifier,
      'provisionedAt': provisionedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ExternalVideoSessionDto',
      'provider': provider.toJson(),
      'kind': kind.toJson(),
      'lessonId': lessonId,
      'sessionTitle': sessionTitle,
      'lessonVideoUrl': lessonVideoUrl,
      if (hostUrl != null) 'hostUrl': hostUrl,
      'meetingCode': meetingCode,
      if (accountIdentifier != null) 'accountIdentifier': accountIdentifier,
      'provisionedAt': provisionedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ExternalVideoSessionDtoImpl extends ExternalVideoSessionDto {
  _ExternalVideoSessionDtoImpl({
    required _i2.ExternalIntegrationProvider provider,
    required _i3.ExternalIntegrationKind kind,
    required int lessonId,
    required String sessionTitle,
    required String lessonVideoUrl,
    String? hostUrl,
    required String meetingCode,
    String? accountIdentifier,
    required DateTime provisionedAt,
  }) : super._(
         provider: provider,
         kind: kind,
         lessonId: lessonId,
         sessionTitle: sessionTitle,
         lessonVideoUrl: lessonVideoUrl,
         hostUrl: hostUrl,
         meetingCode: meetingCode,
         accountIdentifier: accountIdentifier,
         provisionedAt: provisionedAt,
       );

  /// Returns a shallow copy of this [ExternalVideoSessionDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ExternalVideoSessionDto copyWith({
    _i2.ExternalIntegrationProvider? provider,
    _i3.ExternalIntegrationKind? kind,
    int? lessonId,
    String? sessionTitle,
    String? lessonVideoUrl,
    Object? hostUrl = _Undefined,
    String? meetingCode,
    Object? accountIdentifier = _Undefined,
    DateTime? provisionedAt,
  }) {
    return ExternalVideoSessionDto(
      provider: provider ?? this.provider,
      kind: kind ?? this.kind,
      lessonId: lessonId ?? this.lessonId,
      sessionTitle: sessionTitle ?? this.sessionTitle,
      lessonVideoUrl: lessonVideoUrl ?? this.lessonVideoUrl,
      hostUrl: hostUrl is String? ? hostUrl : this.hostUrl,
      meetingCode: meetingCode ?? this.meetingCode,
      accountIdentifier: accountIdentifier is String?
          ? accountIdentifier
          : this.accountIdentifier,
      provisionedAt: provisionedAt ?? this.provisionedAt,
    );
  }
}
