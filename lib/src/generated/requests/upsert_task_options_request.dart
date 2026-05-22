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
import '../dto/cms_task_option_input_dto.dart' as _i2;
import 'package:praxis_server/src/generated/protocol.dart' as _i3;

abstract class UpsertTaskOptionsRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UpsertTaskOptionsRequest._({
    required this.taskId,
    required this.options,
  });

  factory UpsertTaskOptionsRequest({
    required int taskId,
    required List<_i2.CmsTaskOptionInputDto> options,
  }) = _UpsertTaskOptionsRequestImpl;

  factory UpsertTaskOptionsRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UpsertTaskOptionsRequest(
      taskId: jsonSerialization['taskId'] as int,
      options: _i3.Protocol().deserialize<List<_i2.CmsTaskOptionInputDto>>(
        jsonSerialization['options'],
      ),
    );
  }

  int taskId;

  List<_i2.CmsTaskOptionInputDto> options;

  /// Returns a shallow copy of this [UpsertTaskOptionsRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpsertTaskOptionsRequest copyWith({
    int? taskId,
    List<_i2.CmsTaskOptionInputDto>? options,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpsertTaskOptionsRequest',
      'taskId': taskId,
      'options': options.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UpsertTaskOptionsRequest',
      'taskId': taskId,
      'options': options.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UpsertTaskOptionsRequestImpl extends UpsertTaskOptionsRequest {
  _UpsertTaskOptionsRequestImpl({
    required int taskId,
    required List<_i2.CmsTaskOptionInputDto> options,
  }) : super._(
         taskId: taskId,
         options: options,
       );

  /// Returns a shallow copy of this [UpsertTaskOptionsRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpsertTaskOptionsRequest copyWith({
    int? taskId,
    List<_i2.CmsTaskOptionInputDto>? options,
  }) {
    return UpsertTaskOptionsRequest(
      taskId: taskId ?? this.taskId,
      options: options ?? this.options.map((e0) => e0.copyWith()).toList(),
    );
  }
}
