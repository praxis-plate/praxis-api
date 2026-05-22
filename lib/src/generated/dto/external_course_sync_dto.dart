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
import '../enums/content_status.dart' as _i4;

abstract class ExternalCourseSyncDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ExternalCourseSyncDto._({
    required this.provider,
    required this.kind,
    required this.courseId,
    required this.externalCourseId,
    required this.externalCourseUrl,
    this.accountIdentifier,
    required this.contentStatus,
    required this.exportedModules,
    required this.exportedLessons,
    required this.exportedTasks,
    required this.syncedAt,
    required this.summary,
  });

  factory ExternalCourseSyncDto({
    required _i2.ExternalIntegrationProvider provider,
    required _i3.ExternalIntegrationKind kind,
    required int courseId,
    required String externalCourseId,
    required String externalCourseUrl,
    String? accountIdentifier,
    required _i4.ContentStatus contentStatus,
    required int exportedModules,
    required int exportedLessons,
    required int exportedTasks,
    required DateTime syncedAt,
    required String summary,
  }) = _ExternalCourseSyncDtoImpl;

  factory ExternalCourseSyncDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ExternalCourseSyncDto(
      provider: _i2.ExternalIntegrationProvider.fromJson(
        (jsonSerialization['provider'] as String),
      ),
      kind: _i3.ExternalIntegrationKind.fromJson(
        (jsonSerialization['kind'] as String),
      ),
      courseId: jsonSerialization['courseId'] as int,
      externalCourseId: jsonSerialization['externalCourseId'] as String,
      externalCourseUrl: jsonSerialization['externalCourseUrl'] as String,
      accountIdentifier: jsonSerialization['accountIdentifier'] as String?,
      contentStatus: _i4.ContentStatus.fromJson(
        (jsonSerialization['contentStatus'] as String),
      ),
      exportedModules: jsonSerialization['exportedModules'] as int,
      exportedLessons: jsonSerialization['exportedLessons'] as int,
      exportedTasks: jsonSerialization['exportedTasks'] as int,
      syncedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['syncedAt'],
      ),
      summary: jsonSerialization['summary'] as String,
    );
  }

  _i2.ExternalIntegrationProvider provider;

  _i3.ExternalIntegrationKind kind;

  int courseId;

  String externalCourseId;

  String externalCourseUrl;

  String? accountIdentifier;

  _i4.ContentStatus contentStatus;

  int exportedModules;

  int exportedLessons;

  int exportedTasks;

  DateTime syncedAt;

  String summary;

  /// Returns a shallow copy of this [ExternalCourseSyncDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ExternalCourseSyncDto copyWith({
    _i2.ExternalIntegrationProvider? provider,
    _i3.ExternalIntegrationKind? kind,
    int? courseId,
    String? externalCourseId,
    String? externalCourseUrl,
    String? accountIdentifier,
    _i4.ContentStatus? contentStatus,
    int? exportedModules,
    int? exportedLessons,
    int? exportedTasks,
    DateTime? syncedAt,
    String? summary,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ExternalCourseSyncDto',
      'provider': provider.toJson(),
      'kind': kind.toJson(),
      'courseId': courseId,
      'externalCourseId': externalCourseId,
      'externalCourseUrl': externalCourseUrl,
      if (accountIdentifier != null) 'accountIdentifier': accountIdentifier,
      'contentStatus': contentStatus.toJson(),
      'exportedModules': exportedModules,
      'exportedLessons': exportedLessons,
      'exportedTasks': exportedTasks,
      'syncedAt': syncedAt.toJson(),
      'summary': summary,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ExternalCourseSyncDto',
      'provider': provider.toJson(),
      'kind': kind.toJson(),
      'courseId': courseId,
      'externalCourseId': externalCourseId,
      'externalCourseUrl': externalCourseUrl,
      if (accountIdentifier != null) 'accountIdentifier': accountIdentifier,
      'contentStatus': contentStatus.toJson(),
      'exportedModules': exportedModules,
      'exportedLessons': exportedLessons,
      'exportedTasks': exportedTasks,
      'syncedAt': syncedAt.toJson(),
      'summary': summary,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ExternalCourseSyncDtoImpl extends ExternalCourseSyncDto {
  _ExternalCourseSyncDtoImpl({
    required _i2.ExternalIntegrationProvider provider,
    required _i3.ExternalIntegrationKind kind,
    required int courseId,
    required String externalCourseId,
    required String externalCourseUrl,
    String? accountIdentifier,
    required _i4.ContentStatus contentStatus,
    required int exportedModules,
    required int exportedLessons,
    required int exportedTasks,
    required DateTime syncedAt,
    required String summary,
  }) : super._(
         provider: provider,
         kind: kind,
         courseId: courseId,
         externalCourseId: externalCourseId,
         externalCourseUrl: externalCourseUrl,
         accountIdentifier: accountIdentifier,
         contentStatus: contentStatus,
         exportedModules: exportedModules,
         exportedLessons: exportedLessons,
         exportedTasks: exportedTasks,
         syncedAt: syncedAt,
         summary: summary,
       );

  /// Returns a shallow copy of this [ExternalCourseSyncDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ExternalCourseSyncDto copyWith({
    _i2.ExternalIntegrationProvider? provider,
    _i3.ExternalIntegrationKind? kind,
    int? courseId,
    String? externalCourseId,
    String? externalCourseUrl,
    Object? accountIdentifier = _Undefined,
    _i4.ContentStatus? contentStatus,
    int? exportedModules,
    int? exportedLessons,
    int? exportedTasks,
    DateTime? syncedAt,
    String? summary,
  }) {
    return ExternalCourseSyncDto(
      provider: provider ?? this.provider,
      kind: kind ?? this.kind,
      courseId: courseId ?? this.courseId,
      externalCourseId: externalCourseId ?? this.externalCourseId,
      externalCourseUrl: externalCourseUrl ?? this.externalCourseUrl,
      accountIdentifier: accountIdentifier is String?
          ? accountIdentifier
          : this.accountIdentifier,
      contentStatus: contentStatus ?? this.contentStatus,
      exportedModules: exportedModules ?? this.exportedModules,
      exportedLessons: exportedLessons ?? this.exportedLessons,
      exportedTasks: exportedTasks ?? this.exportedTasks,
      syncedAt: syncedAt ?? this.syncedAt,
      summary: summary ?? this.summary,
    );
  }
}
