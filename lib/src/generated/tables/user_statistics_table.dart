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

abstract class UserStatistics
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserStatistics._({
    this.id,
    required this.authUserId,
    required this.currentStreak,
    required this.maxStreak,
    required this.experiencePoints,
    required this.lastActiveDate,
  });

  factory UserStatistics({
    int? id,
    required _i1.UuidValue authUserId,
    required int currentStreak,
    required int maxStreak,
    required int experiencePoints,
    required DateTime lastActiveDate,
  }) = _UserStatisticsImpl;

  factory UserStatistics.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserStatistics(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      currentStreak: jsonSerialization['currentStreak'] as int,
      maxStreak: jsonSerialization['maxStreak'] as int,
      experiencePoints: jsonSerialization['experiencePoints'] as int,
      lastActiveDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastActiveDate'],
      ),
    );
  }

  static final t = UserStatisticsTable();

  static const db = UserStatisticsRepository._();

  @override
  int? id;

  _i1.UuidValue authUserId;

  int currentStreak;

  int maxStreak;

  int experiencePoints;

  DateTime lastActiveDate;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserStatistics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserStatistics copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    int? currentStreak,
    int? maxStreak,
    int? experiencePoints,
    DateTime? lastActiveDate,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserStatistics',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'currentStreak': currentStreak,
      'maxStreak': maxStreak,
      'experiencePoints': experiencePoints,
      'lastActiveDate': lastActiveDate.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static UserStatisticsInclude include() {
    return UserStatisticsInclude._();
  }

  static UserStatisticsIncludeList includeList({
    _i1.WhereExpressionBuilder<UserStatisticsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserStatisticsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserStatisticsTable>? orderByList,
    UserStatisticsInclude? include,
  }) {
    return UserStatisticsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserStatistics.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserStatistics.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserStatisticsImpl extends UserStatistics {
  _UserStatisticsImpl({
    int? id,
    required _i1.UuidValue authUserId,
    required int currentStreak,
    required int maxStreak,
    required int experiencePoints,
    required DateTime lastActiveDate,
  }) : super._(
         id: id,
         authUserId: authUserId,
         currentStreak: currentStreak,
         maxStreak: maxStreak,
         experiencePoints: experiencePoints,
         lastActiveDate: lastActiveDate,
       );

  /// Returns a shallow copy of this [UserStatistics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserStatistics copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    int? currentStreak,
    int? maxStreak,
    int? experiencePoints,
    DateTime? lastActiveDate,
  }) {
    return UserStatistics(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      currentStreak: currentStreak ?? this.currentStreak,
      maxStreak: maxStreak ?? this.maxStreak,
      experiencePoints: experiencePoints ?? this.experiencePoints,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
    );
  }
}

class UserStatisticsUpdateTable extends _i1.UpdateTable<UserStatisticsTable> {
  UserStatisticsUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<int, int> currentStreak(int value) => _i1.ColumnValue(
    table.currentStreak,
    value,
  );

  _i1.ColumnValue<int, int> maxStreak(int value) => _i1.ColumnValue(
    table.maxStreak,
    value,
  );

  _i1.ColumnValue<int, int> experiencePoints(int value) => _i1.ColumnValue(
    table.experiencePoints,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> lastActiveDate(DateTime value) =>
      _i1.ColumnValue(
        table.lastActiveDate,
        value,
      );
}

class UserStatisticsTable extends _i1.Table<int?> {
  UserStatisticsTable({super.tableRelation})
    : super(tableName: 'user_statistics') {
    updateTable = UserStatisticsUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    currentStreak = _i1.ColumnInt(
      'currentStreak',
      this,
    );
    maxStreak = _i1.ColumnInt(
      'maxStreak',
      this,
    );
    experiencePoints = _i1.ColumnInt(
      'experiencePoints',
      this,
    );
    lastActiveDate = _i1.ColumnDateTime(
      'lastActiveDate',
      this,
    );
  }

  late final UserStatisticsUpdateTable updateTable;

  late final _i1.ColumnUuid authUserId;

  late final _i1.ColumnInt currentStreak;

  late final _i1.ColumnInt maxStreak;

  late final _i1.ColumnInt experiencePoints;

  late final _i1.ColumnDateTime lastActiveDate;

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    currentStreak,
    maxStreak,
    experiencePoints,
    lastActiveDate,
  ];
}

class UserStatisticsInclude extends _i1.IncludeObject {
  UserStatisticsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UserStatistics.t;
}

class UserStatisticsIncludeList extends _i1.IncludeList {
  UserStatisticsIncludeList._({
    _i1.WhereExpressionBuilder<UserStatisticsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserStatistics.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserStatistics.t;
}

class UserStatisticsRepository {
  const UserStatisticsRepository._();

  /// Returns a list of [UserStatistics]s matching the given query parameters.
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
  Future<List<UserStatistics>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserStatisticsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserStatisticsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserStatisticsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserStatistics>(
      where: where?.call(UserStatistics.t),
      orderBy: orderBy?.call(UserStatistics.t),
      orderByList: orderByList?.call(UserStatistics.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserStatistics] matching the given query parameters.
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
  Future<UserStatistics?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserStatisticsTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserStatisticsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserStatisticsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserStatistics>(
      where: where?.call(UserStatistics.t),
      orderBy: orderBy?.call(UserStatistics.t),
      orderByList: orderByList?.call(UserStatistics.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserStatistics] by its [id] or null if no such row exists.
  Future<UserStatistics?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserStatistics>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserStatistics]s in the list and returns the inserted rows.
  ///
  /// The returned [UserStatistics]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserStatistics>> insert(
    _i1.Session session,
    List<UserStatistics> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserStatistics>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserStatistics] and returns the inserted row.
  ///
  /// The returned [UserStatistics] will have its `id` field set.
  Future<UserStatistics> insertRow(
    _i1.Session session,
    UserStatistics row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserStatistics>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserStatistics]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserStatistics>> update(
    _i1.Session session,
    List<UserStatistics> rows, {
    _i1.ColumnSelections<UserStatisticsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserStatistics>(
      rows,
      columns: columns?.call(UserStatistics.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserStatistics]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserStatistics> updateRow(
    _i1.Session session,
    UserStatistics row, {
    _i1.ColumnSelections<UserStatisticsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserStatistics>(
      row,
      columns: columns?.call(UserStatistics.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserStatistics] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserStatistics?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<UserStatisticsUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UserStatistics>(
      id,
      columnValues: columnValues(UserStatistics.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserStatistics]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UserStatistics>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UserStatisticsUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<UserStatisticsTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserStatisticsTable>? orderBy,
    _i1.OrderByListBuilder<UserStatisticsTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UserStatistics>(
      columnValues: columnValues(UserStatistics.t.updateTable),
      where: where(UserStatistics.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserStatistics.t),
      orderByList: orderByList?.call(UserStatistics.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [UserStatistics]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserStatistics>> delete(
    _i1.Session session,
    List<UserStatistics> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserStatistics>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserStatistics].
  Future<UserStatistics> deleteRow(
    _i1.Session session,
    UserStatistics row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserStatistics>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserStatistics>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserStatisticsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserStatistics>(
      where: where(UserStatistics.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserStatisticsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserStatistics>(
      where: where?.call(UserStatistics.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
