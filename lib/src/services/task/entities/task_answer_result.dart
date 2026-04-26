import 'package:equatable/equatable.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_feedback_type.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_test_case_result.dart';

class TaskAnswerResult extends Equatable {
  final bool isCorrect;
  final TaskAnswerFeedbackType feedbackType;
  final String? feedbackMessage;
  final int? xpEarned;
  final int? passedTestCases;
  final int? totalTestCases;
  final List<TaskAnswerTestCaseResult>? testCaseResults;

  const TaskAnswerResult({
    required this.isCorrect,
    required this.feedbackType,
    this.feedbackMessage,
    this.xpEarned,
    this.passedTestCases,
    this.totalTestCases,
    this.testCaseResults,
  });

  Map<String, dynamic> toJson() {
    return {
      'isCorrect': isCorrect,
      'feedbackType': feedbackType.value,
      if (feedbackMessage != null) 'feedbackMessage': feedbackMessage,
      if (xpEarned != null) 'xpEarned': xpEarned,
      if (passedTestCases != null) 'passedTestCases': passedTestCases,
      if (totalTestCases != null) 'totalTestCases': totalTestCases,
      if (testCaseResults != null)
        'testCaseResults': testCaseResults
            ?.map(
              (result) => {
                'passed': result.passed,
                'isHidden': result.isHidden,
                if (result.input != null) 'input': result.input,
                if (result.expectedOutput != null)
                  'expectedOutput': result.expectedOutput,
                if (result.actualOutput != null)
                  'actualOutput': result.actualOutput,
                if (result.message != null) 'message': result.message,
              },
            )
            .toList(),
    };
  }

  @override
  List<Object?> get props => [
    isCorrect,
    feedbackType,
    feedbackMessage,
    xpEarned,
    passedTestCases,
    totalTestCases,
    testCaseResults,
  ];

  @override
  bool get stringify => true;
}
