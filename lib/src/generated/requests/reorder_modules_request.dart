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
import 'package:praxis_server/src/generated/protocol.dart' as _i2;

abstract class ReorderModulesRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ReorderModulesRequest._({
    required this.courseId,
    required this.orderedModuleIds,
  });

  factory ReorderModulesRequest({
    required int courseId,
    required List<int> orderedModuleIds,
  }) = _ReorderModulesRequestImpl;

  factory ReorderModulesRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ReorderModulesRequest(
      courseId: jsonSerialization['courseId'] as int,
      orderedModuleIds: _i2.Protocol().deserialize<List<int>>(
        jsonSerialization['orderedModuleIds'],
      ),
    );
  }

  int courseId;

  List<int> orderedModuleIds;

  /// Returns a shallow copy of this [ReorderModulesRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReorderModulesRequest copyWith({
    int? courseId,
    List<int>? orderedModuleIds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReorderModulesRequest',
      'courseId': courseId,
      'orderedModuleIds': orderedModuleIds.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ReorderModulesRequest',
      'courseId': courseId,
      'orderedModuleIds': orderedModuleIds.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ReorderModulesRequestImpl extends ReorderModulesRequest {
  _ReorderModulesRequestImpl({
    required int courseId,
    required List<int> orderedModuleIds,
  }) : super._(
         courseId: courseId,
         orderedModuleIds: orderedModuleIds,
       );

  /// Returns a shallow copy of this [ReorderModulesRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReorderModulesRequest copyWith({
    int? courseId,
    List<int>? orderedModuleIds,
  }) {
    return ReorderModulesRequest(
      courseId: courseId ?? this.courseId,
      orderedModuleIds:
          orderedModuleIds ?? this.orderedModuleIds.map((e0) => e0).toList(),
    );
  }
}
