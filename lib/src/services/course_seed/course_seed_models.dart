class CourseSeed {
  final String title;
  final String description;
  final String author;
  final String category;
  final int priceInCoins;
  final int durationMinutes;
  final double rating;
  final String? thumbnailUrl;
  final String? coverImage;

  const CourseSeed({
    required this.title,
    required this.description,
    required this.author,
    required this.category,
    required this.priceInCoins,
    required this.durationMinutes,
    required this.rating,
    this.thumbnailUrl,
    this.coverImage,
  });
}

class ModuleSeed {
  final String title;
  final String description;
  final int orderIndex;

  const ModuleSeed({
    required this.title,
    required this.description,
    required this.orderIndex,
  });
}

class LessonSeed {
  final String title;
  final String contentText;
  final String? videoUrl;
  final String? imageUrls;
  final int orderIndex;
  final int durationMinutes;

  const LessonSeed({
    required this.title,
    required this.contentText,
    this.videoUrl,
    this.imageUrls,
    required this.orderIndex,
    required this.durationMinutes,
  });
}

class TaskSeed {
  final String taskType;
  final String questionText;
  final String correctAnswer;
  final List<String>? options;
  final String? codeTemplate;
  final String? testCasesJson;
  final String? programmingLanguage;
  final int difficultyLevel;
  final int xpValue;
  final int orderIndex;
  final String? fallbackHint;
  final String? fallbackExplanation;
  final String topic;

  const TaskSeed({
    required this.taskType,
    required this.questionText,
    required this.correctAnswer,
    this.options,
    this.codeTemplate,
    this.testCasesJson,
    this.programmingLanguage,
    required this.difficultyLevel,
    required this.xpValue,
    required this.orderIndex,
    this.fallbackHint,
    this.fallbackExplanation,
    required this.topic,
  });
}
