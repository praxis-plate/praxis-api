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

abstract class CourseReview
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CourseReview._({
    this.id,
    required this.authUserId,
    required this.courseId,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseReview({
    int? id,
    required _i1.UuidValue authUserId,
    required int courseId,
    required int rating,
    required String comment,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CourseReviewImpl;

  factory CourseReview.fromJson(Map<String, dynamic> jsonSerialization) {
    return CourseReview(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      courseId: jsonSerialization['courseId'] as int,
      rating: jsonSerialization['rating'] as int,
      comment: jsonSerialization['comment'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = CourseReviewTable();

  static const db = CourseReviewRepository._();

  @override
  int? id;

  _i1.UuidValue authUserId;

  int courseId;

  int rating;

  String comment;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CourseReview]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CourseReview copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    int? courseId,
    int? rating,
    String? comment,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CourseReview',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'courseId': courseId,
      'rating': rating,
      'comment': comment,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static CourseReviewInclude include() {
    return CourseReviewInclude._();
  }

  static CourseReviewIncludeList includeList({
    _i1.WhereExpressionBuilder<CourseReviewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CourseReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CourseReviewTable>? orderByList,
    CourseReviewInclude? include,
  }) {
    return CourseReviewIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CourseReview.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CourseReview.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CourseReviewImpl extends CourseReview {
  _CourseReviewImpl({
    int? id,
    required _i1.UuidValue authUserId,
    required int courseId,
    required int rating,
    required String comment,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         courseId: courseId,
         rating: rating,
         comment: comment,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [CourseReview]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CourseReview copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    int? courseId,
    int? rating,
    String? comment,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CourseReview(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      courseId: courseId ?? this.courseId,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class CourseReviewUpdateTable extends _i1.UpdateTable<CourseReviewTable> {
  CourseReviewUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<int, int> courseId(int value) => _i1.ColumnValue(
    table.courseId,
    value,
  );

  _i1.ColumnValue<int, int> rating(int value) => _i1.ColumnValue(
    table.rating,
    value,
  );

  _i1.ColumnValue<String, String> comment(String value) => _i1.ColumnValue(
    table.comment,
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

class CourseReviewTable extends _i1.Table<int?> {
  CourseReviewTable({super.tableRelation}) : super(tableName: 'course_review') {
    updateTable = CourseReviewUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    courseId = _i1.ColumnInt(
      'courseId',
      this,
    );
    rating = _i1.ColumnInt(
      'rating',
      this,
    );
    comment = _i1.ColumnString(
      'comment',
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

  late final CourseReviewUpdateTable updateTable;

  late final _i1.ColumnUuid authUserId;

  late final _i1.ColumnInt courseId;

  late final _i1.ColumnInt rating;

  late final _i1.ColumnString comment;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    courseId,
    rating,
    comment,
    createdAt,
    updatedAt,
  ];
}

class CourseReviewInclude extends _i1.IncludeObject {
  CourseReviewInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CourseReview.t;
}

class CourseReviewIncludeList extends _i1.IncludeList {
  CourseReviewIncludeList._({
    _i1.WhereExpressionBuilder<CourseReviewTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CourseReview.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CourseReview.t;
}

class CourseReviewRepository {
  const CourseReviewRepository._();

  /// Returns a list of [CourseReview]s matching the given query parameters.
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
  Future<List<CourseReview>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CourseReviewTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CourseReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CourseReviewTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CourseReview>(
      where: where?.call(CourseReview.t),
      orderBy: orderBy?.call(CourseReview.t),
      orderByList: orderByList?.call(CourseReview.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CourseReview] matching the given query parameters.
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
  Future<CourseReview?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CourseReviewTable>? where,
    int? offset,
    _i1.OrderByBuilder<CourseReviewTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CourseReviewTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CourseReview>(
      where: where?.call(CourseReview.t),
      orderBy: orderBy?.call(CourseReview.t),
      orderByList: orderByList?.call(CourseReview.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CourseReview] by its [id] or null if no such row exists.
  Future<CourseReview?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CourseReview>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CourseReview]s in the list and returns the inserted rows.
  ///
  /// The returned [CourseReview]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CourseReview>> insert(
    _i1.Session session,
    List<CourseReview> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CourseReview>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CourseReview] and returns the inserted row.
  ///
  /// The returned [CourseReview] will have its `id` field set.
  Future<CourseReview> insertRow(
    _i1.Session session,
    CourseReview row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CourseReview>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CourseReview]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CourseReview>> update(
    _i1.Session session,
    List<CourseReview> rows, {
    _i1.ColumnSelections<CourseReviewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CourseReview>(
      rows,
      columns: columns?.call(CourseReview.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CourseReview]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CourseReview> updateRow(
    _i1.Session session,
    CourseReview row, {
    _i1.ColumnSelections<CourseReviewTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CourseReview>(
      row,
      columns: columns?.call(CourseReview.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CourseReview] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CourseReview?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<CourseReviewUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CourseReview>(
      id,
      columnValues: columnValues(CourseReview.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CourseReview]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CourseReview>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CourseReviewUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CourseReviewTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CourseReviewTable>? orderBy,
    _i1.OrderByListBuilder<CourseReviewTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CourseReview>(
      columnValues: columnValues(CourseReview.t.updateTable),
      where: where(CourseReview.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CourseReview.t),
      orderByList: orderByList?.call(CourseReview.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CourseReview]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CourseReview>> delete(
    _i1.Session session,
    List<CourseReview> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CourseReview>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CourseReview].
  Future<CourseReview> deleteRow(
    _i1.Session session,
    CourseReview row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CourseReview>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CourseReview>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CourseReviewTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CourseReview>(
      where: where(CourseReview.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CourseReviewTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CourseReview>(
      where: where?.call(CourseReview.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
