import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/lesson/lesson_service.dart';
import 'package:serverpod/serverpod.dart';

class GetLessonsByCourseIdUseCase {
  final LessonService _lessonService;

  GetLessonsByCourseIdUseCase({required LessonService lessonService})
    : _lessonService = lessonService;

  Future<List<LessonDto>> execute(Session session, int courseId) {
    return _lessonService.getByCourseId(session, courseId);
  }
}
