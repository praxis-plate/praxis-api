import 'package:praxis_server/src/shared/utils/asset_loader.dart';

class PromptTemplateLoader {
  static const String _hintTemplatePath = 'assets/prompts/task_hint_prompt.txt';
  static const String _explanationTemplatePath =
      'assets/prompts/task_explanation_prompt.txt';

  String loadHintTemplate() {
    return AssetLoader.loadAsset(_hintTemplatePath);
  }

  String loadExplanationTemplate() {
    return AssetLoader.loadAsset(_explanationTemplatePath);
  }
}
