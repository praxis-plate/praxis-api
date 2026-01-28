import 'package:praxis_server/src/shared/utils/asset_loader.dart';

class PromptTemplateLoader {
  static const String _hintTemplatePath = 'assets/prompts/task_hint_prompt.txt';
  static const String _explanationTemplatePath =
      'assets/prompts/task_explanation_prompt.txt';
  static String? _cachedHintTemplate;
  static String? _cachedExplanationTemplate;

  String loadHintTemplate() {
    return _cachedHintTemplate ??= AssetLoader.loadAsset(_hintTemplatePath);
  }

  String loadExplanationTemplate() {
    return _cachedExplanationTemplate ??= AssetLoader.loadAsset(
      _explanationTemplatePath,
    );
  }
}
