import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/recommendation/course_recommendation_service.dart';
import 'package:serverpod/serverpod.dart';

class GetPersonalizedRecommendationsUseCase {
  final CourseRecommendationService _courseRecommendationService;

  const GetPersonalizedRecommendationsUseCase({
    required CourseRecommendationService courseRecommendationService,
  }) : _courseRecommendationService = courseRecommendationService;

  Future<List<CourseRecommendationDto>> execute(
    Session session, {
    required UuidValue authUserId,
    int limit = 5,
  }) {
    return _courseRecommendationService.getRecommendations(
      session,
      authUserId: authUserId,
      limit: limit,
    );
  }
}
