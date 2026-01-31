import 'package:equatable/equatable.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_feedback_type.dart';

class TaskAnswerResult extends Equatable {
  final bool isCorrect;
  final TaskAnswerFeedbackType feedbackType;
  final String? feedbackMessage;
  final int? xpEarned;

  const TaskAnswerResult({
    required this.isCorrect,
    required this.feedbackType,
    this.feedbackMessage,
    this.xpEarned,
  });

  Map<String, dynamic> toJson() {
    return {
      'isCorrect': isCorrect,
      'feedbackType': feedbackType.value,
      if (feedbackMessage != null) 'feedbackMessage': feedbackMessage,
      if (xpEarned != null) 'xpEarned': xpEarned,
    };
  }

  @override
  List<Object?> get props => [
    isCorrect,
    feedbackType,
    feedbackMessage,
    xpEarned,
  ];

  @override
  bool get stringify => true;
}
