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

abstract class Task implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Task._({
    this.id,
    required this.lessonId,
    required this.taskType,
    required this.questionText,
    required this.correctAnswer,
    this.optionsJson,
    this.codeTemplate,
    this.testCasesJson,
    this.programmingLanguage,
    required this.difficultyLevel,
    required this.xpValue,
    required this.orderIndex,
    this.fallbackHint,
    this.fallbackExplanation,
    required this.topic,
    required this.createdAt,
  });

  factory Task({
    int? id,
    required int lessonId,
    required String taskType,
    required String questionText,
    required String correctAnswer,
    String? optionsJson,
    String? codeTemplate,
    String? testCasesJson,
    String? programmingLanguage,
    required int difficultyLevel,
    required int xpValue,
    required int orderIndex,
    String? fallbackHint,
    String? fallbackExplanation,
    required String topic,
    required DateTime createdAt,
  }) = _TaskImpl;

  factory Task.fromJson(Map<String, dynamic> jsonSerialization) {
    return Task(
      id: jsonSerialization['id'] as int?,
      lessonId: jsonSerialization['lessonId'] as int,
      taskType: jsonSerialization['taskType'] as String,
      questionText: jsonSerialization['questionText'] as String,
      correctAnswer: jsonSerialization['correctAnswer'] as String,
      optionsJson: jsonSerialization['optionsJson'] as String?,
      codeTemplate: jsonSerialization['codeTemplate'] as String?,
      testCasesJson: jsonSerialization['testCasesJson'] as String?,
      programmingLanguage: jsonSerialization['programmingLanguage'] as String?,
      difficultyLevel: jsonSerialization['difficultyLevel'] as int,
      xpValue: jsonSerialization['xpValue'] as int,
      orderIndex: jsonSerialization['orderIndex'] as int,
      fallbackHint: jsonSerialization['fallbackHint'] as String?,
      fallbackExplanation: jsonSerialization['fallbackExplanation'] as String?,
      topic: jsonSerialization['topic'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = TaskTable();

  static const db = TaskRepository._();

  @override
  int? id;

  int lessonId;

  String taskType;

  String questionText;

  String correctAnswer;

  String? optionsJson;

  String? codeTemplate;

  String? testCasesJson;

  String? programmingLanguage;

  int difficultyLevel;

  int xpValue;

  int orderIndex;

  String? fallbackHint;

  String? fallbackExplanation;

  String topic;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Task]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Task copyWith({
    int? id,
    int? lessonId,
    String? taskType,
    String? questionText,
    String? correctAnswer,
    String? optionsJson,
    String? codeTemplate,
    String? testCasesJson,
    String? programmingLanguage,
    int? difficultyLevel,
    int? xpValue,
    int? orderIndex,
    String? fallbackHint,
    String? fallbackExplanation,
    String? topic,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Task',
      if (id != null) 'id': id,
      'lessonId': lessonId,
      'taskType': taskType,
      'questionText': questionText,
      'correctAnswer': correctAnswer,
      if (optionsJson != null) 'optionsJson': optionsJson,
      if (codeTemplate != null) 'codeTemplate': codeTemplate,
      if (testCasesJson != null) 'testCasesJson': testCasesJson,
      if (programmingLanguage != null)
        'programmingLanguage': programmingLanguage,
      'difficultyLevel': difficultyLevel,
      'xpValue': xpValue,
      'orderIndex': orderIndex,
      if (fallbackHint != null) 'fallbackHint': fallbackHint,
      if (fallbackExplanation != null)
        'fallbackExplanation': fallbackExplanation,
      'topic': topic,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static TaskInclude include() {
    return TaskInclude._();
  }

  static TaskIncludeList includeList({
    _i1.WhereExpressionBuilder<TaskTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskTable>? orderByList,
    TaskInclude? include,
  }) {
    return TaskIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Task.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Task.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskImpl extends Task {
  _TaskImpl({
    int? id,
    required int lessonId,
    required String taskType,
    required String questionText,
    required String correctAnswer,
    String? optionsJson,
    String? codeTemplate,
    String? testCasesJson,
    String? programmingLanguage,
    required int difficultyLevel,
    required int xpValue,
    required int orderIndex,
    String? fallbackHint,
    String? fallbackExplanation,
    required String topic,
    required DateTime createdAt,
  }) : super._(
         id: id,
         lessonId: lessonId,
         taskType: taskType,
         questionText: questionText,
         correctAnswer: correctAnswer,
         optionsJson: optionsJson,
         codeTemplate: codeTemplate,
         testCasesJson: testCasesJson,
         programmingLanguage: programmingLanguage,
         difficultyLevel: difficultyLevel,
         xpValue: xpValue,
         orderIndex: orderIndex,
         fallbackHint: fallbackHint,
         fallbackExplanation: fallbackExplanation,
         topic: topic,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Task]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Task copyWith({
    Object? id = _Undefined,
    int? lessonId,
    String? taskType,
    String? questionText,
    String? correctAnswer,
    Object? optionsJson = _Undefined,
    Object? codeTemplate = _Undefined,
    Object? testCasesJson = _Undefined,
    Object? programmingLanguage = _Undefined,
    int? difficultyLevel,
    int? xpValue,
    int? orderIndex,
    Object? fallbackHint = _Undefined,
    Object? fallbackExplanation = _Undefined,
    String? topic,
    DateTime? createdAt,
  }) {
    return Task(
      id: id is int? ? id : this.id,
      lessonId: lessonId ?? this.lessonId,
      taskType: taskType ?? this.taskType,
      questionText: questionText ?? this.questionText,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      optionsJson: optionsJson is String? ? optionsJson : this.optionsJson,
      codeTemplate: codeTemplate is String? ? codeTemplate : this.codeTemplate,
      testCasesJson: testCasesJson is String?
          ? testCasesJson
          : this.testCasesJson,
      programmingLanguage: programmingLanguage is String?
          ? programmingLanguage
          : this.programmingLanguage,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      xpValue: xpValue ?? this.xpValue,
      orderIndex: orderIndex ?? this.orderIndex,
      fallbackHint: fallbackHint is String? ? fallbackHint : this.fallbackHint,
      fallbackExplanation: fallbackExplanation is String?
          ? fallbackExplanation
          : this.fallbackExplanation,
      topic: topic ?? this.topic,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class TaskUpdateTable extends _i1.UpdateTable<TaskTable> {
  TaskUpdateTable(super.table);

  _i1.ColumnValue<int, int> lessonId(int value) => _i1.ColumnValue(
    table.lessonId,
    value,
  );

  _i1.ColumnValue<String, String> taskType(String value) => _i1.ColumnValue(
    table.taskType,
    value,
  );

  _i1.ColumnValue<String, String> questionText(String value) => _i1.ColumnValue(
    table.questionText,
    value,
  );

  _i1.ColumnValue<String, String> correctAnswer(String value) =>
      _i1.ColumnValue(
        table.correctAnswer,
        value,
      );

  _i1.ColumnValue<String, String> optionsJson(String? value) => _i1.ColumnValue(
    table.optionsJson,
    value,
  );

  _i1.ColumnValue<String, String> codeTemplate(String? value) =>
      _i1.ColumnValue(
        table.codeTemplate,
        value,
      );

  _i1.ColumnValue<String, String> testCasesJson(String? value) =>
      _i1.ColumnValue(
        table.testCasesJson,
        value,
      );

  _i1.ColumnValue<String, String> programmingLanguage(String? value) =>
      _i1.ColumnValue(
        table.programmingLanguage,
        value,
      );

  _i1.ColumnValue<int, int> difficultyLevel(int value) => _i1.ColumnValue(
    table.difficultyLevel,
    value,
  );

  _i1.ColumnValue<int, int> xpValue(int value) => _i1.ColumnValue(
    table.xpValue,
    value,
  );

  _i1.ColumnValue<int, int> orderIndex(int value) => _i1.ColumnValue(
    table.orderIndex,
    value,
  );

  _i1.ColumnValue<String, String> fallbackHint(String? value) =>
      _i1.ColumnValue(
        table.fallbackHint,
        value,
      );

  _i1.ColumnValue<String, String> fallbackExplanation(String? value) =>
      _i1.ColumnValue(
        table.fallbackExplanation,
        value,
      );

  _i1.ColumnValue<String, String> topic(String value) => _i1.ColumnValue(
    table.topic,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class TaskTable extends _i1.Table<int?> {
  TaskTable({super.tableRelation}) : super(tableName: 'task') {
    updateTable = TaskUpdateTable(this);
    lessonId = _i1.ColumnInt(
      'lessonId',
      this,
    );
    taskType = _i1.ColumnString(
      'taskType',
      this,
    );
    questionText = _i1.ColumnString(
      'questionText',
      this,
    );
    correctAnswer = _i1.ColumnString(
      'correctAnswer',
      this,
    );
    optionsJson = _i1.ColumnString(
      'optionsJson',
      this,
    );
    codeTemplate = _i1.ColumnString(
      'codeTemplate',
      this,
    );
    testCasesJson = _i1.ColumnString(
      'testCasesJson',
      this,
    );
    programmingLanguage = _i1.ColumnString(
      'programmingLanguage',
      this,
    );
    difficultyLevel = _i1.ColumnInt(
      'difficultyLevel',
      this,
    );
    xpValue = _i1.ColumnInt(
      'xpValue',
      this,
    );
    orderIndex = _i1.ColumnInt(
      'orderIndex',
      this,
    );
    fallbackHint = _i1.ColumnString(
      'fallbackHint',
      this,
    );
    fallbackExplanation = _i1.ColumnString(
      'fallbackExplanation',
      this,
    );
    topic = _i1.ColumnString(
      'topic',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final TaskUpdateTable updateTable;

  late final _i1.ColumnInt lessonId;

  late final _i1.ColumnString taskType;

  late final _i1.ColumnString questionText;

  late final _i1.ColumnString correctAnswer;

  late final _i1.ColumnString optionsJson;

  late final _i1.ColumnString codeTemplate;

  late final _i1.ColumnString testCasesJson;

  late final _i1.ColumnString programmingLanguage;

  late final _i1.ColumnInt difficultyLevel;

  late final _i1.ColumnInt xpValue;

  late final _i1.ColumnInt orderIndex;

  late final _i1.ColumnString fallbackHint;

  late final _i1.ColumnString fallbackExplanation;

  late final _i1.ColumnString topic;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    lessonId,
    taskType,
    questionText,
    correctAnswer,
    optionsJson,
    codeTemplate,
    testCasesJson,
    programmingLanguage,
    difficultyLevel,
    xpValue,
    orderIndex,
    fallbackHint,
    fallbackExplanation,
    topic,
    createdAt,
  ];
}

class TaskInclude extends _i1.IncludeObject {
  TaskInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Task.t;
}

class TaskIncludeList extends _i1.IncludeList {
  TaskIncludeList._({
    _i1.WhereExpressionBuilder<TaskTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Task.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Task.t;
}

class TaskRepository {
  const TaskRepository._();

  /// Returns a list of [Task]s matching the given query parameters.
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
  Future<List<Task>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Task>(
      where: where?.call(Task.t),
      orderBy: orderBy?.call(Task.t),
      orderByList: orderByList?.call(Task.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Task] matching the given query parameters.
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
  Future<Task?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskTable>? where,
    int? offset,
    _i1.OrderByBuilder<TaskTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Task>(
      where: where?.call(Task.t),
      orderBy: orderBy?.call(Task.t),
      orderByList: orderByList?.call(Task.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Task] by its [id] or null if no such row exists.
  Future<Task?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Task>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Task]s in the list and returns the inserted rows.
  ///
  /// The returned [Task]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Task>> insert(
    _i1.Session session,
    List<Task> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Task>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Task] and returns the inserted row.
  ///
  /// The returned [Task] will have its `id` field set.
  Future<Task> insertRow(
    _i1.Session session,
    Task row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Task>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Task]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Task>> update(
    _i1.Session session,
    List<Task> rows, {
    _i1.ColumnSelections<TaskTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Task>(
      rows,
      columns: columns?.call(Task.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Task]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Task> updateRow(
    _i1.Session session,
    Task row, {
    _i1.ColumnSelections<TaskTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Task>(
      row,
      columns: columns?.call(Task.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Task] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Task?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TaskUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Task>(
      id,
      columnValues: columnValues(Task.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Task]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Task>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TaskUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TaskTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskTable>? orderBy,
    _i1.OrderByListBuilder<TaskTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Task>(
      columnValues: columnValues(Task.t.updateTable),
      where: where(Task.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Task.t),
      orderByList: orderByList?.call(Task.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Task]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Task>> delete(
    _i1.Session session,
    List<Task> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Task>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Task].
  Future<Task> deleteRow(
    _i1.Session session,
    Task row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Task>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Task>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TaskTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Task>(
      where: where(Task.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Task>(
      where: where?.call(Task.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
