enum TaskAnswerFeedbackType {
  correct('correct'),
  incorrect('incorrect'),
  invalidFormat('invalidFormat'),
  partiallyCorrect('partiallyCorrect'),
  executionError('executionError')
  ;

  const TaskAnswerFeedbackType(this.value);

  final String value;
}
