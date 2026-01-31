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

abstract class UserAchievement
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserAchievement._({
    this.id,
    required this.authUserId,
    required this.achievementId,
    required this.unlockedAt,
  });

  factory UserAchievement({
    int? id,
    required _i1.UuidValue authUserId,
    required int achievementId,
    required DateTime unlockedAt,
  }) = _UserAchievementImpl;

  factory UserAchievement.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserAchievement(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      achievementId: jsonSerialization['achievementId'] as int,
      unlockedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['unlockedAt'],
      ),
    );
  }

  static final t = UserAchievementTable();

  static const db = UserAchievementRepository._();

  @override
  int? id;

  _i1.UuidValue authUserId;

  int achievementId;

  DateTime unlockedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserAchievement]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserAchievement copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    int? achievementId,
    DateTime? unlockedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserAchievement',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'achievementId': achievementId,
      'unlockedAt': unlockedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static UserAchievementInclude include() {
    return UserAchievementInclude._();
  }

  static UserAchievementIncludeList includeList({
    _i1.WhereExpressionBuilder<UserAchievementTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserAchievementTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserAchievementTable>? orderByList,
    UserAchievementInclude? include,
  }) {
    return UserAchievementIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserAchievement.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserAchievement.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserAchievementImpl extends UserAchievement {
  _UserAchievementImpl({
    int? id,
    required _i1.UuidValue authUserId,
    required int achievementId,
    required DateTime unlockedAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         achievementId: achievementId,
         unlockedAt: unlockedAt,
       );

  /// Returns a shallow copy of this [UserAchievement]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserAchievement copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    int? achievementId,
    DateTime? unlockedAt,
  }) {
    return UserAchievement(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      achievementId: achievementId ?? this.achievementId,
      unlockedAt: unlockedAt ?? this.unlockedAt,
    );
  }
}

class UserAchievementUpdateTable extends _i1.UpdateTable<UserAchievementTable> {
  UserAchievementUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<int, int> achievementId(int value) => _i1.ColumnValue(
    table.achievementId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> unlockedAt(DateTime value) =>
      _i1.ColumnValue(
        table.unlockedAt,
        value,
      );
}

class UserAchievementTable extends _i1.Table<int?> {
  UserAchievementTable({super.tableRelation})
    : super(tableName: 'user_achievement') {
    updateTable = UserAchievementUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    achievementId = _i1.ColumnInt(
      'achievementId',
      this,
    );
    unlockedAt = _i1.ColumnDateTime(
      'unlockedAt',
      this,
    );
  }

  late final UserAchievementUpdateTable updateTable;

  late final _i1.ColumnUuid authUserId;

  late final _i1.ColumnInt achievementId;

  late final _i1.ColumnDateTime unlockedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    achievementId,
    unlockedAt,
  ];
}

class UserAchievementInclude extends _i1.IncludeObject {
  UserAchievementInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UserAchievement.t;
}

class UserAchievementIncludeList extends _i1.IncludeList {
  UserAchievementIncludeList._({
    _i1.WhereExpressionBuilder<UserAchievementTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserAchievement.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserAchievement.t;
}

class UserAchievementRepository {
  const UserAchievementRepository._();

  /// Returns a list of [UserAchievement]s matching the given query parameters.
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
  Future<List<UserAchievement>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserAchievementTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserAchievementTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserAchievementTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserAchievement>(
      where: where?.call(UserAchievement.t),
      orderBy: orderBy?.call(UserAchievement.t),
      orderByList: orderByList?.call(UserAchievement.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserAchievement] matching the given query parameters.
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
  Future<UserAchievement?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserAchievementTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserAchievementTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserAchievementTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserAchievement>(
      where: where?.call(UserAchievement.t),
      orderBy: orderBy?.call(UserAchievement.t),
      orderByList: orderByList?.call(UserAchievement.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserAchievement] by its [id] or null if no such row exists.
  Future<UserAchievement?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserAchievement>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserAchievement]s in the list and returns the inserted rows.
  ///
  /// The returned [UserAchievement]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserAchievement>> insert(
    _i1.Session session,
    List<UserAchievement> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserAchievement>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserAchievement] and returns the inserted row.
  ///
  /// The returned [UserAchievement] will have its `id` field set.
  Future<UserAchievement> insertRow(
    _i1.Session session,
    UserAchievement row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserAchievement>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserAchievement]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserAchievement>> update(
    _i1.Session session,
    List<UserAchievement> rows, {
    _i1.ColumnSelections<UserAchievementTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserAchievement>(
      rows,
      columns: columns?.call(UserAchievement.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserAchievement]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserAchievement> updateRow(
    _i1.Session session,
    UserAchievement row, {
    _i1.ColumnSelections<UserAchievementTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserAchievement>(
      row,
      columns: columns?.call(UserAchievement.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserAchievement] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserAchievement?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<UserAchievementUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UserAchievement>(
      id,
      columnValues: columnValues(UserAchievement.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserAchievement]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UserAchievement>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UserAchievementUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<UserAchievementTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserAchievementTable>? orderBy,
    _i1.OrderByListBuilder<UserAchievementTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UserAchievement>(
      columnValues: columnValues(UserAchievement.t.updateTable),
      where: where(UserAchievement.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserAchievement.t),
      orderByList: orderByList?.call(UserAchievement.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [UserAchievement]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserAchievement>> delete(
    _i1.Session session,
    List<UserAchievement> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserAchievement>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserAchievement].
  Future<UserAchievement> deleteRow(
    _i1.Session session,
    UserAchievement row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserAchievement>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserAchievement>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserAchievementTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserAchievement>(
      where: where(UserAchievement.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserAchievementTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserAchievement>(
      where: where?.call(UserAchievement.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
