import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/shared/utils/lesson_content_document_codec.dart';

const _lessonContentDocumentCodec = LessonContentDocumentCodec();

extension CourseMapper on Course {
  CourseDto toCourseDto({
    required int totalLessons,
    required int totalTasks,
  }) {
    assert(id != null, 'Course id is not set');
    return CourseDto(
      id: id!,
      title: title,
      description: description,
      author: author,
      category: category,
      difficultyLevel: difficultyLevel,
      priceInCoins: priceInCoins,
      durationMinutes: durationMinutes,
      rating: rating,
      thumbnailUrl: thumbnailUrl,
      coverImage: coverImage,
      createdAt: createdAt,
      updatedAt: updatedAt,
      contentStatus: contentStatus,
      publishedAt: publishedAt,
      totalLessons: totalLessons,
      totalTasks: totalTasks,
    );
  }
}

extension ModuleMapper on Module {
  ModuleDto toModuleDto() {
    assert(id != null, 'Module id is not set');
    return ModuleDto(
      id: id!,
      courseId: courseId,
      title: title,
      description: description,
      orderIndex: orderIndex,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension LessonMapper on Lesson {
  LessonDto toLessonDto() {
    assert(id != null, 'Lesson id is not set');
    return LessonDto(
      id: id!,
      moduleId: moduleId,
      title: title,
      contentText: contentText,
      contentDocument: _lessonContentDocumentCodec.decodeFromStorage(
        contentText,
      ),
      videoUrl: videoUrl,
      imageUrls: imageUrls,
      orderIndex: orderIndex,
      durationMinutes: durationMinutes,
      completionXp: completionXp,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension TaskOptionMapper on TaskOption {
  TaskOptionDto toTaskOptionDto() {
    assert(id != null, 'TaskOption id is not set');
    return TaskOptionDto(
      id: id!,
      taskId: taskId,
      optionText: optionText,
      isCorrect: isCorrect,
      orderIndex: orderIndex,
    );
  }
}

extension TaskTestCaseMapper on TaskTestCase {
  TaskTestCaseDto toTaskTestCaseDto() {
    assert(id != null, 'TaskTestCase id is not set');
    return TaskTestCaseDto(
      id: id!,
      taskId: taskId,
      input: input,
      expectedOutput: expectedOutput,
      isHidden: isHidden,
      orderIndex: orderIndex,
    );
  }
}

extension TaskMapper on Task {
  TaskDto toTaskDto({
    required List<TaskOptionDto> options,
    required List<TaskTestCaseDto> testCases,
  }) {
    assert(id != null, 'Task id is not set');
    return TaskDto(
      id: id!,
      lessonId: lessonId,
      taskType: taskType,
      questionText: questionText,
      correctAnswer: correctAnswer,
      optionsJson: optionsJson,
      codeTemplate: codeTemplate,
      testCasesJson: testCasesJson,
      programmingLanguage: programmingLanguage,
      difficultyLevel: difficultyLevel,
      xpValue: xpValue,
      orderIndex: orderIndex,
      fallbackHint: fallbackHint,
      fallbackExplanation: fallbackExplanation,
      topic: topic,
      createdAt: createdAt,
      updatedAt: updatedAt,
      options: options,
      testCases: testCases,
    );
  }
}
