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

abstract class UserWallet
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserWallet._({
    this.id,
    required this.authUserId,
    required this.balance,
    required this.available,
    required this.held,
    required this.currency,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserWallet({
    int? id,
    required _i1.UuidValue authUserId,
    required int balance,
    required int available,
    required int held,
    required String currency,
    required int version,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserWalletImpl;

  factory UserWallet.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserWallet(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      balance: jsonSerialization['balance'] as int,
      available: jsonSerialization['available'] as int,
      held: jsonSerialization['held'] as int,
      currency: jsonSerialization['currency'] as String,
      version: jsonSerialization['version'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = UserWalletTable();

  static const db = UserWalletRepository._();

  @override
  int? id;

  _i1.UuidValue authUserId;

  int balance;

  int available;

  int held;

  String currency;

  int version;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserWallet]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserWallet copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    int? balance,
    int? available,
    int? held,
    String? currency,
    int? version,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserWallet',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'balance': balance,
      'available': available,
      'held': held,
      'currency': currency,
      'version': version,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserWallet',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'balance': balance,
      'available': available,
      'held': held,
      'currency': currency,
      'version': version,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static UserWalletInclude include() {
    return UserWalletInclude._();
  }

  static UserWalletIncludeList includeList({
    _i1.WhereExpressionBuilder<UserWalletTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserWalletTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserWalletTable>? orderByList,
    UserWalletInclude? include,
  }) {
    return UserWalletIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserWallet.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserWallet.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserWalletImpl extends UserWallet {
  _UserWalletImpl({
    int? id,
    required _i1.UuidValue authUserId,
    required int balance,
    required int available,
    required int held,
    required String currency,
    required int version,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         balance: balance,
         available: available,
         held: held,
         currency: currency,
         version: version,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [UserWallet]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserWallet copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    int? balance,
    int? available,
    int? held,
    String? currency,
    int? version,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserWallet(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      balance: balance ?? this.balance,
      available: available ?? this.available,
      held: held ?? this.held,
      currency: currency ?? this.currency,
      version: version ?? this.version,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class UserWalletUpdateTable extends _i1.UpdateTable<UserWalletTable> {
  UserWalletUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<int, int> balance(int value) => _i1.ColumnValue(
    table.balance,
    value,
  );

  _i1.ColumnValue<int, int> available(int value) => _i1.ColumnValue(
    table.available,
    value,
  );

  _i1.ColumnValue<int, int> held(int value) => _i1.ColumnValue(
    table.held,
    value,
  );

  _i1.ColumnValue<String, String> currency(String value) => _i1.ColumnValue(
    table.currency,
    value,
  );

  _i1.ColumnValue<int, int> version(int value) => _i1.ColumnValue(
    table.version,
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

class UserWalletTable extends _i1.Table<int?> {
  UserWalletTable({super.tableRelation}) : super(tableName: 'user_wallet') {
    updateTable = UserWalletUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    balance = _i1.ColumnInt(
      'balance',
      this,
    );
    available = _i1.ColumnInt(
      'available',
      this,
    );
    held = _i1.ColumnInt(
      'held',
      this,
    );
    currency = _i1.ColumnString(
      'currency',
      this,
    );
    version = _i1.ColumnInt(
      'version',
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

  late final UserWalletUpdateTable updateTable;

  late final _i1.ColumnUuid authUserId;

  late final _i1.ColumnInt balance;

  late final _i1.ColumnInt available;

  late final _i1.ColumnInt held;

  late final _i1.ColumnString currency;

  late final _i1.ColumnInt version;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    balance,
    available,
    held,
    currency,
    version,
    createdAt,
    updatedAt,
  ];
}

class UserWalletInclude extends _i1.IncludeObject {
  UserWalletInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => UserWallet.t;
}

class UserWalletIncludeList extends _i1.IncludeList {
  UserWalletIncludeList._({
    _i1.WhereExpressionBuilder<UserWalletTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserWallet.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserWallet.t;
}

class UserWalletRepository {
  const UserWalletRepository._();

  /// Returns a list of [UserWallet]s matching the given query parameters.
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
  Future<List<UserWallet>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserWalletTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserWalletTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserWalletTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserWallet>(
      where: where?.call(UserWallet.t),
      orderBy: orderBy?.call(UserWallet.t),
      orderByList: orderByList?.call(UserWallet.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UserWallet] matching the given query parameters.
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
  Future<UserWallet?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserWalletTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserWalletTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserWalletTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserWallet>(
      where: where?.call(UserWallet.t),
      orderBy: orderBy?.call(UserWallet.t),
      orderByList: orderByList?.call(UserWallet.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UserWallet] by its [id] or null if no such row exists.
  Future<UserWallet?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserWallet>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UserWallet]s in the list and returns the inserted rows.
  ///
  /// The returned [UserWallet]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UserWallet>> insert(
    _i1.Session session,
    List<UserWallet> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserWallet>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UserWallet] and returns the inserted row.
  ///
  /// The returned [UserWallet] will have its `id` field set.
  Future<UserWallet> insertRow(
    _i1.Session session,
    UserWallet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserWallet>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UserWallet]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserWallet>> update(
    _i1.Session session,
    List<UserWallet> rows, {
    _i1.ColumnSelections<UserWalletTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserWallet>(
      rows,
      columns: columns?.call(UserWallet.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserWallet]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserWallet> updateRow(
    _i1.Session session,
    UserWallet row, {
    _i1.ColumnSelections<UserWalletTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserWallet>(
      row,
      columns: columns?.call(UserWallet.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserWallet] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserWallet?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<UserWalletUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UserWallet>(
      id,
      columnValues: columnValues(UserWallet.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserWallet]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UserWallet>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UserWalletUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<UserWalletTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserWalletTable>? orderBy,
    _i1.OrderByListBuilder<UserWalletTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UserWallet>(
      columnValues: columnValues(UserWallet.t.updateTable),
      where: where(UserWallet.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserWallet.t),
      orderByList: orderByList?.call(UserWallet.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [UserWallet]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserWallet>> delete(
    _i1.Session session,
    List<UserWallet> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserWallet>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserWallet].
  Future<UserWallet> deleteRow(
    _i1.Session session,
    UserWallet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserWallet>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UserWallet>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserWalletTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserWallet>(
      where: where(UserWallet.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserWalletTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserWallet>(
      where: where?.call(UserWallet.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
