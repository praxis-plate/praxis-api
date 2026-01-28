import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/lesson/lesson_service.dart';
import 'package:serverpod/serverpod.dart';

class GetLessonsByModuleIdUseCase {
  final LessonService _lessonService;

  GetLessonsByModuleIdUseCase({required LessonService lessonService})
    : _lessonService = lessonService;

  Future<List<LessonDto>> execute(Session session, int moduleId) {
    return _lessonService.getByModuleId(session, moduleId);
  }
}
