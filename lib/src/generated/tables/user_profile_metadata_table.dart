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

abstract class UserProfileMetadata
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserProfileMetadata._({
    this.id,
    required this.authUserId,
    this.lastFullNameChangedAt,
  });

  factory UserProfileMetadata({
    int? id,
    required _i1.UuidValue authUserId,
    DateTime? lastFullNameChangedAt,
  }) = _UserProfileMetadataImpl;

  factory UserProfileMetadata.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfileMetadata(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      lastFullNameChangedAt: jsonSerialization['lastFullNameChangedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastFullNameChangedAt'],
            ),
    );
  }

  static final t = UserProfileMetadataTable();

  static const db = UserProfileMetadataRepository._();

  @override
  int? id;

  _i1.UuidValue authUserId;

  DateTime? lastFullNameChangedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserProfileMetadata]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserProfileMetadata copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    DateTime? lastFullNameChangedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserProfileMetadata',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      if (lastFullNameChangedAt != null)
        'lastFullNameChangedAt': lastFullNameChangedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static UserProfileMetadataInclude include() {
    return UserProfileMetadataInclude._();
  }

  static UserProfileMetadataIncludeList includeList({
    _i1.WhereExpressionBuilder<UserProfileMetadataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserProfileMetadataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserProfileMetadataTable>? orderByList,
    UserProfileMetadataInclude? include,
  }) {
    return UserProfileMetadataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserProfileMetadata.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserProfileMetadata.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileMetadataImpl extends UserProfileMetadata {
  _UserProfileMetadataImpl({
    int? id,
    required _i1.UuidValue authUserId,
    DateTime? lastFullNameChangedAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         lastFullNameChangedAt: lastFullNameChangedAt,
       );

  /// Returns a shallow copy of this [UserProfileMetadata]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserProfileMetadata copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    Object? lastFullNameChangedAt = _Undefined,
  }) {
    return UserProfileMetadata(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      lastFullNameChangedAt: lastFullNameChangedAt is DateTime?
          ? lastFullNameChangedAt
          : this.lastFullNameChangedAt,
    );
  }
}

class UserProfileMetadataUpdateTable
    extends _i1.UpdateTable<UserProfileMetadataTable> {
  UserProfileMetadataUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> lastFullNameChangedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastFullNameChangedAt,
        value,
      );
}

class UserProfileMetadataTable extends _i1.Table<int?> {
  UserProfileMetadataTable({super.tableRelation})
    : super(tableName: 'user_profile_metadata') {
    updateTable = UserProfileMetadataUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    lastFullNameChangedAt = _i1.ColumnDateTime(
      'lastFullNameChangedAt',
      this,
    );
  }

  late final UserProfileMetadataUpdateTable updateTable;

  late final _i1.ColumnUuid authUserId;

  late final _i1.ColumnDateTime lastFullNameChangedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    lastFullNameChangedAt,
  ];
}

class UserProfileMetadataInclude extends _i1.IncludeObject {
  UserProfileMetadataInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UserProfileMetadata.t;
}

class UserProfileMetadataIncludeList extends _i1.IncludeList {
  UserProfileMetadataIncludeList._({
    _i1.WhereExpressionBuilder<UserProfileMetadataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserProfileMetadata.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserProfileMetadata.t;
}

class UserProfileMetadataRepository {
  const UserProfileMetadataRepository._();

  /// Returns a list of [UserProfileMetadata]s matching the given query parameters.
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
  Future<List<UserProfileMetadata>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserProfileMetadataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserProfileMetadataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserProfileMetadataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserProfileMetadata>(
      where: where?.call(UserProfileMetadata.t),
      orderBy: orderBy?.call(UserProfileMetadata.t),
      orderByList: orderByList?.call(UserProfileMetadata.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserProfileMetadata] matching the given query parameters.
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
  Future<UserProfileMetadata?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserProfileMetadataTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserProfileMetadataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserProfileMetadataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserProfileMetadata>(
      where: where?.call(UserProfileMetadata.t),
      orderBy: orderBy?.call(UserProfileMetadata.t),
      orderByList: orderByList?.call(UserProfileMetadata.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserProfileMetadata] by its [id] or null if no such row exists.
  Future<UserProfileMetadata?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserProfileMetadata>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserProfileMetadata]s in the list and returns the inserted rows.
  ///
  /// The returned [UserProfileMetadata]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserProfileMetadata>> insert(
    _i1.Session session,
    List<UserProfileMetadata> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserProfileMetadata>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserProfileMetadata] and returns the inserted row.
  ///
  /// The returned [UserProfileMetadata] will have its `id` field set.
  Future<UserProfileMetadata> insertRow(
    _i1.Session session,
    UserProfileMetadata row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserProfileMetadata>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserProfileMetadata]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserProfileMetadata>> update(
    _i1.Session session,
    List<UserProfileMetadata> rows, {
    _i1.ColumnSelections<UserProfileMetadataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserProfileMetadata>(
      rows,
      columns: columns?.call(UserProfileMetadata.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserProfileMetadata]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserProfileMetadata> updateRow(
    _i1.Session session,
    UserProfileMetadata row, {
    _i1.ColumnSelections<UserProfileMetadataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserProfileMetadata>(
      row,
      columns: columns?.call(UserProfileMetadata.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserProfileMetadata] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserProfileMetadata?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<UserProfileMetadataUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UserProfileMetadata>(
      id,
      columnValues: columnValues(UserProfileMetadata.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserProfileMetadata]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UserProfileMetadata>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UserProfileMetadataUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<UserProfileMetadataTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserProfileMetadataTable>? orderBy,
    _i1.OrderByListBuilder<UserProfileMetadataTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UserProfileMetadata>(
      columnValues: columnValues(UserProfileMetadata.t.updateTable),
      where: where(UserProfileMetadata.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserProfileMetadata.t),
      orderByList: orderByList?.call(UserProfileMetadata.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [UserProfileMetadata]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserProfileMetadata>> delete(
    _i1.Session session,
    List<UserProfileMetadata> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserProfileMetadata>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserProfileMetadata].
  Future<UserProfileMetadata> deleteRow(
    _i1.Session session,
    UserProfileMetadata row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserProfileMetadata>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserProfileMetadata>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserProfileMetadataTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserProfileMetadata>(
      where: where(UserProfileMetadata.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserProfileMetadataTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserProfileMetadata>(
      where: where?.call(UserProfileMetadata.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
