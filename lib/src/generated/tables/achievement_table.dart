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

abstract class Achievement
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Achievement._({
    this.id,
    required this.title,
    required this.description,
    this.iconUrl,
    required this.pointsReward,
    this.relatedCourseId,
    required this.conditionType,
    this.conditionValue,
  });

  factory Achievement({
    int? id,
    required String title,
    required String description,
    String? iconUrl,
    required int pointsReward,
    int? relatedCourseId,
    required String conditionType,
    String? conditionValue,
  }) = _AchievementImpl;

  factory Achievement.fromJson(Map<String, dynamic> jsonSerialization) {
    return Achievement(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      iconUrl: jsonSerialization['iconUrl'] as String?,
      pointsReward: jsonSerialization['pointsReward'] as int,
      relatedCourseId: jsonSerialization['relatedCourseId'] as int?,
      conditionType: jsonSerialization['conditionType'] as String,
      conditionValue: jsonSerialization['conditionValue'] as String?,
    );
  }

  static final t = AchievementTable();

  static const db = AchievementRepository._();

  @override
  int? id;

  String title;

  String description;

  String? iconUrl;

  int pointsReward;

  int? relatedCourseId;

  String conditionType;

  String? conditionValue;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Achievement]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Achievement copyWith({
    int? id,
    String? title,
    String? description,
    String? iconUrl,
    int? pointsReward,
    int? relatedCourseId,
    String? conditionType,
    String? conditionValue,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Achievement',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      'pointsReward': pointsReward,
      if (relatedCourseId != null) 'relatedCourseId': relatedCourseId,
      'conditionType': conditionType,
      if (conditionValue != null) 'conditionValue': conditionValue,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {};
  }

  static AchievementInclude include() {
    return AchievementInclude._();
  }

  static AchievementIncludeList includeList({
    _i1.WhereExpressionBuilder<AchievementTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AchievementTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AchievementTable>? orderByList,
    AchievementInclude? include,
  }) {
    return AchievementIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Achievement.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Achievement.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AchievementImpl extends Achievement {
  _AchievementImpl({
    int? id,
    required String title,
    required String description,
    String? iconUrl,
    required int pointsReward,
    int? relatedCourseId,
    required String conditionType,
    String? conditionValue,
  }) : super._(
         id: id,
         title: title,
         description: description,
         iconUrl: iconUrl,
         pointsReward: pointsReward,
         relatedCourseId: relatedCourseId,
         conditionType: conditionType,
         conditionValue: conditionValue,
       );

  /// Returns a shallow copy of this [Achievement]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Achievement copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    Object? iconUrl = _Undefined,
    int? pointsReward,
    Object? relatedCourseId = _Undefined,
    String? conditionType,
    Object? conditionValue = _Undefined,
  }) {
    return Achievement(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      iconUrl: iconUrl is String? ? iconUrl : this.iconUrl,
      pointsReward: pointsReward ?? this.pointsReward,
      relatedCourseId: relatedCourseId is int?
          ? relatedCourseId
          : this.relatedCourseId,
      conditionType: conditionType ?? this.conditionType,
      conditionValue: conditionValue is String?
          ? conditionValue
          : this.conditionValue,
    );
  }
}

class AchievementUpdateTable extends _i1.UpdateTable<AchievementTable> {
  AchievementUpdateTable(super.table);

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> iconUrl(String? value) => _i1.ColumnValue(
    table.iconUrl,
    value,
  );

  _i1.ColumnValue<int, int> pointsReward(int value) => _i1.ColumnValue(
    table.pointsReward,
    value,
  );

  _i1.ColumnValue<int, int> relatedCourseId(int? value) => _i1.ColumnValue(
    table.relatedCourseId,
    value,
  );

  _i1.ColumnValue<String, String> conditionType(String value) =>
      _i1.ColumnValue(
        table.conditionType,
        value,
      );

