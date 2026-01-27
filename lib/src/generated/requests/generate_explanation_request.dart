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

abstract class GenerateExplanationRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GenerateExplanationRequest._({
    required this.question,
    required this.userAnswer,
    required this.correctAnswer,
    this.language,
    required this.topic,
    this.compilationError,
  });

  factory GenerateExplanationRequest({
    required String question,
    required String userAnswer,
    required String correctAnswer,
    String? language,
    required String topic,
    String? compilationError,
  }) = _GenerateExplanationRequestImpl;

  factory GenerateExplanationRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return GenerateExplanationRequest(
      question: jsonSerialization['question'] as String,
      userAnswer: jsonSerialization['userAnswer'] as String,
      correctAnswer: jsonSerialization['correctAnswer'] as String,
      language: jsonSerialization['language'] as String?,
      topic: jsonSerialization['topic'] as String,
      compilationError: jsonSerialization['compilationError'] as String?,
    );
  }

  String question;

  String userAnswer;

  String correctAnswer;

  String? language;

  String topic;

  String? compilationError;

  /// Returns a shallow copy of this [GenerateExplanationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GenerateExplanationRequest copyWith({
    String? question,
    String? userAnswer,
    String? correctAnswer,
    String? language,
    String? topic,
    String? compilationError,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GenerateExplanationRequest',
      'question': question,
      'userAnswer': userAnswer,
      'correctAnswer': correctAnswer,
      if (language != null) 'language': language,
      'topic': topic,
      if (compilationError != null) 'compilationError': compilationError,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GenerateExplanationRequest',
      'question': question,
      'userAnswer': userAnswer,
      'correctAnswer': correctAnswer,
      if (language != null) 'language': language,
      'topic': topic,
      if (compilationError != null) 'compilationError': compilationError,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GenerateExplanationRequestImpl extends GenerateExplanationRequest {
  _GenerateExplanationRequestImpl({
    required String question,
    required String userAnswer,
    required String correctAnswer,
    String? language,
    required String topic,
    String? compilationError,
  }) : super._(
         question: question,
         userAnswer: userAnswer,
         correctAnswer: correctAnswer,
         language: language,
         topic: topic,
         compilationError: compilationError,
       );

  /// Returns a shallow copy of this [GenerateExplanationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GenerateExplanationRequest copyWith({
    String? question,
    String? userAnswer,
    String? correctAnswer,
    Object? language = _Undefined,
    String? topic,
    Object? compilationError = _Undefined,
  }) {
    return GenerateExplanationRequest(
      question: question ?? this.question,
      userAnswer: userAnswer ?? this.userAnswer,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      language: language is String? ? language : this.language,
      topic: topic ?? this.topic,
      compilationError: compilationError is String?
          ? compilationError
          : this.compilationError,
    );
  }
}
