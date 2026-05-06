import 'package:praxis_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CourseCacheService {
  final _courseListCache = <String, _CacheEntry<List<CourseDto>>>{};
  final _courseDetailCache = <int, _CacheEntry<CourseDetailDto>>{};
  final _courseStructureCache = <int, _CacheEntry<CourseStructureDto>>{};

  Future<List<CourseDto>?> getCourseList(
    Session session, {
    required int limit,
    required int offset,
  }) async {
    final key = '$limit:$offset';
    final entry = _courseListCache[key];
    if (entry == null) return null;
    if (entry.isExpired) {
      _courseListCache.remove(key);
      return null;
    }
    return entry.value;
  }

  Future<void> setCourseList(
    Session session, {
    required int limit,
    required int offset,
    required List<CourseDto> courses,
    Duration lifetime = const Duration(minutes: 5),
  }) async {
    final key = '$limit:$offset';
    _courseListCache[key] = _CacheEntry(courses, lifetime);
  }

  Future<CourseDetailDto?> getCourseDetail(
    Session session,
    int courseId,
  ) async {
    final entry = _courseDetailCache[courseId];
    if (entry == null) return null;
    if (entry.isExpired) {
      _courseDetailCache.remove(courseId);
      return null;
    }
    return entry.value;
  }

  Future<void> setCourseDetail(
    Session session,
    int courseId,
    CourseDetailDto detail, {
    Duration lifetime = const Duration(minutes: 10),
  }) async {
    _courseDetailCache[courseId] = _CacheEntry(detail, lifetime);
  }

  Future<CourseStructureDto?> getCourseStructure(
    Session session,
    int courseId,
  ) async {
    final entry = _courseStructureCache[courseId];
    if (entry == null) return null;
    if (entry.isExpired) {
      _courseStructureCache.remove(courseId);
      return null;
    }
    return entry.value;
  }

  Future<void> setCourseStructure(
    Session session,
    int courseId,
    CourseStructureDto structure, {
    Duration lifetime = const Duration(minutes: 10),
  }) async {
    _courseStructureCache[courseId] = _CacheEntry(structure, lifetime);
  }

  Future<void> invalidateCourse(Session session, int courseId) async {
    _courseDetailCache.remove(courseId);
    _courseStructureCache.remove(courseId);
  }

  void clearAll() {
    _courseListCache.clear();
    _courseDetailCache.clear();
    _courseStructureCache.clear();
  }
}

class _CacheEntry<T> {
  final T value;
  final DateTime expiresAt;

  _CacheEntry(this.value, Duration lifetime)
    : expiresAt = DateTime.now().add(lifetime);

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}
