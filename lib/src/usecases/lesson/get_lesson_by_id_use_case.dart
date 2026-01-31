import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/lesson/lesson_service.dart';
import 'package:serverpod/serverpod.dart';

class GetLessonByIdUseCase {
  final LessonService _lessonService;

  GetLessonByIdUseCase({required LessonService lessonService})
    : _lessonService = lessonService;

  Future<LessonDto> execute(Session session, int lessonId) {
    return _lessonService.getById(session, lessonId);
  }
}
