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

abstract class CmsTaskTestCaseInputDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CmsTaskTestCaseInputDto._({
    this.id,
    required this.input,
    required this.expectedOutput,
    required this.isHidden,
  });

  factory CmsTaskTestCaseInputDto({
    int? id,
    required String input,
    required String expectedOutput,
    required bool isHidden,
  }) = _CmsTaskTestCaseInputDtoImpl;

  factory CmsTaskTestCaseInputDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CmsTaskTestCaseInputDto(
      id: jsonSerialization['id'] as int?,
      input: jsonSerialization['input'] as String,
      expectedOutput: jsonSerialization['expectedOutput'] as String,
      isHidden: jsonSerialization['isHidden'] as bool,
    );
  }

  int? id;

  String input;

  String expectedOutput;

  bool isHidden;

  /// Returns a shallow copy of this [CmsTaskTestCaseInputDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CmsTaskTestCaseInputDto copyWith({
    int? id,
    String? input,
    String? expectedOutput,
    bool? isHidden,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CmsTaskTestCaseInputDto',
      if (id != null) 'id': id,
      'input': input,
      'expectedOutput': expectedOutput,
      'isHidden': isHidden,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CmsTaskTestCaseInputDto',
      if (id != null) 'id': id,
      'input': input,
      'expectedOutput': expectedOutput,
      'isHidden': isHidden,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CmsTaskTestCaseInputDtoImpl extends CmsTaskTestCaseInputDto {
  _CmsTaskTestCaseInputDtoImpl({
    int? id,
    required String input,
    required String expectedOutput,
    required bool isHidden,
  }) : super._(
         id: id,
         input: input,
         expectedOutput: expectedOutput,
         isHidden: isHidden,
       );

  /// Returns a shallow copy of this [CmsTaskTestCaseInputDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CmsTaskTestCaseInputDto copyWith({
    Object? id = _Undefined,
    String? input,
    String? expectedOutput,
    bool? isHidden,
  }) {
    return CmsTaskTestCaseInputDto(
      id: id is int? ? id : this.id,
      input: input ?? this.input,
      expectedOutput: expectedOutput ?? this.expectedOutput,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
