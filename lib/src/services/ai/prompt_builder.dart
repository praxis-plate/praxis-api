import 'package:praxis_server/src/shared/utils/template_engine_utils.dart';

class PromptBuilder {
  final String _hintTemplate;
  final String _explanationTemplate;

  PromptBuilder({
    required String hintTemplate,
    required String explanationTemplate,
  }) : _hintTemplate = hintTemplate,
       _explanationTemplate = explanationTemplate;

  String buildHintPrompt({
    required String question,
    required String codeContext,
    required String language,
    required String topic,
  }) {
    final codeContextSection = codeContext.isEmpty
        ? ''
        : '```$language\n$codeContext\n```\n';

    return TemplateEngineUtils.render(_hintTemplate, {
      'language': language,
      'topic': topic,
      'question': question,
      'code_context': codeContextSection,
    });
  }

  String buildExplanationPrompt({
    required String question,
    required String userAnswer,
    required String correctAnswer,
    required String? language,
    required String topic,
    String compilationError = '',
  }) {
    final languageName = language ?? 'programming';
    final compilationErrorSection =
        compilationError.isEmpty ? '' : '$compilationError\n';

    return TemplateEngineUtils.render(_explanationTemplate, {
      'language': languageName,
      'topic': topic,
      'question': question,
      'user_answer': userAnswer,
      'correct_answer': correctAnswer,
      'compilation_error': compilationErrorSection,
    });
  }
}
