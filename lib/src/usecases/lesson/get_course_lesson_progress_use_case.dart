import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/lesson/lesson_service.dart';
import 'package:serverpod/serverpod.dart';

class GetCourseLessonProgressUseCase {
  final LessonService _lessonService;

  GetCourseLessonProgressUseCase({required LessonService lessonService})
    : _lessonService = lessonService;

  Future<List<LessonProgressDto>> execute(
    Session session, {
    required UuidValue authUserId,
    required int courseId,
  }) async {
    final progress = await _lessonService.getProgressByCourseId(
      session,
      authUserId: authUserId,
      courseId: courseId,
    );
    return progress
        .map(
          (item) => LessonProgressDto(
            id: item.id!,
            lessonId: item.lessonId,
            isCompleted: item.isCompleted,
            completedAt: item.completedAt,
            timeSpentSeconds: item.timeSpentSeconds,
          ),
        )
        .toList();
  }
}
