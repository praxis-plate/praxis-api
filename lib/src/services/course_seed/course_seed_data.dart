import 'package:praxis_server/src/services/course_seed/course_seed_models.dart';

class CourseSeedData {
  static CourseSeed programmingFundamentals() {
    return const CourseSeed(
      title: 'Programming Fundamentals',
      description:
          'Master the core concepts of programming including variables, functions, loops, conditionals, and object-oriented programming. Perfect for beginners starting their coding journey.',
      author: 'Codium Team',
      category: 'Fundamentals',
      priceInCoins: 0,
      durationMinutes: 480,
      rating: 4.8,
      thumbnailUrl: null,
      coverImage: null,
    );
  }
}
