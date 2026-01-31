class TemplateEngineUtils {
  static String render(String template, Map<String, String> variables) {
    String result = template;
    for (final entry in variables.entries) {
      result = result.replaceAll('{${entry.key}}', entry.value);
    }
    return result;
  }
}
