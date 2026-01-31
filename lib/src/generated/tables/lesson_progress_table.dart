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

abstract class LessonProgress
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  LessonProgress._({
    this.id,
    required this.authUserId,
    required this.lessonId,
    required this.isCompleted,
    this.completedAt,
    required this.timeSpentSeconds,
  });

  factory LessonProgress({
    int? id,
    required _i1.UuidValue authUserId,
    required int lessonId,
    required bool isCompleted,
    DateTime? completedAt,
    required int timeSpentSeconds,
  }) = _LessonProgressImpl;

  factory LessonProgress.fromJson(Map<String, dynamic> jsonSerialization) {
    return LessonProgress(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      lessonId: jsonSerialization['lessonId'] as int,
      isCompleted: jsonSerialization['isCompleted'] as bool,
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      timeSpentSeconds: jsonSerialization['timeSpentSeconds'] as int,
    );
  }

  static final t = LessonProgressTable();

  static const db = LessonProgressRepository._();

  @override
  int? id;

  _i1.UuidValue authUserId;

  int lessonId;

  bool isCompleted;

  DateTime? completedAt;

  int timeSpentSeconds;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [LessonProgress]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LessonProgress copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    int? lessonId,
    bool? isCompleted,
    DateTime? completedAt,
    int? timeSpentSeconds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LessonProgress',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'lessonId': lessonId,
      'isCompleted': isCompleted,
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      'timeSpentSeconds': timeSpentSeconds,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static LessonProgressInclude include() {
    return LessonProgressInclude._();
  }

  static LessonProgressIncludeList includeList({
    _i1.WhereExpressionBuilder<LessonProgressTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LessonProgressTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LessonProgressTable>? orderByList,
    LessonProgressInclude? include,
  }) {
    return LessonProgressIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LessonProgress.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LessonProgress.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LessonProgressImpl extends LessonProgress {
  _LessonProgressImpl({
    int? id,
    required _i1.UuidValue authUserId,
    required int lessonId,
    required bool isCompleted,
    DateTime? completedAt,
    required int timeSpentSeconds,
  }) : super._(
         id: id,
         authUserId: authUserId,
         lessonId: lessonId,
         isCompleted: isCompleted,
         completedAt: completedAt,
         timeSpentSeconds: timeSpentSeconds,
       );

  /// Returns a shallow copy of this [LessonProgress]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LessonProgress copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    int? lessonId,
    bool? isCompleted,
    Object? completedAt = _Undefined,
    int? timeSpentSeconds,
  }) {
    return LessonProgress(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      lessonId: lessonId ?? this.lessonId,
      isCompleted: isCompleted ?? this.isCompleted,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      timeSpentSeconds: timeSpentSeconds ?? this.timeSpentSeconds,
    );
  }
}

class LessonProgressUpdateTable extends _i1.UpdateTable<LessonProgressTable> {
  LessonProgressUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<int, int> lessonId(int value) => _i1.ColumnValue(
    table.lessonId,
    value,
  );

  _i1.ColumnValue<bool, bool> isCompleted(bool value) => _i1.ColumnValue(
    table.isCompleted,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> completedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.completedAt,
        value,
      );

  _i1.ColumnValue<int, int> timeSpentSeconds(int value) => _i1.ColumnValue(
    table.timeSpentSeconds,
    value,
  );
}

class LessonProgressTable extends _i1.Table<int?> {
  LessonProgressTable({super.tableRelation})
    : super(tableName: 'lesson_progress') {
    updateTable = LessonProgressUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    lessonId = _i1.ColumnInt(
      'lessonId',
      this,
    );
    isCompleted = _i1.ColumnBool(
      'isCompleted',
      this,
    );
    completedAt = _i1.ColumnDateTime(
      'completedAt',
      this,
    );
    timeSpentSeconds = _i1.ColumnInt(
      'timeSpentSeconds',
      this,
    );
  }

  late final LessonProgressUpdateTable updateTable;

  late final _i1.ColumnUuid authUserId;

  late final _i1.ColumnInt lessonId;

  late final _i1.ColumnBool isCompleted;

  late final _i1.ColumnDateTime completedAt;

  late final _i1.ColumnInt timeSpentSeconds;

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    lessonId,
    isCompleted,
    completedAt,
    timeSpentSeconds,
  ];
}

class LessonProgressInclude extends _i1.IncludeObject {
  LessonProgressInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => LessonProgress.t;
}

class LessonProgressIncludeList extends _i1.IncludeList {
  LessonProgressIncludeList._({
    _i1.WhereExpressionBuilder<LessonProgressTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LessonProgress.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => LessonProgress.t;
}

class LessonProgressRepository {
  const LessonProgressRepository._();

  /// Returns a list of [LessonProgress]s matching the given query parameters.
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
  Future<List<LessonProgress>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LessonProgressTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LessonProgressTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LessonProgressTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<LessonProgress>(
      where: where?.call(LessonProgress.t),
      orderBy: orderBy?.call(LessonProgress.t),
      orderByList: orderByList?.call(LessonProgress.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [LessonProgress] matching the given query parameters.
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
  Future<LessonProgress?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LessonProgressTable>? where,
    int? offset,
    _i1.OrderByBuilder<LessonProgressTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LessonProgressTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<LessonProgress>(
      where: where?.call(LessonProgress.t),
      orderBy: orderBy?.call(LessonProgress.t),
      orderByList: orderByList?.call(LessonProgress.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [LessonProgress] by its [id] or null if no such row exists.
  Future<LessonProgress?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<LessonProgress>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [LessonProgress]s in the list and returns the inserted rows.
  ///
  /// The returned [LessonProgress]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<LessonProgress>> insert(
    _i1.Session session,
    List<LessonProgress> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<LessonProgress>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [LessonProgress] and returns the inserted row.
  ///
  /// The returned [LessonProgress] will have its `id` field set.
  Future<LessonProgress> insertRow(
    _i1.Session session,
    LessonProgress row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LessonProgress>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [LessonProgress]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<LessonProgress>> update(
    _i1.Session session,
    List<LessonProgress> rows, {
    _i1.ColumnSelections<LessonProgressTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LessonProgress>(
      rows,
      columns: columns?.call(LessonProgress.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LessonProgress]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LessonProgress> updateRow(
    _i1.Session session,
    LessonProgress row, {
    _i1.ColumnSelections<LessonProgressTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LessonProgress>(
      row,
      columns: columns?.call(LessonProgress.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LessonProgress] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<LessonProgress?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<LessonProgressUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<LessonProgress>(
      id,
      columnValues: columnValues(LessonProgress.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [LessonProgress]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<LessonProgress>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<LessonProgressUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<LessonProgressTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LessonProgressTable>? orderBy,
    _i1.OrderByListBuilder<LessonProgressTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<LessonProgress>(
      columnValues: columnValues(LessonProgress.t.updateTable),
      where: where(LessonProgress.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LessonProgress.t),
      orderByList: orderByList?.call(LessonProgress.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [LessonProgress]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<LessonProgress>> delete(
    _i1.Session session,
    List<LessonProgress> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LessonProgress>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [LessonProgress].
  Future<LessonProgress> deleteRow(
    _i1.Session session,
    LessonProgress row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LessonProgress>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<LessonProgress>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LessonProgressTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LessonProgress>(
      where: where(LessonProgress.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LessonProgressTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LessonProgress>(
      where: where?.call(LessonProgress.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
