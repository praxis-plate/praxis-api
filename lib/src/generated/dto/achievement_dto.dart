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

abstract class AchievementDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AchievementDto._({
    required this.id,
    required this.title,
    required this.description,
    this.iconUrl,
    this.unlockedAt,
  });

  factory AchievementDto({
    required int id,
    required String title,
    required String description,
    String? iconUrl,
    DateTime? unlockedAt,
  }) = _AchievementDtoImpl;

  factory AchievementDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return AchievementDto(
      id: jsonSerialization['id'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      iconUrl: jsonSerialization['iconUrl'] as String?,
      unlockedAt: jsonSerialization['unlockedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['unlockedAt']),
    );
  }

  int id;

  String title;

  String description;

  String? iconUrl;

  DateTime? unlockedAt;

  /// Returns a shallow copy of this [AchievementDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AchievementDto copyWith({
    int? id,
    String? title,
    String? description,
    String? iconUrl,
    DateTime? unlockedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AchievementDto',
      'id': id,
      'title': title,
      'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      if (unlockedAt != null) 'unlockedAt': unlockedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AchievementDto',
      'id': id,
      'title': title,
      'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      if (unlockedAt != null) 'unlockedAt': unlockedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AchievementDtoImpl extends AchievementDto {
  _AchievementDtoImpl({
    required int id,
    required String title,
    required String description,
    String? iconUrl,
    DateTime? unlockedAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         iconUrl: iconUrl,
         unlockedAt: unlockedAt,
       );

  /// Returns a shallow copy of this [AchievementDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AchievementDto copyWith({
    int? id,
    String? title,
    String? description,
    Object? iconUrl = _Undefined,
    Object? unlockedAt = _Undefined,
  }) {
    return AchievementDto(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      iconUrl: iconUrl is String? ? iconUrl : this.iconUrl,
      unlockedAt: unlockedAt is DateTime? ? unlockedAt : this.unlockedAt,
    );
  }
}
