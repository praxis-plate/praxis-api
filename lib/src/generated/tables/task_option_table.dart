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

abstract class TaskOption
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  TaskOption._({
    this.id,
    required this.taskId,
    required this.optionText,
    required this.isCorrect,
    required this.orderIndex,
  });

  factory TaskOption({
    int? id,
    required int taskId,
    required String optionText,
    required bool isCorrect,
    required int orderIndex,
  }) = _TaskOptionImpl;

  factory TaskOption.fromJson(Map<String, dynamic> jsonSerialization) {
    return TaskOption(
      id: jsonSerialization['id'] as int?,
      taskId: jsonSerialization['taskId'] as int,
      optionText: jsonSerialization['optionText'] as String,
      isCorrect: jsonSerialization['isCorrect'] as bool,
      orderIndex: jsonSerialization['orderIndex'] as int,
    );
  }

  static final t = TaskOptionTable();

  static const db = TaskOptionRepository._();

  @override
  int? id;

  int taskId;

  String optionText;

  bool isCorrect;

  int orderIndex;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [TaskOption]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskOption copyWith({
    int? id,
    int? taskId,
    String? optionText,
    bool? isCorrect,
    int? orderIndex,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TaskOption',
      if (id != null) 'id': id,
      'taskId': taskId,
      'optionText': optionText,
      'isCorrect': isCorrect,
      'orderIndex': orderIndex,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static TaskOptionInclude include() {
    return TaskOptionInclude._();
  }

  static TaskOptionIncludeList includeList({
    _i1.WhereExpressionBuilder<TaskOptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskOptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskOptionTable>? orderByList,
    TaskOptionInclude? include,
  }) {
    return TaskOptionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TaskOption.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TaskOption.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskOptionImpl extends TaskOption {
  _TaskOptionImpl({
    int? id,
    required int taskId,
    required String optionText,
    required bool isCorrect,
    required int orderIndex,
  }) : super._(
         id: id,
         taskId: taskId,
         optionText: optionText,
         isCorrect: isCorrect,
         orderIndex: orderIndex,
       );

  /// Returns a shallow copy of this [TaskOption]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskOption copyWith({
    Object? id = _Undefined,
    int? taskId,
    String? optionText,
    bool? isCorrect,
    int? orderIndex,
  }) {
    return TaskOption(
      id: id is int? ? id : this.id,
      taskId: taskId ?? this.taskId,
      optionText: optionText ?? this.optionText,
      isCorrect: isCorrect ?? this.isCorrect,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }
}

class TaskOptionUpdateTable extends _i1.UpdateTable<TaskOptionTable> {
  TaskOptionUpdateTable(super.table);

  _i1.ColumnValue<int, int> taskId(int value) => _i1.ColumnValue(
    table.taskId,
    value,
  );

  _i1.ColumnValue<String, String> optionText(String value) => _i1.ColumnValue(
    table.optionText,
    value,
  );

  _i1.ColumnValue<bool, bool> isCorrect(bool value) => _i1.ColumnValue(
    table.isCorrect,
    value,
  );

  _i1.ColumnValue<int, int> orderIndex(int value) => _i1.ColumnValue(
    table.orderIndex,
    value,
  );
}

class TaskOptionTable extends _i1.Table<int?> {
  TaskOptionTable({super.tableRelation}) : super(tableName: 'task_option') {
    updateTable = TaskOptionUpdateTable(this);
    taskId = _i1.ColumnInt(
      'taskId',
      this,
    );
    optionText = _i1.ColumnString(
      'optionText',
      this,
    );
    isCorrect = _i1.ColumnBool(
      'isCorrect',
      this,
    );
    orderIndex = _i1.ColumnInt(
      'orderIndex',
      this,
    );
  }

  late final TaskOptionUpdateTable updateTable;

  late final _i1.ColumnInt taskId;

  late final _i1.ColumnString optionText;

  late final _i1.ColumnBool isCorrect;

  late final _i1.ColumnInt orderIndex;

  @override
  List<_i1.Column> get columns => [
    id,
    taskId,
    optionText,
    isCorrect,
    orderIndex,
  ];
}

class TaskOptionInclude extends _i1.IncludeObject {
  TaskOptionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => TaskOption.t;
}

class TaskOptionIncludeList extends _i1.IncludeList {
  TaskOptionIncludeList._({
    _i1.WhereExpressionBuilder<TaskOptionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TaskOption.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TaskOption.t;
}

class TaskOptionRepository {
  const TaskOptionRepository._();

  /// Returns a list of [TaskOption]s matching the given query parameters.
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
  Future<List<TaskOption>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskOptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskOptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskOptionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TaskOption>(
      where: where?.call(TaskOption.t),
      orderBy: orderBy?.call(TaskOption.t),
      orderByList: orderByList?.call(TaskOption.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [TaskOption] matching the given query parameters.
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
  Future<TaskOption?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskOptionTable>? where,
    int? offset,
    _i1.OrderByBuilder<TaskOptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskOptionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TaskOption>(
      where: where?.call(TaskOption.t),
      orderBy: orderBy?.call(TaskOption.t),
      orderByList: orderByList?.call(TaskOption.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TaskOption] by its [id] or null if no such row exists.
  Future<TaskOption?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TaskOption>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TaskOption]s in the list and returns the inserted rows.
  ///
  /// The returned [TaskOption]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TaskOption>> insert(
    _i1.Session session,
    List<TaskOption> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TaskOption>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TaskOption] and returns the inserted row.
  ///
  /// The returned [TaskOption] will have its `id` field set.
  Future<TaskOption> insertRow(
    _i1.Session session,
    TaskOption row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TaskOption>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TaskOption]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TaskOption>> update(
    _i1.Session session,
    List<TaskOption> rows, {
    _i1.ColumnSelections<TaskOptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TaskOption>(
      rows,
      columns: columns?.call(TaskOption.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TaskOption]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TaskOption> updateRow(
    _i1.Session session,
    TaskOption row, {
    _i1.ColumnSelections<TaskOptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TaskOption>(
      row,
      columns: columns?.call(TaskOption.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TaskOption] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TaskOption?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TaskOptionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TaskOption>(
      id,
      columnValues: columnValues(TaskOption.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TaskOption]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TaskOption>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TaskOptionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TaskOptionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskOptionTable>? orderBy,
    _i1.OrderByListBuilder<TaskOptionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TaskOption>(
      columnValues: columnValues(TaskOption.t.updateTable),
      where: where(TaskOption.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TaskOption.t),
      orderByList: orderByList?.call(TaskOption.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TaskOption]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TaskOption>> delete(
    _i1.Session session,
    List<TaskOption> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TaskOption>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TaskOption].
  Future<TaskOption> deleteRow(
    _i1.Session session,
    TaskOption row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TaskOption>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TaskOption>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TaskOptionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TaskOption>(
      where: where(TaskOption.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskOptionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TaskOption>(
      where: where?.call(TaskOption.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
