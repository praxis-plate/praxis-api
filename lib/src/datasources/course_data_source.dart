import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CourseDataSource {
  const CourseDataSource();

  Future<List<Course>> list(
    Session session, {
    int? limit,
    int? offset,
  }) {
    return Course.db.find(
      session,
      orderBy: (t) => t.rating,
      orderDescending: true,
      limit: limit,
      offset: offset,
    );
  }

  Future<Course?> findById(Session session, int id) {
    return Course.db.findById(session, id);
  }

  Future<Course> insert(
    Session session, {
    required String title,
    required String description,
    required String author,
    required String category,
    required int priceInCoins,
    required int durationMinutes,
    required double rating,
    String? thumbnailUrl,
    String? coverImage,
    required DateTime createdAt,
    Transaction? transaction,
  }) {
    final row = Course(
      title: title,
      description: description,
      author: author,
      category: category,
      priceInCoins: priceInCoins,
      durationMinutes: durationMinutes,
      rating: rating,
      thumbnailUrl: thumbnailUrl,
      coverImage: coverImage,
      createdAt: createdAt,
    );

    return Course.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<bool> hasAny(Session session) async {
    final existing = await Course.db.findFirstRow(session);
    return existing != null;
  }
}
