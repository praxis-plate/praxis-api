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
import '../dto/cms_task_test_case_input_dto.dart' as _i2;
import 'package:praxis_server/src/generated/protocol.dart' as _i3;

abstract class UpsertTaskTestCasesRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UpsertTaskTestCasesRequest._({
    required this.taskId,
    required this.testCases,
  });

  factory UpsertTaskTestCasesRequest({
    required int taskId,
    required List<_i2.CmsTaskTestCaseInputDto> testCases,
  }) = _UpsertTaskTestCasesRequestImpl;

  factory UpsertTaskTestCasesRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UpsertTaskTestCasesRequest(
      taskId: jsonSerialization['taskId'] as int,
      testCases: _i3.Protocol().deserialize<List<_i2.CmsTaskTestCaseInputDto>>(
        jsonSerialization['testCases'],
      ),
    );
  }

  int taskId;

  List<_i2.CmsTaskTestCaseInputDto> testCases;

  /// Returns a shallow copy of this [UpsertTaskTestCasesRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpsertTaskTestCasesRequest copyWith({
    int? taskId,
    List<_i2.CmsTaskTestCaseInputDto>? testCases,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpsertTaskTestCasesRequest',
      'taskId': taskId,
      'testCases': testCases.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UpsertTaskTestCasesRequest',
      'taskId': taskId,
      'testCases': testCases.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UpsertTaskTestCasesRequestImpl extends UpsertTaskTestCasesRequest {
  _UpsertTaskTestCasesRequestImpl({
    required int taskId,
    required List<_i2.CmsTaskTestCaseInputDto> testCases,
  }) : super._(
         taskId: taskId,
         testCases: testCases,
       );

  /// Returns a shallow copy of this [UpsertTaskTestCasesRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpsertTaskTestCasesRequest copyWith({
    int? taskId,
    List<_i2.CmsTaskTestCaseInputDto>? testCases,
  }) {
    return UpsertTaskTestCasesRequest(
      taskId: taskId ?? this.taskId,
      testCases:
          testCases ?? this.testCases.map((e0) => e0.copyWith()).toList(),
    );
  }
}
