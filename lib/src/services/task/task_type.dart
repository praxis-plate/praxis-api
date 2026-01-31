enum TaskType {
  multipleChoice('multipleChoice'),
  codeCompletion('codeCompletion'),
  matching('matching'),
  textInput('textInput')
  ;

  const TaskType(this.value);

  final String value;
}
