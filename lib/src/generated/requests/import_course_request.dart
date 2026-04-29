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
import '../dto/course_import_module_dto.dart' as _i2;
import 'package:praxis_server/src/generated/protocol.dart' as _i3;

abstract class ImportCourseRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ImportCourseRequest._({
    required this.title,
    required this.description,
    required this.category,
    this.priceInCoins,
    this.thumbnailUrl,
    this.coverImage,
    required this.modules,
  });

  factory ImportCourseRequest({
    required String title,
    required String description,
    required String category,
    int? priceInCoins,
    String? thumbnailUrl,
    String? coverImage,
    required List<_i2.CourseImportModuleDto> modules,
  }) = _ImportCourseRequestImpl;

  factory ImportCourseRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return ImportCourseRequest(
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      priceInCoins: jsonSerialization['priceInCoins'] as int?,
      thumbnailUrl: jsonSerialization['thumbnailUrl'] as String?,
      coverImage: jsonSerialization['coverImage'] as String?,
      modules: _i3.Protocol().deserialize<List<_i2.CourseImportModuleDto>>(
        jsonSerialization['modules'],
      ),
    );
  }

  String title;

  String description;

  String category;

  int? priceInCoins;

  String? thumbnailUrl;

  String? coverImage;

  List<_i2.CourseImportModuleDto> modules;

  /// Returns a shallow copy of this [ImportCourseRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ImportCourseRequest copyWith({
    String? title,
    String? description,
    String? category,
    int? priceInCoins,
    String? thumbnailUrl,
    String? coverImage,
    List<_i2.CourseImportModuleDto>? modules,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ImportCourseRequest',
      'title': title,
      'description': description,
      'category': category,
      if (priceInCoins != null) 'priceInCoins': priceInCoins,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      if (coverImage != null) 'coverImage': coverImage,
      'modules': modules.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ImportCourseRequest',
      'title': title,
      'description': description,
      'category': category,
      if (priceInCoins != null) 'priceInCoins': priceInCoins,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      if (coverImage != null) 'coverImage': coverImage,
      'modules': modules.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ImportCourseRequestImpl extends ImportCourseRequest {
  _ImportCourseRequestImpl({
    required String title,
    required String description,
    required String category,
    int? priceInCoins,
    String? thumbnailUrl,
    String? coverImage,
    required List<_i2.CourseImportModuleDto> modules,
  }) : super._(
         title: title,
         description: description,
         category: category,
         priceInCoins: priceInCoins,
         thumbnailUrl: thumbnailUrl,
         coverImage: coverImage,
         modules: modules,
       );

  /// Returns a shallow copy of this [ImportCourseRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ImportCourseRequest copyWith({
    String? title,
    String? description,
    String? category,
    Object? priceInCoins = _Undefined,
    Object? thumbnailUrl = _Undefined,
    Object? coverImage = _Undefined,
    List<_i2.CourseImportModuleDto>? modules,
  }) {
    return ImportCourseRequest(
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      priceInCoins: priceInCoins is int? ? priceInCoins : this.priceInCoins,
      thumbnailUrl: thumbnailUrl is String? ? thumbnailUrl : this.thumbnailUrl,
      coverImage: coverImage is String? ? coverImage : this.coverImage,
      modules: modules ?? this.modules.map((e0) => e0.copyWith()).toList(),
    );
  }
}
