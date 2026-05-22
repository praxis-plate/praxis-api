import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CourseDataSource {
  const CourseDataSource();

  Future<List<Course>> listPublished(
    Session session, {
    int? limit,
    int? offset,
    Transaction? transaction,
  }) {
    return Course.db.find(
      session,
      where: (t) => t.contentStatus.equals(ContentStatus.published),
      orderBy: (t) => t.rating,
      orderDescending: true,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<List<Course>> listForCms(
    Session session, {
    ContentStatus? status,
    String? query,
    int? limit,
    int? offset,
    Transaction? transaction,
  }) {
    return Course.db.find(
      session,
      where: (t) {
        Expression<dynamic> expression = Constant.bool(true);

        if (status != null) {
          expression &= t.contentStatus.equals(status);
        }
        if (query != null && query.trim().isNotEmpty) {
          expression &= t.title.ilike('%${query.trim()}%');
        }

        return expression;
      },
      orderBy: (t) => t.updatedAt,
      orderDescending: true,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Course?> findById(
    Session session,
    int id, {
    Transaction? transaction,
  }) {
    return Course.db.findById(session, id, transaction: transaction);
  }

  Future<Course?> findPublishedById(
    Session session,
    int id, {
    Transaction? transaction,
  }) {
    return Course.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(id) & t.contentStatus.equals(ContentStatus.published),
      transaction: transaction,
    );
  }

  Future<List<Course>> listByIds(
    Session session,
    List<int> courseIds, {
    Transaction? transaction,
  }) {
    if (courseIds.isEmpty) {
      return Future.value([]);
    }
    return Course.db.find(
      session,
      where: (t) => t.id.inSet(courseIds.toSet()),
      transaction: transaction,
    );
  }

  Future<List<Course>> listPublishedByIds(
    Session session,
    List<int> courseIds, {
    Transaction? transaction,
  }) {
    if (courseIds.isEmpty) {
      return Future.value([]);
    }

    return Course.db.find(
      session,
      where: (t) =>
          t.id.inSet(courseIds.toSet()) &
          t.contentStatus.equals(ContentStatus.published),
      transaction: transaction,
    );
  }

  Future<Course> insert(
    Session session, {
    required String title,
    required String description,
    required String author,
    required String category,
    String difficultyLevel = 'beginner',
    required int priceInCoins,
    required int durationMinutes,
    required double rating,
    String? thumbnailUrl,
    String? coverImage,
    required DateTime createdAt,
    required DateTime updatedAt,
    required ContentStatus contentStatus,
    DateTime? publishedAt,
    Transaction? transaction,
  }) {
    final row = Course(
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
    );

    return Course.db.insertRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<Course> updateRow(
    Session session,
    Course row, {
    Transaction? transaction,
  }) {
    return Course.db.updateRow(
      session,
      row,
      transaction: transaction,
    );
  }

  Future<void> deleteById(
    Session session,
    int courseId, {
    Transaction? transaction,
  }) async {
    await Course.db.deleteWhere(
      session,
      where: (t) => t.id.equals(courseId),
      transaction: transaction,
    );
  }

  Future<List<Course>> listByTitlePrefix(
    Session session,
    String prefix, {
    Transaction? transaction,
  }) {
    return Course.db.find(
      session,
      where: (t) => t.title.ilike('${prefix.trim()}%'),
      orderBy: (t) => t.title,
      transaction: transaction,
    );
  }

  Future<bool> hasAny(Session session, {Transaction? transaction}) async {
    final existing = await Course.db.findFirstRow(
      session,
      transaction: transaction,
    );
    return existing != null;
  }
}
