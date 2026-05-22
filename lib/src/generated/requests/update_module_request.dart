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

abstract class UpdateModuleRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UpdateModuleRequest._({
    required this.id,
    required this.title,
    required this.description,
  });

  factory UpdateModuleRequest({
    required int id,
    required String title,
    required String description,
  }) = _UpdateModuleRequestImpl;

  factory UpdateModuleRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return UpdateModuleRequest(
      id: jsonSerialization['id'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
    );
  }

  int id;

  String title;

  String description;

  /// Returns a shallow copy of this [UpdateModuleRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateModuleRequest copyWith({
    int? id,
    String? title,
    String? description,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateModuleRequest',
      'id': id,
      'title': title,
      'description': description,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UpdateModuleRequest',
      'id': id,
      'title': title,
      'description': description,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UpdateModuleRequestImpl extends UpdateModuleRequest {
  _UpdateModuleRequestImpl({
    required int id,
    required String title,
    required String description,
  }) : super._(
         id: id,
         title: title,
         description: description,
       );

  /// Returns a shallow copy of this [UpdateModuleRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateModuleRequest copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return UpdateModuleRequest(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
