import 'package:equatable/equatable.dart';

class TaskAnswerTestCaseResult extends Equatable {
  final bool passed;
  final bool isHidden;
  final String? input;
  final String? expectedOutput;
  final String? actualOutput;
  final String? message;

  const TaskAnswerTestCaseResult({
    required this.passed,
    required this.isHidden,
    this.input,
    this.expectedOutput,
    this.actualOutput,
    this.message,
  });

  @override
  List<Object?> get props => [
    passed,
    isHidden,
    input,
    expectedOutput,
    actualOutput,
    message,
  ];
}
