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

abstract class Module implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Module._({
    this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.orderIndex,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Module({
    int? id,
    required int courseId,
    required String title,
    required String description,
    required int orderIndex,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ModuleImpl;

  factory Module.fromJson(Map<String, dynamic> jsonSerialization) {
    return Module(
      id: jsonSerialization['id'] as int?,
      courseId: jsonSerialization['courseId'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      orderIndex: jsonSerialization['orderIndex'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = ModuleTable();

  static const db = ModuleRepository._();

  @override
  int? id;

  int courseId;

  String title;

  String description;

  int orderIndex;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Module]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Module copyWith({
    int? id,
    int? courseId,
    String? title,
    String? description,
    int? orderIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Module',
      if (id != null) 'id': id,
      'courseId': courseId,
      'title': title,
      'description': description,
      'orderIndex': orderIndex,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static ModuleInclude include() {
    return ModuleInclude._();
  }

  static ModuleIncludeList includeList({
    _i1.WhereExpressionBuilder<ModuleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ModuleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ModuleTable>? orderByList,
    ModuleInclude? include,
  }) {
    return ModuleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Module.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Module.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ModuleImpl extends Module {
  _ModuleImpl({
    int? id,
    required int courseId,
    required String title,
    required String description,
    required int orderIndex,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         courseId: courseId,
         title: title,
         description: description,
         orderIndex: orderIndex,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Module]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Module copyWith({
    Object? id = _Undefined,
    int? courseId,
    String? title,
    String? description,
    int? orderIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Module(
      id: id is int? ? id : this.id,
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      description: description ?? this.description,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ModuleUpdateTable extends _i1.UpdateTable<ModuleTable> {
  ModuleUpdateTable(super.table);

  _i1.ColumnValue<int, int> courseId(int value) => _i1.ColumnValue(
    table.courseId,
    value,
  );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<int, int> orderIndex(int value) => _i1.ColumnValue(
    table.orderIndex,
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

class ModuleTable extends _i1.Table<int?> {
  ModuleTable({super.tableRelation}) : super(tableName: 'module') {
    updateTable = ModuleUpdateTable(this);
    courseId = _i1.ColumnInt(
      'courseId',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    orderIndex = _i1.ColumnInt(
      'orderIndex',
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

  late final ModuleUpdateTable updateTable;

  late final _i1.ColumnInt courseId;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt orderIndex;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    courseId,
    title,
    description,
    orderIndex,
    createdAt,
    updatedAt,
  ];
}

class ModuleInclude extends _i1.IncludeObject {
  ModuleInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Module.t;
}

class ModuleIncludeList extends _i1.IncludeList {
  ModuleIncludeList._({
    _i1.WhereExpressionBuilder<ModuleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Module.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Module.t;
}

class ModuleRepository {
  const ModuleRepository._();

  /// Returns a list of [Module]s matching the given query parameters.
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
  Future<List<Module>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ModuleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ModuleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ModuleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Module>(
      where: where?.call(Module.t),
      orderBy: orderBy?.call(Module.t),
      orderByList: orderByList?.call(Module.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Module] matching the given query parameters.
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
  Future<Module?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ModuleTable>? where,
    int? offset,
    _i1.OrderByBuilder<ModuleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ModuleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Module>(
      where: where?.call(Module.t),
      orderBy: orderBy?.call(Module.t),
      orderByList: orderByList?.call(Module.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Module] by its [id] or null if no such row exists.
  Future<Module?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Module>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Module]s in the list and returns the inserted rows.
  ///
  /// The returned [Module]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Module>> insert(
    _i1.Session session,
    List<Module> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Module>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Module] and returns the inserted row.
  ///
  /// The returned [Module] will have its `id` field set.
  Future<Module> insertRow(
    _i1.Session session,
    Module row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Module>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Module]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Module>> update(
    _i1.Session session,
    List<Module> rows, {
    _i1.ColumnSelections<ModuleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Module>(
      rows,
      columns: columns?.call(Module.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Module]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Module> updateRow(
    _i1.Session session,
    Module row, {
    _i1.ColumnSelections<ModuleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Module>(
      row,
      columns: columns?.call(Module.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Module] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Module?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ModuleUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Module>(
      id,
      columnValues: columnValues(Module.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Module]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Module>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ModuleUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ModuleTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ModuleTable>? orderBy,
    _i1.OrderByListBuilder<ModuleTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Module>(
      columnValues: columnValues(Module.t.updateTable),
      where: where(Module.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Module.t),
      orderByList: orderByList?.call(Module.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Module]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Module>> delete(
    _i1.Session session,
    List<Module> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Module>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Module].
  Future<Module> deleteRow(
    _i1.Session session,
    Module row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Module>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Module>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ModuleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Module>(
      where: where(Module.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ModuleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Module>(
      where: where?.call(Module.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
