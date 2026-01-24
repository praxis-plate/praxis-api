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

abstract class CoinTransaction
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CoinTransaction._({
    this.id,
    required this.authUserId,
    required this.transactionKey,
    required this.type,
    required this.status,
    required this.amount,
    required this.currency,
    this.relatedEntityId,
    this.reversalOfTransactionId,
    this.reason,
    this.metadata,
    required this.createdAt,
  });

  factory CoinTransaction({
    int? id,
    required _i1.UuidValue authUserId,
    required String transactionKey,
    required String type,
    required String status,
    required int amount,
    required String currency,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
    required DateTime createdAt,
  }) = _CoinTransactionImpl;

  factory CoinTransaction.fromJson(Map<String, dynamic> jsonSerialization) {
    return CoinTransaction(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      transactionKey: jsonSerialization['transactionKey'] as String,
      type: jsonSerialization['type'] as String,
      status: jsonSerialization['status'] as String,
      amount: jsonSerialization['amount'] as int,
      currency: jsonSerialization['currency'] as String,
      relatedEntityId: jsonSerialization['relatedEntityId'] as String?,
      reversalOfTransactionId:
          jsonSerialization['reversalOfTransactionId'] as int?,
      reason: jsonSerialization['reason'] as String?,
      metadata: jsonSerialization['metadata'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = CoinTransactionTable();

  static const db = CoinTransactionRepository._();

  @override
  int? id;

  _i1.UuidValue authUserId;

  String transactionKey;

  String type;

  String status;

  int amount;

  String currency;

  String? relatedEntityId;

  int? reversalOfTransactionId;

  String? reason;

  String? metadata;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CoinTransaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CoinTransaction copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    String? transactionKey,
    String? type,
    String? status,
    int? amount,
    String? currency,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CoinTransaction',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      'transactionKey': transactionKey,
      'type': type,
      'status': status,
      'amount': amount,
      'currency': currency,
      if (relatedEntityId != null) 'relatedEntityId': relatedEntityId,
      if (reversalOfTransactionId != null)
        'reversalOfTransactionId': reversalOfTransactionId,
      if (reason != null) 'reason': reason,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static CoinTransactionInclude include() {
    return CoinTransactionInclude._();
  }

  static CoinTransactionIncludeList includeList({
    _i1.WhereExpressionBuilder<CoinTransactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CoinTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CoinTransactionTable>? orderByList,
    CoinTransactionInclude? include,
  }) {
    return CoinTransactionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CoinTransaction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CoinTransaction.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CoinTransactionImpl extends CoinTransaction {
  _CoinTransactionImpl({
    int? id,
    required _i1.UuidValue authUserId,
    required String transactionKey,
    required String type,
    required String status,
    required int amount,
    required String currency,
    String? relatedEntityId,
    int? reversalOfTransactionId,
    String? reason,
    String? metadata,
    required DateTime createdAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         transactionKey: transactionKey,
         type: type,
         status: status,
         amount: amount,
         currency: currency,
         relatedEntityId: relatedEntityId,
         reversalOfTransactionId: reversalOfTransactionId,
         reason: reason,
         metadata: metadata,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CoinTransaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CoinTransaction copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    String? transactionKey,
    String? type,
    String? status,
    int? amount,
    String? currency,
    Object? relatedEntityId = _Undefined,
    Object? reversalOfTransactionId = _Undefined,
    Object? reason = _Undefined,
    Object? metadata = _Undefined,
    DateTime? createdAt,
  }) {
    return CoinTransaction(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      transactionKey: transactionKey ?? this.transactionKey,
      type: type ?? this.type,
      status: status ?? this.status,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      relatedEntityId: relatedEntityId is String?
          ? relatedEntityId
          : this.relatedEntityId,
      reversalOfTransactionId: reversalOfTransactionId is int?
          ? reversalOfTransactionId
          : this.reversalOfTransactionId,
      reason: reason is String? ? reason : this.reason,
      metadata: metadata is String? ? metadata : this.metadata,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CoinTransactionUpdateTable extends _i1.UpdateTable<CoinTransactionTable> {
  CoinTransactionUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<String, String> transactionKey(String value) =>
      _i1.ColumnValue(
        table.transactionKey,
        value,
      );

  _i1.ColumnValue<String, String> type(String value) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<int, int> amount(int value) => _i1.ColumnValue(
    table.amount,
    value,
  );

  _i1.ColumnValue<String, String> currency(String value) => _i1.ColumnValue(
    table.currency,
    value,
  );

  _i1.ColumnValue<String, String> relatedEntityId(String? value) =>
      _i1.ColumnValue(
        table.relatedEntityId,
        value,
      );

  _i1.ColumnValue<int, int> reversalOfTransactionId(int? value) =>
      _i1.ColumnValue(
        table.reversalOfTransactionId,
        value,
      );

  _i1.ColumnValue<String, String> reason(String? value) => _i1.ColumnValue(
    table.reason,
    value,
  );

  _i1.ColumnValue<String, String> metadata(String? value) => _i1.ColumnValue(
    table.metadata,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class CoinTransactionTable extends _i1.Table<int?> {
  CoinTransactionTable({super.tableRelation})
    : super(tableName: 'coin_transaction') {
    updateTable = CoinTransactionUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    transactionKey = _i1.ColumnString(
      'transactionKey',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    amount = _i1.ColumnInt(
      'amount',
      this,
    );
    currency = _i1.ColumnString(
      'currency',
      this,
    );
    relatedEntityId = _i1.ColumnString(
      'relatedEntityId',
      this,
    );
    reversalOfTransactionId = _i1.ColumnInt(
      'reversalOfTransactionId',
      this,
    );
    reason = _i1.ColumnString(
      'reason',
      this,
    );
    metadata = _i1.ColumnString(
      'metadata',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final CoinTransactionUpdateTable updateTable;

  late final _i1.ColumnUuid authUserId;

  late final _i1.ColumnString transactionKey;

  late final _i1.ColumnString type;

  late final _i1.ColumnString status;

  late final _i1.ColumnInt amount;

  late final _i1.ColumnString currency;

  late final _i1.ColumnString relatedEntityId;

  late final _i1.ColumnInt reversalOfTransactionId;

  late final _i1.ColumnString reason;

  late final _i1.ColumnString metadata;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    transactionKey,
    type,
    status,
    amount,
    currency,
    relatedEntityId,
    reversalOfTransactionId,
    reason,
    metadata,
    createdAt,
  ];
}

class CoinTransactionInclude extends _i1.IncludeObject {
  CoinTransactionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CoinTransaction.t;
}

class CoinTransactionIncludeList extends _i1.IncludeList {
  CoinTransactionIncludeList._({
    _i1.WhereExpressionBuilder<CoinTransactionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CoinTransaction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CoinTransaction.t;
}

class CoinTransactionRepository {
  const CoinTransactionRepository._();

  /// Returns a list of [CoinTransaction]s matching the given query parameters.
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
  Future<List<CoinTransaction>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CoinTransactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CoinTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CoinTransactionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CoinTransaction>(
      where: where?.call(CoinTransaction.t),
      orderBy: orderBy?.call(CoinTransaction.t),
      orderByList: orderByList?.call(CoinTransaction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CoinTransaction] matching the given query parameters.
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
  Future<CoinTransaction?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CoinTransactionTable>? where,
    int? offset,
    _i1.OrderByBuilder<CoinTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CoinTransactionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CoinTransaction>(
      where: where?.call(CoinTransaction.t),
      orderBy: orderBy?.call(CoinTransaction.t),
      orderByList: orderByList?.call(CoinTransaction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CoinTransaction] by its [id] or null if no such row exists.
  Future<CoinTransaction?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CoinTransaction>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CoinTransaction]s in the list and returns the inserted rows.
  ///
  /// The returned [CoinTransaction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CoinTransaction>> insert(
    _i1.Session session,
    List<CoinTransaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CoinTransaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CoinTransaction] and returns the inserted row.
  ///
  /// The returned [CoinTransaction] will have its `id` field set.
  Future<CoinTransaction> insertRow(
    _i1.Session session,
    CoinTransaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CoinTransaction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CoinTransaction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CoinTransaction>> update(
    _i1.Session session,
    List<CoinTransaction> rows, {
    _i1.ColumnSelections<CoinTransactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CoinTransaction>(
      rows,
      columns: columns?.call(CoinTransaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CoinTransaction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CoinTransaction> updateRow(
    _i1.Session session,
    CoinTransaction row, {
    _i1.ColumnSelections<CoinTransactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CoinTransaction>(
      row,
      columns: columns?.call(CoinTransaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CoinTransaction] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CoinTransaction?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<CoinTransactionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CoinTransaction>(
      id,
      columnValues: columnValues(CoinTransaction.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CoinTransaction]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CoinTransaction>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CoinTransactionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<CoinTransactionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CoinTransactionTable>? orderBy,
    _i1.OrderByListBuilder<CoinTransactionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CoinTransaction>(
      columnValues: columnValues(CoinTransaction.t.updateTable),
      where: where(CoinTransaction.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CoinTransaction.t),
      orderByList: orderByList?.call(CoinTransaction.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CoinTransaction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CoinTransaction>> delete(
    _i1.Session session,
    List<CoinTransaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CoinTransaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CoinTransaction].
  Future<CoinTransaction> deleteRow(
    _i1.Session session,
    CoinTransaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CoinTransaction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CoinTransaction>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CoinTransactionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CoinTransaction>(
      where: where(CoinTransaction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CoinTransactionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CoinTransaction>(
      where: where?.call(CoinTransaction.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
