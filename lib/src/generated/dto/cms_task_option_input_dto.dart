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

abstract class CmsTaskOptionInputDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CmsTaskOptionInputDto._({
    this.id,
    required this.optionText,
    required this.isCorrect,
  });

  factory CmsTaskOptionInputDto({
    int? id,
    required String optionText,
    required bool isCorrect,
  }) = _CmsTaskOptionInputDtoImpl;

  factory CmsTaskOptionInputDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CmsTaskOptionInputDto(
      id: jsonSerialization['id'] as int?,
      optionText: jsonSerialization['optionText'] as String,
      isCorrect: jsonSerialization['isCorrect'] as bool,
    );
  }

  int? id;

  String optionText;

  bool isCorrect;

  /// Returns a shallow copy of this [CmsTaskOptionInputDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CmsTaskOptionInputDto copyWith({
    int? id,
    String? optionText,
    bool? isCorrect,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CmsTaskOptionInputDto',
      if (id != null) 'id': id,
      'optionText': optionText,
      'isCorrect': isCorrect,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CmsTaskOptionInputDto',
      if (id != null) 'id': id,
      'optionText': optionText,
      'isCorrect': isCorrect,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CmsTaskOptionInputDtoImpl extends CmsTaskOptionInputDto {
  _CmsTaskOptionInputDtoImpl({
    int? id,
    required String optionText,
    required bool isCorrect,
  }) : super._(
         id: id,
         optionText: optionText,
         isCorrect: isCorrect,
       );

  /// Returns a shallow copy of this [CmsTaskOptionInputDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CmsTaskOptionInputDto copyWith({
    Object? id = _Undefined,
    String? optionText,
    bool? isCorrect,
  }) {
    return CmsTaskOptionInputDto(
      id: id is int? ? id : this.id,
      optionText: optionText ?? this.optionText,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}
