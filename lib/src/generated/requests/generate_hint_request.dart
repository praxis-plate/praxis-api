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

abstract class GenerateHintRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GenerateHintRequest._({
    required this.question,
    required this.codeContext,
    required this.language,
    required this.topic,
  });

  factory GenerateHintRequest({
    required String question,
    required String codeContext,
    required String language,
    required String topic,
  }) = _GenerateHintRequestImpl;

  factory GenerateHintRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return GenerateHintRequest(
      question: jsonSerialization['question'] as String,
      codeContext: jsonSerialization['codeContext'] as String,
      language: jsonSerialization['language'] as String,
      topic: jsonSerialization['topic'] as String,
    );
  }

  String question;

  String codeContext;

  String language;

  String topic;

  /// Returns a shallow copy of this [GenerateHintRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GenerateHintRequest copyWith({
    String? question,
    String? codeContext,
    String? language,
    String? topic,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GenerateHintRequest',
      'question': question,
      'codeContext': codeContext,
      'language': language,
      'topic': topic,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GenerateHintRequest',
      'question': question,
      'codeContext': codeContext,
      'language': language,
      'topic': topic,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GenerateHintRequestImpl extends GenerateHintRequest {
  _GenerateHintRequestImpl({
    required String question,
    required String codeContext,
    required String language,
    required String topic,
  }) : super._(
         question: question,
         codeContext: codeContext,
         language: language,
         topic: topic,
       );

  /// Returns a shallow copy of this [GenerateHintRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GenerateHintRequest copyWith({
    String? question,
    String? codeContext,
    String? language,
    String? topic,
  }) {
    return GenerateHintRequest(
      question: question ?? this.question,
      codeContext: codeContext ?? this.codeContext,
      language: language ?? this.language,
      topic: topic ?? this.topic,
    );
  }
}
