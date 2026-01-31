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

abstract class ModuleDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ModuleDto._({
    required this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.orderIndex,
    required this.createdAt,
  });

  factory ModuleDto({
    required int id,
    required int courseId,
    required String title,
    required String description,
    required int orderIndex,
    required DateTime createdAt,
  }) = _ModuleDtoImpl;

  factory ModuleDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return ModuleDto(
      id: jsonSerialization['id'] as int,
      courseId: jsonSerialization['courseId'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      orderIndex: jsonSerialization['orderIndex'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  int id;

  int courseId;

  String title;

  String description;

  int orderIndex;

  DateTime createdAt;

  /// Returns a shallow copy of this [ModuleDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ModuleDto copyWith({
    int? id,
    int? courseId,
    String? title,
    String? description,
    int? orderIndex,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ModuleDto',
      'id': id,
      'courseId': courseId,
      'title': title,
      'description': description,
      'orderIndex': orderIndex,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ModuleDto',
      'id': id,
      'courseId': courseId,
      'title': title,
      'description': description,
      'orderIndex': orderIndex,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ModuleDtoImpl extends ModuleDto {
  _ModuleDtoImpl({
    required int id,
    required int courseId,
    required String title,
    required String description,
    required int orderIndex,
    required DateTime createdAt,
  }) : super._(
         id: id,
         courseId: courseId,
         title: title,
         description: description,
         orderIndex: orderIndex,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ModuleDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ModuleDto copyWith({
    int? id,
    int? courseId,
    String? title,
    String? description,
    int? orderIndex,
    DateTime? createdAt,
  }) {
    return ModuleDto(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      description: description ?? this.description,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
