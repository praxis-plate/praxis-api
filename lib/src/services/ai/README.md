# AI Service

This module provides AI-powered hint and explanation generation using Google's Gemini API.

## Architecture

The AI service follows SOLID principles and is divided into several focused classes:

### Core Classes

- **`AiService`** - Main service orchestrating AI operations
- **`GeminiApiClient`** - HTTP client for Gemini API communication
- **`PromptBuilder`** - Builds prompts from templates and data

### Supporting Classes

- **`TemplateEngineUtils`** (in shared/utils) - Simple template variable substitution
- **`AssetLoader`** (in shared/utils) - Generic asset file loader
- **`GeminiModel`** (in shared/constants) - Supported Gemini models
- **`PromptTemplateLoader`** (in services/ai) - Loads prompt templates from assets
- **`ProgrammingLanguage`** (in shared/constants) - Supported programming languages enum with `byName` access

## Usage

The service is exposed through Serverpod endpoints:

```dart
// Generate hint
final hintRequest = GenerateHintRequest(
  question: 'What is a variable?',
  codeContext: 'int x = 5;',
  language: 'Dart',
  topic: 'Variables',
);
final hintResponse = await aiEndpoint.generateHint(session, hintRequest);

// Generate explanation
final explanationRequest = GenerateExplanationRequest(
  question: 'What is a variable?',
  userAnswer: 'A number',
  correctAnswer: 'A container for storing data',
  language: 'Dart',
  topic: 'Variables',
);
final explanationResponse = await aiEndpoint.generateExplanation(session, explanationRequest);
```

## Configuration

1. Set the Gemini API key in `config/passwords.yaml`:
   ```yaml
   development:
     geminiApiKey: 'your-api-key-here'
   ```

2. Customize prompt templates in `assets/prompts/`:
   - `task_hint_prompt.txt` - Template for hint generation
   - `task_explanation_prompt.txt` - Template for explanation generation
   
   Template paths are defined in `PromptTemplateLoader` for easy maintenance.

## Error Handling

The service returns `AiResponse` objects with:
- `success: bool` - Whether the operation succeeded
- `content: String` - Generated content (empty on failure)
- `error: String?` - Error message if operation failed

## Testing

Tests are located in `test/services/ai/` and `test/shared/` and cover:
- Service integration tests
- Individual component unit tests
- Template rendering and asset loading
- Programming language enum functionality
