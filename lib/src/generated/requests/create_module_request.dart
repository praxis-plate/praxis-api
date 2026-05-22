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

abstract class CreateModuleRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateModuleRequest._({
    required this.courseId,
    required this.title,
    required this.description,
  });

  factory CreateModuleRequest({
    required int courseId,
    required String title,
    required String description,
  }) = _CreateModuleRequestImpl;

  factory CreateModuleRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreateModuleRequest(
      courseId: jsonSerialization['courseId'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
    );
  }

  int courseId;

  String title;

  String description;

  /// Returns a shallow copy of this [CreateModuleRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateModuleRequest copyWith({
    int? courseId,
    String? title,
    String? description,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateModuleRequest',
      'courseId': courseId,
      'title': title,
      'description': description,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreateModuleRequest',
      'courseId': courseId,
      'title': title,
      'description': description,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CreateModuleRequestImpl extends CreateModuleRequest {
  _CreateModuleRequestImpl({
    required int courseId,
    required String title,
    required String description,
  }) : super._(
         courseId: courseId,
         title: title,
         description: description,
       );

  /// Returns a shallow copy of this [CreateModuleRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateModuleRequest copyWith({
    int? courseId,
    String? title,
    String? description,
  }) {
    return CreateModuleRequest(
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
