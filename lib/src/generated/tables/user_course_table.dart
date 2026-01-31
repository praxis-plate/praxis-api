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

abstract class UserCourse
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserCourse._({
    this.id,
    required this.authUserId,
    required this.courseId,
    required this.enrolledAt,
    required this.isCompleted,
    this.completedAt,
  });

  factory UserCourse({
    int? id,
    required _i1.UuidValue authUserId,
    required int courseId,
    required DateTime enrolledAt,
    required bool isCompleted,
    DateTime? completedAt,
  }) = _UserCourseImpl;

  factory UserCourse.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserCourse(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      courseId: jsonSerialization['courseId'] as int,
      enrolledAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['enrolledAt'],
      ),
      isCompleted: jsonSerialization['isCompleted'] as bool,
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
    );
  }

  static final t = UserCourseTable();

  static const db = UserCourseRepository._();

  @override
  int? id;

  _i1.UuidValue authUserId;

  int courseId;

  DateTime enrolledAt;

  bool isCompleted;

  DateTime? completedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserCourse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserCourse copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    int? courseId,
    DateTime? enrolledAt,
    bool? isCompleted,
    DateTime? completedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserCourse',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'courseId': courseId,
      'enrolledAt': enrolledAt.toJson(),
      'isCompleted': isCompleted,
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static UserCourseInclude include() {
    return UserCourseInclude._();
  }

  static UserCourseIncludeList includeList({
    _i1.WhereExpressionBuilder<UserCourseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserCourseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserCourseTable>? orderByList,
    UserCourseInclude? include,
  }) {
    return UserCourseIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserCourse.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserCourse.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserCourseImpl extends UserCourse {
  _UserCourseImpl({
    int? id,
    required _i1.UuidValue authUserId,
    required int courseId,
    required DateTime enrolledAt,
    required bool isCompleted,
    DateTime? completedAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         courseId: courseId,
         enrolledAt: enrolledAt,
         isCompleted: isCompleted,
         completedAt: completedAt,
       );

  /// Returns a shallow copy of this [UserCourse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserCourse copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    int? courseId,
    DateTime? enrolledAt,
    bool? isCompleted,
    Object? completedAt = _Undefined,
  }) {
    return UserCourse(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      courseId: courseId ?? this.courseId,
      enrolledAt: enrolledAt ?? this.enrolledAt,
      isCompleted: isCompleted ?? this.isCompleted,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
    );
  }
}

class UserCourseUpdateTable extends _i1.UpdateTable<UserCourseTable> {
  UserCourseUpdateTable(super.table);

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

  _i1.ColumnValue<DateTime, DateTime> enrolledAt(DateTime value) =>
      _i1.ColumnValue(
        table.enrolledAt,
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
}

class UserCourseTable extends _i1.Table<int?> {
  UserCourseTable({super.tableRelation}) : super(tableName: 'user_course') {
    updateTable = UserCourseUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    courseId = _i1.ColumnInt(
      'courseId',
      this,
    );
    enrolledAt = _i1.ColumnDateTime(
      'enrolledAt',
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
  }

  late final UserCourseUpdateTable updateTable;

  late final _i1.ColumnUuid authUserId;

  late final _i1.ColumnInt courseId;

  late final _i1.ColumnDateTime enrolledAt;

  late final _i1.ColumnBool isCompleted;

  late final _i1.ColumnDateTime completedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    courseId,
    enrolledAt,
    isCompleted,
    completedAt,
  ];
}

class UserCourseInclude extends _i1.IncludeObject {
  UserCourseInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UserCourse.t;
}

class UserCourseIncludeList extends _i1.IncludeList {
  UserCourseIncludeList._({
    _i1.WhereExpressionBuilder<UserCourseTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserCourse.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserCourse.t;
}

class UserCourseRepository {
  const UserCourseRepository._();

  /// Returns a list of [UserCourse]s matching the given query parameters.
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
  Future<List<UserCourse>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserCourseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserCourseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserCourseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserCourse>(
      where: where?.call(UserCourse.t),
      orderBy: orderBy?.call(UserCourse.t),
      orderByList: orderByList?.call(UserCourse.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserCourse] matching the given query parameters.
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
  Future<UserCourse?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserCourseTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserCourseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserCourseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserCourse>(
      where: where?.call(UserCourse.t),
      orderBy: orderBy?.call(UserCourse.t),
      orderByList: orderByList?.call(UserCourse.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserCourse] by its [id] or null if no such row exists.
  Future<UserCourse?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserCourse>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserCourse]s in the list and returns the inserted rows.
  ///
  /// The returned [UserCourse]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserCourse>> insert(
    _i1.Session session,
    List<UserCourse> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserCourse>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserCourse] and returns the inserted row.
  ///
  /// The returned [UserCourse] will have its `id` field set.
  Future<UserCourse> insertRow(
    _i1.Session session,
    UserCourse row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserCourse>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserCourse]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserCourse>> update(
    _i1.Session session,
    List<UserCourse> rows, {
    _i1.ColumnSelections<UserCourseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserCourse>(
      rows,
      columns: columns?.call(UserCourse.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserCourse]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserCourse> updateRow(
    _i1.Session session,
    UserCourse row, {
    _i1.ColumnSelections<UserCourseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserCourse>(
      row,
      columns: columns?.call(UserCourse.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserCourse] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserCourse?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<UserCourseUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UserCourse>(
      id,
      columnValues: columnValues(UserCourse.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserCourse]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UserCourse>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UserCourseUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<UserCourseTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserCourseTable>? orderBy,
    _i1.OrderByListBuilder<UserCourseTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UserCourse>(
      columnValues: columnValues(UserCourse.t.updateTable),
      where: where(UserCourse.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserCourse.t),
      orderByList: orderByList?.call(UserCourse.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [UserCourse]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserCourse>> delete(
    _i1.Session session,
    List<UserCourse> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserCourse>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserCourse].
  Future<UserCourse> deleteRow(
    _i1.Session session,
    UserCourse row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserCourse>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserCourse>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserCourseTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserCourse>(
      where: where(UserCourse.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserCourseTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserCourse>(
      where: where?.call(UserCourse.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
