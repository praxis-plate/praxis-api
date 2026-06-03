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
import '../dto/governance_user_course_dto.dart' as _i2;
import 'package:praxis_server/src/generated/protocol.dart' as _i3;

abstract class GovernanceUserCoursesDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GovernanceUserCoursesDto._({
    required this.authUserId,
    required this.enrolledCourses,
    required this.authoredCourses,
  });

  factory GovernanceUserCoursesDto({
    required _i1.UuidValue authUserId,
    required List<_i2.GovernanceUserCourseDto> enrolledCourses,
    required List<_i2.GovernanceUserCourseDto> authoredCourses,
  }) = _GovernanceUserCoursesDtoImpl;

  factory GovernanceUserCoursesDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return GovernanceUserCoursesDto(
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      enrolledCourses: _i3.Protocol()
          .deserialize<List<_i2.GovernanceUserCourseDto>>(
            jsonSerialization['enrolledCourses'],
          ),
      authoredCourses: _i3.Protocol()
          .deserialize<List<_i2.GovernanceUserCourseDto>>(
            jsonSerialization['authoredCourses'],
          ),
    );
  }

  _i1.UuidValue authUserId;

  List<_i2.GovernanceUserCourseDto> enrolledCourses;

  List<_i2.GovernanceUserCourseDto> authoredCourses;

  /// Returns a shallow copy of this [GovernanceUserCoursesDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GovernanceUserCoursesDto copyWith({
    _i1.UuidValue? authUserId,
    List<_i2.GovernanceUserCourseDto>? enrolledCourses,
    List<_i2.GovernanceUserCourseDto>? authoredCourses,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GovernanceUserCoursesDto',
      'authUserId': authUserId.toJson(),
      'enrolledCourses': enrolledCourses.toJson(valueToJson: (v) => v.toJson()),
      'authoredCourses': authoredCourses.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GovernanceUserCoursesDto',
      'authUserId': authUserId.toJson(),
      'enrolledCourses': enrolledCourses.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'authoredCourses': authoredCourses.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GovernanceUserCoursesDtoImpl extends GovernanceUserCoursesDto {
  _GovernanceUserCoursesDtoImpl({
    required _i1.UuidValue authUserId,
    required List<_i2.GovernanceUserCourseDto> enrolledCourses,
    required List<_i2.GovernanceUserCourseDto> authoredCourses,
  }) : super._(
         authUserId: authUserId,
         enrolledCourses: enrolledCourses,
         authoredCourses: authoredCourses,
       );

  /// Returns a shallow copy of this [GovernanceUserCoursesDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GovernanceUserCoursesDto copyWith({
    _i1.UuidValue? authUserId,
    List<_i2.GovernanceUserCourseDto>? enrolledCourses,
    List<_i2.GovernanceUserCourseDto>? authoredCourses,
  }) {
    return GovernanceUserCoursesDto(
      authUserId: authUserId ?? this.authUserId,
      enrolledCourses:
          enrolledCourses ??
          this.enrolledCourses.map((e0) => e0.copyWith()).toList(),
      authoredCourses:
          authoredCourses ??
          this.authoredCourses.map((e0) => e0.copyWith()).toList(),
    );
  }
}
