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

abstract class Lesson implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Lesson._({
    this.id,
    required this.moduleId,
    required this.title,
    required this.contentText,
    this.videoUrl,
    this.imageUrls,
    required this.orderIndex,
    required this.durationMinutes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lesson({
    int? id,
    required int moduleId,
    required String title,
    required String contentText,
    String? videoUrl,
    String? imageUrls,
    required int orderIndex,
    required int durationMinutes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _LessonImpl;

  factory Lesson.fromJson(Map<String, dynamic> jsonSerialization) {
    return Lesson(
      id: jsonSerialization['id'] as int?,
      moduleId: jsonSerialization['moduleId'] as int,
      title: jsonSerialization['title'] as String,
      contentText: jsonSerialization['contentText'] as String,
      videoUrl: jsonSerialization['videoUrl'] as String?,
      imageUrls: jsonSerialization['imageUrls'] as String?,
      orderIndex: jsonSerialization['orderIndex'] as int,
      durationMinutes: jsonSerialization['durationMinutes'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = LessonTable();

  static const db = LessonRepository._();

  @override
  int? id;

  int moduleId;

  String title;

  String contentText;

  String? videoUrl;

  String? imageUrls;

  int orderIndex;

  int durationMinutes;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Lesson]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Lesson copyWith({
    int? id,
    int? moduleId,
    String? title,
    String? contentText,
    String? videoUrl,
    String? imageUrls,
    int? orderIndex,
    int? durationMinutes,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Lesson',
      if (id != null) 'id': id,
      'moduleId': moduleId,
      'title': title,
      'contentText': contentText,
      if (videoUrl != null) 'videoUrl': videoUrl,
      if (imageUrls != null) 'imageUrls': imageUrls,
      'orderIndex': orderIndex,
      'durationMinutes': durationMinutes,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static LessonInclude include() {
    return LessonInclude._();
  }

  static LessonIncludeList includeList({
    _i1.WhereExpressionBuilder<LessonTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LessonTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LessonTable>? orderByList,
    LessonInclude? include,
  }) {
    return LessonIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Lesson.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Lesson.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LessonImpl extends Lesson {
  _LessonImpl({
    int? id,
    required int moduleId,
    required String title,
    required String contentText,
    String? videoUrl,
    String? imageUrls,
    required int orderIndex,
    required int durationMinutes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         moduleId: moduleId,
         title: title,
         contentText: contentText,
         videoUrl: videoUrl,
         imageUrls: imageUrls,
         orderIndex: orderIndex,
         durationMinutes: durationMinutes,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Lesson]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Lesson copyWith({
    Object? id = _Undefined,
    int? moduleId,
    String? title,
    String? contentText,
    Object? videoUrl = _Undefined,
    Object? imageUrls = _Undefined,
    int? orderIndex,
    int? durationMinutes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Lesson(
      id: id is int? ? id : this.id,
      moduleId: moduleId ?? this.moduleId,
      title: title ?? this.title,
      contentText: contentText ?? this.contentText,
      videoUrl: videoUrl is String? ? videoUrl : this.videoUrl,
      imageUrls: imageUrls is String? ? imageUrls : this.imageUrls,
      orderIndex: orderIndex ?? this.orderIndex,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class LessonUpdateTable extends _i1.UpdateTable<LessonTable> {
  LessonUpdateTable(super.table);

  _i1.ColumnValue<int, int> moduleId(int value) => _i1.ColumnValue(
    table.moduleId,
    value,
  );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> contentText(String value) => _i1.ColumnValue(
    table.contentText,
    value,
  );

  _i1.ColumnValue<String, String> videoUrl(String? value) => _i1.ColumnValue(
    table.videoUrl,
    value,
  );

  _i1.ColumnValue<String, String> imageUrls(String? value) => _i1.ColumnValue(
    table.imageUrls,
    value,
  );

  _i1.ColumnValue<int, int> orderIndex(int value) => _i1.ColumnValue(
    table.orderIndex,
    value,
  );

  _i1.ColumnValue<int, int> durationMinutes(int value) => _i1.ColumnValue(
    table.durationMinutes,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class LessonTable extends _i1.Table<int?> {
  LessonTable({super.tableRelation}) : super(tableName: 'lesson') {
    updateTable = LessonUpdateTable(this);
    moduleId = _i1.ColumnInt(
      'moduleId',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    contentText = _i1.ColumnString(
      'contentText',
      this,
    );
    videoUrl = _i1.ColumnString(
      'videoUrl',
      this,
    );
    imageUrls = _i1.ColumnString(
      'imageUrls',
      this,
    );
    orderIndex = _i1.ColumnInt(
      'orderIndex',
      this,
    );
    durationMinutes = _i1.ColumnInt(
      'durationMinutes',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final LessonUpdateTable updateTable;

  late final _i1.ColumnInt moduleId;

  late final _i1.ColumnString title;

  late final _i1.ColumnString contentText;

  late final _i1.ColumnString videoUrl;

  late final _i1.ColumnString imageUrls;

  late final _i1.ColumnInt orderIndex;

  late final _i1.ColumnInt durationMinutes;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    moduleId,
    title,
    contentText,
    videoUrl,
    imageUrls,
    orderIndex,
    durationMinutes,
    createdAt,
    updatedAt,
  ];
}

class LessonInclude extends _i1.IncludeObject {
  LessonInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Lesson.t;
}

class LessonIncludeList extends _i1.IncludeList {
  LessonIncludeList._({
    _i1.WhereExpressionBuilder<LessonTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Lesson.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Lesson.t;
}

class LessonRepository {
  const LessonRepository._();

  /// Returns a list of [Lesson]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Lesson>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LessonTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LessonTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LessonTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Lesson>(
      where: where?.call(Lesson.t),
      orderBy: orderBy?.call(Lesson.t),
      orderByList: orderByList?.call(Lesson.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Lesson] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Lesson?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LessonTable>? where,
    int? offset,
    _i1.OrderByBuilder<LessonTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LessonTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Lesson>(
      where: where?.call(Lesson.t),
      orderBy: orderBy?.call(Lesson.t),
      orderByList: orderByList?.call(Lesson.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Lesson] by its [id] or null if no such row exists.
  Future<Lesson?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Lesson>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Lesson]s in the list and returns the inserted rows.
  ///
  /// The returned [Lesson]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Lesson>> insert(
    _i1.Session session,
    List<Lesson> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Lesson>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Lesson] and returns the inserted row.
  ///
  /// The returned [Lesson] will have its `id` field set.
  Future<Lesson> insertRow(
    _i1.Session session,
    Lesson row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Lesson>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Lesson]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Lesson>> update(
    _i1.Session session,
    List<Lesson> rows, {
    _i1.ColumnSelections<LessonTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Lesson>(
      rows,
      columns: columns?.call(Lesson.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Lesson]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Lesson> updateRow(
    _i1.Session session,
    Lesson row, {
    _i1.ColumnSelections<LessonTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Lesson>(
      row,
      columns: columns?.call(Lesson.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Lesson] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Lesson?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<LessonUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Lesson>(
      id,
      columnValues: columnValues(Lesson.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Lesson]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Lesson>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<LessonUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<LessonTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LessonTable>? orderBy,
    _i1.OrderByListBuilder<LessonTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Lesson>(
      columnValues: columnValues(Lesson.t.updateTable),
      where: where(Lesson.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Lesson.t),
      orderByList: orderByList?.call(Lesson.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Lesson]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Lesson>> delete(
    _i1.Session session,
    List<Lesson> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Lesson>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Lesson].
  Future<Lesson> deleteRow(
    _i1.Session session,
    Lesson row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Lesson>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Lesson>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LessonTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Lesson>(
      where: where(Lesson.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LessonTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Lesson>(
      where: where?.call(Lesson.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
