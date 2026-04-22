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

abstract class ReorderLessonsRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ReorderLessonsRequest._({
    required this.moduleId,
    required this.orderedLessonIds,
  });

  factory ReorderLessonsRequest({
    required int moduleId,
    required List<int> orderedLessonIds,
  }) = _ReorderLessonsRequestImpl;

  factory ReorderLessonsRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ReorderLessonsRequest(
      moduleId: jsonSerialization['moduleId'] as int,
      orderedLessonIds: _i2.Protocol().deserialize<List<int>>(
        jsonSerialization['orderedLessonIds'],
      ),
    );
  }

  int moduleId;

  List<int> orderedLessonIds;

  /// Returns a shallow copy of this [ReorderLessonsRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReorderLessonsRequest copyWith({
    int? moduleId,
    List<int>? orderedLessonIds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReorderLessonsRequest',
      'moduleId': moduleId,
      'orderedLessonIds': orderedLessonIds.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ReorderLessonsRequest',
      'moduleId': moduleId,
      'orderedLessonIds': orderedLessonIds.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ReorderLessonsRequestImpl extends ReorderLessonsRequest {
  _ReorderLessonsRequestImpl({
    required int moduleId,
    required List<int> orderedLessonIds,
  }) : super._(
         moduleId: moduleId,
         orderedLessonIds: orderedLessonIds,
       );

  /// Returns a shallow copy of this [ReorderLessonsRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReorderLessonsRequest copyWith({
    int? moduleId,
    List<int>? orderedLessonIds,
  }) {
    return ReorderLessonsRequest(
      moduleId: moduleId ?? this.moduleId,
      orderedLessonIds:
          orderedLessonIds ?? this.orderedLessonIds.map((e0) => e0).toList(),
    );
  }
}
