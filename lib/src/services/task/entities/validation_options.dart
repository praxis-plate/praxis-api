import 'package:equatable/equatable.dart';

class ValidationOptions extends Equatable {
  final bool caseSensitive;
  final bool exactMatch;
  final List<String>? acceptableAnswers;

  const ValidationOptions({
    this.caseSensitive = false,
    this.exactMatch = false,
    this.acceptableAnswers,
  });

  @override
  List<Object?> get props => [
    caseSensitive,
    exactMatch,
    acceptableAnswers,
  ];

  @override
  bool get stringify => true;
}
