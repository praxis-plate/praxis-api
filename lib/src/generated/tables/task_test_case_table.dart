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

abstract class TaskTestCase
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  TaskTestCase._({
    this.id,
    required this.taskId,
    required this.input,
    required this.expectedOutput,
    required this.isHidden,
    required this.orderIndex,
  });

  factory TaskTestCase({
    int? id,
    required int taskId,
    required String input,
    required String expectedOutput,
    required bool isHidden,
    required int orderIndex,
  }) = _TaskTestCaseImpl;

  factory TaskTestCase.fromJson(Map<String, dynamic> jsonSerialization) {
    return TaskTestCase(
      id: jsonSerialization['id'] as int?,
      taskId: jsonSerialization['taskId'] as int,
      input: jsonSerialization['input'] as String,
      expectedOutput: jsonSerialization['expectedOutput'] as String,
      isHidden: jsonSerialization['isHidden'] as bool,
      orderIndex: jsonSerialization['orderIndex'] as int,
    );
  }

  static final t = TaskTestCaseTable();

  static const db = TaskTestCaseRepository._();

  @override
  int? id;

  int taskId;

  String input;

  String expectedOutput;

  bool isHidden;

  int orderIndex;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [TaskTestCase]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskTestCase copyWith({
    int? id,
    int? taskId,
    String? input,
    String? expectedOutput,
    bool? isHidden,
    int? orderIndex,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TaskTestCase',
      if (id != null) 'id': id,
      'taskId': taskId,
      'input': input,
      'expectedOutput': expectedOutput,
      'isHidden': isHidden,
      'orderIndex': orderIndex,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static TaskTestCaseInclude include() {
    return TaskTestCaseInclude._();
  }

  static TaskTestCaseIncludeList includeList({
    _i1.WhereExpressionBuilder<TaskTestCaseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskTestCaseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskTestCaseTable>? orderByList,
    TaskTestCaseInclude? include,
  }) {
    return TaskTestCaseIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TaskTestCase.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TaskTestCase.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskTestCaseImpl extends TaskTestCase {
  _TaskTestCaseImpl({
    int? id,
    required int taskId,
    required String input,
    required String expectedOutput,
    required bool isHidden,
    required int orderIndex,
  }) : super._(
         id: id,
         taskId: taskId,
         input: input,
         expectedOutput: expectedOutput,
         isHidden: isHidden,
         orderIndex: orderIndex,
       );

  /// Returns a shallow copy of this [TaskTestCase]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskTestCase copyWith({
    Object? id = _Undefined,
    int? taskId,
    String? input,
    String? expectedOutput,
    bool? isHidden,
    int? orderIndex,
  }) {
    return TaskTestCase(
      id: id is int? ? id : this.id,
      taskId: taskId ?? this.taskId,
      input: input ?? this.input,
      expectedOutput: expectedOutput ?? this.expectedOutput,
      isHidden: isHidden ?? this.isHidden,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }
}

class TaskTestCaseUpdateTable extends _i1.UpdateTable<TaskTestCaseTable> {
  TaskTestCaseUpdateTable(super.table);

  _i1.ColumnValue<int, int> taskId(int value) => _i1.ColumnValue(
    table.taskId,
    value,
  );

  _i1.ColumnValue<String, String> input(String value) => _i1.ColumnValue(
    table.input,
    value,
  );

  _i1.ColumnValue<String, String> expectedOutput(String value) =>
      _i1.ColumnValue(
        table.expectedOutput,
        value,
      );

  _i1.ColumnValue<bool, bool> isHidden(bool value) => _i1.ColumnValue(
    table.isHidden,
    value,
  );

  _i1.ColumnValue<int, int> orderIndex(int value) => _i1.ColumnValue(
    table.orderIndex,
    value,
  );
}

class TaskTestCaseTable extends _i1.Table<int?> {
  TaskTestCaseTable({super.tableRelation})
    : super(tableName: 'task_test_case') {
    updateTable = TaskTestCaseUpdateTable(this);
    taskId = _i1.ColumnInt(
      'taskId',
      this,
    );
    input = _i1.ColumnString(
      'input',
      this,
    );
    expectedOutput = _i1.ColumnString(
      'expectedOutput',
      this,
    );
    isHidden = _i1.ColumnBool(
      'isHidden',
      this,
    );
    orderIndex = _i1.ColumnInt(
      'orderIndex',
      this,
    );
  }

  late final TaskTestCaseUpdateTable updateTable;

  late final _i1.ColumnInt taskId;

  late final _i1.ColumnString input;

  late final _i1.ColumnString expectedOutput;

  late final _i1.ColumnBool isHidden;

  late final _i1.ColumnInt orderIndex;

  @override
  List<_i1.Column> get columns => [
    id,
    taskId,
    input,
    expectedOutput,
    isHidden,
    orderIndex,
  ];
}

class TaskTestCaseInclude extends _i1.IncludeObject {
  TaskTestCaseInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => TaskTestCase.t;
}

class TaskTestCaseIncludeList extends _i1.IncludeList {
  TaskTestCaseIncludeList._({
    _i1.WhereExpressionBuilder<TaskTestCaseTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TaskTestCase.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TaskTestCase.t;
}

class TaskTestCaseRepository {
  const TaskTestCaseRepository._();

  /// Returns a list of [TaskTestCase]s matching the given query parameters.
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
  Future<List<TaskTestCase>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskTestCaseTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskTestCaseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskTestCaseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TaskTestCase>(
      where: where?.call(TaskTestCase.t),
      orderBy: orderBy?.call(TaskTestCase.t),
      orderByList: orderByList?.call(TaskTestCase.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [TaskTestCase] matching the given query parameters.
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
  Future<TaskTestCase?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskTestCaseTable>? where,
    int? offset,
    _i1.OrderByBuilder<TaskTestCaseTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskTestCaseTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TaskTestCase>(
      where: where?.call(TaskTestCase.t),
      orderBy: orderBy?.call(TaskTestCase.t),
      orderByList: orderByList?.call(TaskTestCase.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TaskTestCase] by its [id] or null if no such row exists.
  Future<TaskTestCase?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TaskTestCase>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TaskTestCase]s in the list and returns the inserted rows.
  ///
  /// The returned [TaskTestCase]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TaskTestCase>> insert(
    _i1.Session session,
    List<TaskTestCase> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TaskTestCase>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TaskTestCase] and returns the inserted row.
  ///
  /// The returned [TaskTestCase] will have its `id` field set.
  Future<TaskTestCase> insertRow(
    _i1.Session session,
    TaskTestCase row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TaskTestCase>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TaskTestCase]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TaskTestCase>> update(
    _i1.Session session,
    List<TaskTestCase> rows, {
    _i1.ColumnSelections<TaskTestCaseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TaskTestCase>(
      rows,
      columns: columns?.call(TaskTestCase.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TaskTestCase]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TaskTestCase> updateRow(
    _i1.Session session,
    TaskTestCase row, {
    _i1.ColumnSelections<TaskTestCaseTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TaskTestCase>(
      row,
      columns: columns?.call(TaskTestCase.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TaskTestCase] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TaskTestCase?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TaskTestCaseUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TaskTestCase>(
      id,
      columnValues: columnValues(TaskTestCase.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TaskTestCase]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TaskTestCase>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TaskTestCaseUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TaskTestCaseTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskTestCaseTable>? orderBy,
    _i1.OrderByListBuilder<TaskTestCaseTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TaskTestCase>(
      columnValues: columnValues(TaskTestCase.t.updateTable),
      where: where(TaskTestCase.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TaskTestCase.t),
      orderByList: orderByList?.call(TaskTestCase.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TaskTestCase]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TaskTestCase>> delete(
    _i1.Session session,
    List<TaskTestCase> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TaskTestCase>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TaskTestCase].
  Future<TaskTestCase> deleteRow(
    _i1.Session session,
    TaskTestCase row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TaskTestCase>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TaskTestCase>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TaskTestCaseTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TaskTestCase>(
      where: where(TaskTestCase.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskTestCaseTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TaskTestCase>(
      where: where?.call(TaskTestCase.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