  _i1.ColumnValue<String, String> conditionValue(String? value) =>
      _i1.ColumnValue(
        table.conditionValue,
        value,
      );
}

class AchievementTable extends _i1.Table<int?> {
  AchievementTable({super.tableRelation}) : super(tableName: 'achievement') {
    updateTable = AchievementUpdateTable(this);
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    iconUrl = _i1.ColumnString(
      'iconUrl',
      this,
    );
    pointsReward = _i1.ColumnInt(
      'pointsReward',
      this,
    );
    relatedCourseId = _i1.ColumnInt(
      'relatedCourseId',
      this,
    );
    conditionType = _i1.ColumnString(
      'conditionType',
      this,
    );
    conditionValue = _i1.ColumnString(
      'conditionValue',
      this,
    );
  }

  late final AchievementUpdateTable updateTable;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnString iconUrl;

  late final _i1.ColumnInt pointsReward;

  late final _i1.ColumnInt relatedCourseId;

  late final _i1.ColumnString conditionType;

  late final _i1.ColumnString conditionValue;

  @override
  List<_i1.Column> get columns => [
    id,
    title,
    description,
    iconUrl,
    pointsReward,
    relatedCourseId,
    conditionType,
    conditionValue,
  ];
}

class AchievementInclude extends _i1.IncludeObject {
  AchievementInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Achievement.t;
}

class AchievementIncludeList extends _i1.IncludeList {
  AchievementIncludeList._({
    _i1.WhereExpressionBuilder<AchievementTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Achievement.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Achievement.t;
}

class AchievementRepository {
  const AchievementRepository._();

  /// Returns a list of [Achievement]s matching the given query parameters.
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
  Future<List<Achievement>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AchievementTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AchievementTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AchievementTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Achievement>(
      where: where?.call(Achievement.t),
      orderBy: orderBy?.call(Achievement.t),
      orderByList: orderByList?.call(Achievement.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Achievement] matching the given query parameters.
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
  Future<Achievement?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AchievementTable>? where,
    int? offset,
    _i1.OrderByBuilder<AchievementTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AchievementTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Achievement>(
      where: where?.call(Achievement.t),
      orderBy: orderBy?.call(Achievement.t),
      orderByList: orderByList?.call(Achievement.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Achievement] by its [id] or null if no such row exists.
  Future<Achievement?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Achievement>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Achievement]s in the list and returns the inserted rows.
  ///
  /// The returned [Achievement]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Achievement>> insert(
    _i1.Session session,
    List<Achievement> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Achievement>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Achievement] and returns the inserted row.
  ///
  /// The returned [Achievement] will have its `id` field set.
  Future<Achievement> insertRow(
    _i1.Session session,
    Achievement row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Achievement>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Achievement]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Achievement>> update(
    _i1.Session session,
    List<Achievement> rows, {
    _i1.ColumnSelections<AchievementTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Achievement>(
      rows,
      columns: columns?.call(Achievement.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Achievement]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Achievement> updateRow(
    _i1.Session session,
    Achievement row, {
    _i1.ColumnSelections<AchievementTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Achievement>(
      row,
      columns: columns?.call(Achievement.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Achievement] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Achievement?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AchievementUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Achievement>(
      id,
      columnValues: columnValues(Achievement.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Achievement]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Achievement>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AchievementUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AchievementTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AchievementTable>? orderBy,
    _i1.OrderByListBuilder<AchievementTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Achievement>(
      columnValues: columnValues(Achievement.t.updateTable),
      where: where(Achievement.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Achievement.t),
      orderByList: orderByList?.call(Achievement.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Achievement]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Achievement>> delete(
    _i1.Session session,
    List<Achievement> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Achievement>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Achievement].
  Future<Achievement> deleteRow(
    _i1.Session session,
    Achievement row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Achievement>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Achievement>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AchievementTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Achievement>(
      where: where(Achievement.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AchievementTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Achievement>(
      where: where?.call(Achievement.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
