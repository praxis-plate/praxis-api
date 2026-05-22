import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/adaptive_learning/adaptive_learning_path_service.dart';
import 'package:serverpod/serverpod.dart';

class GetAdaptiveLearningPathUseCase {
  final AdaptiveLearningPathService _adaptiveLearningPathService;

  const GetAdaptiveLearningPathUseCase({
    required AdaptiveLearningPathService adaptiveLearningPathService,
  }) : _adaptiveLearningPathService = adaptiveLearningPathService;

  Future<AdaptiveLearningPathDto> execute(
    Session session, {
    required UuidValue authUserId,
    required int courseId,
  }) {
    return _adaptiveLearningPathService.getPath(
      session,
      authUserId: authUserId,
      courseId: courseId,
    );
  }
}
