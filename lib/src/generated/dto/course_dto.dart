/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../enums/content_status.dart' as _i2;

abstract class CourseDto
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CourseDto._({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.category,
    required this.difficultyLevel,
    required this.priceInCoins,
    required this.durationMinutes,
    required this.rating,
    this.thumbnailUrl,
    this.coverImage,
    required this.createdAt,
    required this.updatedAt,
    required this.contentStatus,
    this.publishedAt,
    required this.totalLessons,
    required this.totalTasks,
  });

  factory CourseDto({
    required int id,
    required String title,
    required String description,
    required String author,
    required String category,
    required String difficultyLevel,
    required int priceInCoins,
    required int durationMinutes,
    required double rating,
    String? thumbnailUrl,
    String? coverImage,
    required DateTime createdAt,
    required DateTime updatedAt,
    required _i2.ContentStatus contentStatus,
    DateTime? publishedAt,
    required int totalLessons,
    required int totalTasks,
  }) = _CourseDtoImpl;

  factory CourseDto.fromJson(Map<String, dynamic> jsonSerialization) {
    return CourseDto(
      id: jsonSerialization['id'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      author: jsonSerialization['author'] as String,
      category: jsonSerialization['category'] as String,
      difficultyLevel: jsonSerialization['difficultyLevel'] as String,
      priceInCoins: jsonSerialization['priceInCoins'] as int,
      durationMinutes: jsonSerialization['durationMinutes'] as int,
      rating: (jsonSerialization['rating'] as num).toDouble(),
      thumbnailUrl: jsonSerialization['thumbnailUrl'] as String?,
      coverImage: jsonSerialization['coverImage'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      contentStatus: _i2.ContentStatus.fromJson(
        (jsonSerialization['contentStatus'] as String),
      ),
      publishedAt: jsonSerialization['publishedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['publishedAt'],
            ),
      totalLessons: jsonSerialization['totalLessons'] as int,
      totalTasks: jsonSerialization['totalTasks'] as int,
    );
  }

  int id;

  String title;

  String description;

  String author;

  String category;

  String difficultyLevel;

  int priceInCoins;

  int durationMinutes;

  double rating;

  String? thumbnailUrl;

  String? coverImage;

  DateTime createdAt;

  DateTime updatedAt;

  _i2.ContentStatus contentStatus;

  DateTime? publishedAt;

  int totalLessons;

  int totalTasks;

  /// Returns a shallow copy of this [CourseDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseDto copyWith({
    int? id,
    String? title,
    String? description,
    String? author,
    String? category,
    String? difficultyLevel,
    int? priceInCoins,
    int? durationMinutes,
    double? rating,
    String? thumbnailUrl,
    String? coverImage,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.ContentStatus? contentStatus,
    DateTime? publishedAt,
    int? totalLessons,
    int? totalTasks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseDto',
      'id': id,
      'title': title,
      'description': description,
      'author': author,
      'category': category,
      'difficultyLevel': difficultyLevel,
      'priceInCoins': priceInCoins,
      'durationMinutes': durationMinutes,
      'rating': rating,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      if (coverImage != null) 'coverImage': coverImage,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'contentStatus': contentStatus.toJson(),
      if (publishedAt != null) 'publishedAt': publishedAt?.toJson(),
      'totalLessons': totalLessons,
      'totalTasks': totalTasks,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CourseDto',
      'id': id,
      'title': title,
      'description': description,
      'author': author,
      'category': category,
      'difficultyLevel': difficultyLevel,
      'priceInCoins': priceInCoins,
      'durationMinutes': durationMinutes,
      'rating': rating,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      if (coverImage != null) 'coverImage': coverImage,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'contentStatus': contentStatus.toJson(),
      if (publishedAt != null) 'publishedAt': publishedAt?.toJson(),
      'totalLessons': totalLessons,
      'totalTasks': totalTasks,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseDtoImpl extends CourseDto {
  _CourseDtoImpl({
    required int id,
    required String title,
    required String description,
    required String author,
    required String category,
    required String difficultyLevel,
    required int priceInCoins,
    required int durationMinutes,
    required double rating,
    String? thumbnailUrl,
    String? coverImage,
    required DateTime createdAt,
    required DateTime updatedAt,
    required _i2.ContentStatus contentStatus,
    DateTime? publishedAt,
    required int totalLessons,
    required int totalTasks,
  }) : super._(
         id: id,
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
         totalLessons: totalLessons,
         totalTasks: totalTasks,
       );

  /// Returns a shallow copy of this [CourseDto]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseDto copyWith({
    int? id,
    String? title,
    String? description,
    String? author,
    String? category,
    String? difficultyLevel,
    int? priceInCoins,
    int? durationMinutes,
    double? rating,
    Object? thumbnailUrl = _Undefined,
    Object? coverImage = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.ContentStatus? contentStatus,
    Object? publishedAt = _Undefined,
    int? totalLessons,
    int? totalTasks,
  }) {
    return CourseDto(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      author: author ?? this.author,
      category: category ?? this.category,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      priceInCoins: priceInCoins ?? this.priceInCoins,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      rating: rating ?? this.rating,
      thumbnailUrl: thumbnailUrl is String? ? thumbnailUrl : this.thumbnailUrl,
      coverImage: coverImage is String? ? coverImage : this.coverImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      contentStatus: contentStatus ?? this.contentStatus,
      publishedAt: publishedAt is DateTime? ? publishedAt : this.publishedAt,
      totalLessons: totalLessons ?? this.totalLessons,
      totalTasks: totalTasks ?? this.totalTasks,
    );
  }
}
