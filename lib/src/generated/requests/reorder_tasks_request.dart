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

abstract class ReorderTasksRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ReorderTasksRequest._({
    required this.lessonId,
    required this.orderedTaskIds,
  });

  factory ReorderTasksRequest({
    required int lessonId,
    required List<int> orderedTaskIds,
  }) = _ReorderTasksRequestImpl;

  factory ReorderTasksRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReorderTasksRequest(
      lessonId: jsonSerialization['lessonId'] as int,
      orderedTaskIds: _i2.Protocol().deserialize<List<int>>(
        jsonSerialization['orderedTaskIds'],
      ),
    );
  }

  int lessonId;

  List<int> orderedTaskIds;

  /// Returns a shallow copy of this [ReorderTasksRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReorderTasksRequest copyWith({
    int? lessonId,
    List<int>? orderedTaskIds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReorderTasksRequest',
      'lessonId': lessonId,
      'orderedTaskIds': orderedTaskIds.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ReorderTasksRequest',
      'lessonId': lessonId,
      'orderedTaskIds': orderedTaskIds.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ReorderTasksRequestImpl extends ReorderTasksRequest {
  _ReorderTasksRequestImpl({
    required int lessonId,
    required List<int> orderedTaskIds,
  }) : super._(
         lessonId: lessonId,
         orderedTaskIds: orderedTaskIds,
       );

  /// Returns a shallow copy of this [ReorderTasksRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReorderTasksRequest copyWith({
    int? lessonId,
    List<int>? orderedTaskIds,
  }) {
    return ReorderTasksRequest(
      lessonId: lessonId ?? this.lessonId,
      orderedTaskIds:
          orderedTaskIds ?? this.orderedTaskIds.map((e0) => e0).toList(),
    );
  }
}
