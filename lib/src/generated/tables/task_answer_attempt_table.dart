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

abstract class TaskAnswerAttempt
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  TaskAnswerAttempt._({
    this.id,
    this.authUserId,
    required this.taskId,
    this.userAnswer,
    required this.isCorrect,
    required this.feedbackType,
    required this.submittedAt,
  });

  factory TaskAnswerAttempt({
    int? id,
    _i1.UuidValue? authUserId,
    required int taskId,
    String? userAnswer,
    required bool isCorrect,
    required String feedbackType,
    required DateTime submittedAt,
  }) = _TaskAnswerAttemptImpl;

  factory TaskAnswerAttempt.fromJson(Map<String, dynamic> jsonSerialization) {
    return TaskAnswerAttempt(
      id: jsonSerialization['id'] as int?,
      authUserId: jsonSerialization['authUserId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['authUserId'],
            ),
      taskId: jsonSerialization['taskId'] as int,
      userAnswer: jsonSerialization['userAnswer'] as String?,
      isCorrect: jsonSerialization['isCorrect'] as bool,
      feedbackType: jsonSerialization['feedbackType'] as String,
      submittedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['submittedAt'],
      ),
    );
  }

  static final t = TaskAnswerAttemptTable();

  static const db = TaskAnswerAttemptRepository._();

  @override
  int? id;

  _i1.UuidValue? authUserId;

  int taskId;

  String? userAnswer;

  bool isCorrect;

  String feedbackType;

  DateTime submittedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [TaskAnswerAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskAnswerAttempt copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    int? taskId,
    String? userAnswer,
    bool? isCorrect,
    String? feedbackType,
    DateTime? submittedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TaskAnswerAttempt',
      if (id != null) 'id': id,
      if (authUserId != null) 'authUserId': authUserId?.toJson(),
      'taskId': taskId,
      if (userAnswer != null) 'userAnswer': userAnswer,
      'isCorrect': isCorrect,
      'feedbackType': feedbackType,
      'submittedAt': submittedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static TaskAnswerAttemptInclude include() {
    return TaskAnswerAttemptInclude._();
  }

  static TaskAnswerAttemptIncludeList includeList({
    _i1.WhereExpressionBuilder<TaskAnswerAttemptTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskAnswerAttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskAnswerAttemptTable>? orderByList,
    TaskAnswerAttemptInclude? include,
  }) {
    return TaskAnswerAttemptIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TaskAnswerAttempt.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TaskAnswerAttempt.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskAnswerAttemptImpl extends TaskAnswerAttempt {
  _TaskAnswerAttemptImpl({
    int? id,
    _i1.UuidValue? authUserId,
    required int taskId,
    String? userAnswer,
    required bool isCorrect,
    required String feedbackType,
    required DateTime submittedAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         taskId: taskId,
         userAnswer: userAnswer,
         isCorrect: isCorrect,
         feedbackType: feedbackType,
         submittedAt: submittedAt,
       );

  /// Returns a shallow copy of this [TaskAnswerAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskAnswerAttempt copyWith({
    Object? id = _Undefined,
    Object? authUserId = _Undefined,
    int? taskId,
    Object? userAnswer = _Undefined,
    bool? isCorrect,
    String? feedbackType,
    DateTime? submittedAt,
  }) {
    return TaskAnswerAttempt(
      id: id is int? ? id : this.id,
      authUserId: authUserId is _i1.UuidValue? ? authUserId : this.authUserId,
      taskId: taskId ?? this.taskId,
      userAnswer: userAnswer is String? ? userAnswer : this.userAnswer,
      isCorrect: isCorrect ?? this.isCorrect,
      feedbackType: feedbackType ?? this.feedbackType,
      submittedAt: submittedAt ?? this.submittedAt,
    );
  }
}

class TaskAnswerAttemptUpdateTable
    extends _i1.UpdateTable<TaskAnswerAttemptTable> {
  TaskAnswerAttemptUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> authUserId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<int, int> taskId(int value) => _i1.ColumnValue(
    table.taskId,
    value,
  );

  _i1.ColumnValue<String, String> userAnswer(String? value) => _i1.ColumnValue(
    table.userAnswer,
    value,
  );

  _i1.ColumnValue<bool, bool> isCorrect(bool value) => _i1.ColumnValue(
    table.isCorrect,
    value,
  );

  _i1.ColumnValue<String, String> feedbackType(String value) => _i1.ColumnValue(
    table.feedbackType,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> submittedAt(DateTime value) =>
      _i1.ColumnValue(
        table.submittedAt,
        value,
      );
}

class TaskAnswerAttemptTable extends _i1.Table<int?> {
  TaskAnswerAttemptTable({super.tableRelation})
    : super(tableName: 'task_answer_attempt') {
    updateTable = TaskAnswerAttemptUpdateTable(this);
    authUserId = _i1.ColumnUuid(
      'authUserId',
      this,
    );
    taskId = _i1.ColumnInt(
      'taskId',
      this,
    );
    userAnswer = _i1.ColumnString(
      'userAnswer',
      this,
    );
    isCorrect = _i1.ColumnBool(
      'isCorrect',
      this,
    );
    feedbackType = _i1.ColumnString(
      'feedbackType',
      this,
    );
    submittedAt = _i1.ColumnDateTime(
      'submittedAt',
      this,
    );
  }

  late final TaskAnswerAttemptUpdateTable updateTable;

  late final _i1.ColumnUuid authUserId;

  late final _i1.ColumnInt taskId;

  late final _i1.ColumnString userAnswer;

  late final _i1.ColumnBool isCorrect;

  late final _i1.ColumnString feedbackType;

  late final _i1.ColumnDateTime submittedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    authUserId,
    taskId,
    userAnswer,
    isCorrect,
    feedbackType,
    submittedAt,
  ];
}

class TaskAnswerAttemptInclude extends _i1.IncludeObject {
  TaskAnswerAttemptInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => TaskAnswerAttempt.t;
}

class TaskAnswerAttemptIncludeList extends _i1.IncludeList {
  TaskAnswerAttemptIncludeList._({
    _i1.WhereExpressionBuilder<TaskAnswerAttemptTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TaskAnswerAttempt.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TaskAnswerAttempt.t;
}

class TaskAnswerAttemptRepository {
  const TaskAnswerAttemptRepository._();

  /// Returns a list of [TaskAnswerAttempt]s matching the given query parameters.
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
  Future<List<TaskAnswerAttempt>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskAnswerAttemptTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskAnswerAttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskAnswerAttemptTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TaskAnswerAttempt>(
      where: where?.call(TaskAnswerAttempt.t),
      orderBy: orderBy?.call(TaskAnswerAttempt.t),
      orderByList: orderByList?.call(TaskAnswerAttempt.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [TaskAnswerAttempt] matching the given query parameters.
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
  Future<TaskAnswerAttempt?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskAnswerAttemptTable>? where,
    int? offset,
    _i1.OrderByBuilder<TaskAnswerAttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskAnswerAttemptTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TaskAnswerAttempt>(
      where: where?.call(TaskAnswerAttempt.t),
      orderBy: orderBy?.call(TaskAnswerAttempt.t),
      orderByList: orderByList?.call(TaskAnswerAttempt.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TaskAnswerAttempt] by its [id] or null if no such row exists.
  Future<TaskAnswerAttempt?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TaskAnswerAttempt>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TaskAnswerAttempt]s in the list and returns the inserted rows.
  ///
  /// The returned [TaskAnswerAttempt]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TaskAnswerAttempt>> insert(
    _i1.Session session,
    List<TaskAnswerAttempt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TaskAnswerAttempt>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TaskAnswerAttempt] and returns the inserted row.
  ///
  /// The returned [TaskAnswerAttempt] will have its `id` field set.
  Future<TaskAnswerAttempt> insertRow(
    _i1.Session session,
    TaskAnswerAttempt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TaskAnswerAttempt>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TaskAnswerAttempt]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TaskAnswerAttempt>> update(
    _i1.Session session,
    List<TaskAnswerAttempt> rows, {
    _i1.ColumnSelections<TaskAnswerAttemptTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TaskAnswerAttempt>(
      rows,
      columns: columns?.call(TaskAnswerAttempt.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TaskAnswerAttempt]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TaskAnswerAttempt> updateRow(
    _i1.Session session,
    TaskAnswerAttempt row, {
    _i1.ColumnSelections<TaskAnswerAttemptTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TaskAnswerAttempt>(
      row,
      columns: columns?.call(TaskAnswerAttempt.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TaskAnswerAttempt] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TaskAnswerAttempt?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TaskAnswerAttemptUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TaskAnswerAttempt>(
      id,
      columnValues: columnValues(TaskAnswerAttempt.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TaskAnswerAttempt]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TaskAnswerAttempt>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TaskAnswerAttemptUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<TaskAnswerAttemptTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskAnswerAttemptTable>? orderBy,
    _i1.OrderByListBuilder<TaskAnswerAttemptTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TaskAnswerAttempt>(
      columnValues: columnValues(TaskAnswerAttempt.t.updateTable),
      where: where(TaskAnswerAttempt.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TaskAnswerAttempt.t),
      orderByList: orderByList?.call(TaskAnswerAttempt.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TaskAnswerAttempt]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TaskAnswerAttempt>> delete(
    _i1.Session session,
    List<TaskAnswerAttempt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TaskAnswerAttempt>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TaskAnswerAttempt].
  Future<TaskAnswerAttempt> deleteRow(
    _i1.Session session,
    TaskAnswerAttempt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TaskAnswerAttempt>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TaskAnswerAttempt>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TaskAnswerAttemptTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TaskAnswerAttempt>(
      where: where(TaskAnswerAttempt.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskAnswerAttemptTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TaskAnswerAttempt>(
      where: where?.call(TaskAnswerAttempt.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
