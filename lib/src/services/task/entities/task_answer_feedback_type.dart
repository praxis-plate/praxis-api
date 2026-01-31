enum TaskAnswerFeedbackType {
  correct('correct'),
  incorrect('incorrect'),
  invalidFormat('invalidFormat'),
  partiallyCorrect('partiallyCorrect')
  ;

  const TaskAnswerFeedbackType(this.value);

  final String value;
}
