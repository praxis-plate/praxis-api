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

abstract class TaskAnswerResultDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TaskAnswerResultDto._({
    required this.isCorrect,
    required this.feedbackType,
    this.feedbackMessage,
    this.xpEarned,
  });

  factory TaskAnswerResultDto({
    required bool isCorrect,
    required String feedbackType,
    String? feedbackMessage,
    int? xpEarned,
  }) = _TaskAnswerResultDtoImpl;

  factory TaskAnswerResultDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return TaskAnswerResultDto(
      isCorrect: jsonSerialization['isCorrect'] as bool,
      feedbackType: jsonSerialization['feedbackType'] as String,
      feedbackMessage: jsonSerialization['feedbackMessage'] as String?,
      xpEarned: jsonSerialization['xpEarned'] as int?,
    );
  }

  bool isCorrect;

  String feedbackType;

  String? feedbackMessage;

  int? xpEarned;

  /// Returns a shallow copy of this [TaskAnswerResultDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskAnswerResultDto copyWith({
    bool? isCorrect,
    String? feedbackType,
    String? feedbackMessage,
    int? xpEarned,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TaskAnswerResultDto',
      'isCorrect': isCorrect,
      'feedbackType': feedbackType,
      if (feedbackMessage != null) 'feedbackMessage': feedbackMessage,
      if (xpEarned != null) 'xpEarned': xpEarned,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TaskAnswerResultDto',
      'isCorrect': isCorrect,
      'feedbackType': feedbackType,
      if (feedbackMessage != null) 'feedbackMessage': feedbackMessage,
      if (xpEarned != null) 'xpEarned': xpEarned,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskAnswerResultDtoImpl extends TaskAnswerResultDto {
  _TaskAnswerResultDtoImpl({
    required bool isCorrect,
    required String feedbackType,
    String? feedbackMessage,
    int? xpEarned,
  }) : super._(
         isCorrect: isCorrect,
         feedbackType: feedbackType,
         feedbackMessage: feedbackMessage,
         xpEarned: xpEarned,
       );

  /// Returns a shallow copy of this [TaskAnswerResultDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskAnswerResultDto copyWith({
    bool? isCorrect,
    String? feedbackType,
    Object? feedbackMessage = _Undefined,
    Object? xpEarned = _Undefined,
  }) {
    return TaskAnswerResultDto(
      isCorrect: isCorrect ?? this.isCorrect,
      feedbackType: feedbackType ?? this.feedbackType,
      feedbackMessage: feedbackMessage is String?
          ? feedbackMessage
          : this.feedbackMessage,
      xpEarned: xpEarned is int? ? xpEarned : this.xpEarned,
    );
  }
}
