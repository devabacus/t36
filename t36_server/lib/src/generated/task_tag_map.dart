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

abstract class TaskTagMap
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  TaskTagMap._({
    this.id,
    required this.taskId,
    required this.tagId,
    required this.userId,
    required this.customerId,
    required this.createdAt,
    required this.lastModified,
    bool? isDeleted,
  }) : isDeleted = isDeleted ?? false,
       _tagTasktagmapsTagId = null,
       _taskTasktagmapsTaskId = null;

  factory TaskTagMap({
    _i1.UuidValue? id,
    required _i1.UuidValue taskId,
    required _i1.UuidValue tagId,
    required int userId,
    required _i1.UuidValue customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
  }) = _TaskTagMapImpl;

  factory TaskTagMap.fromJson(Map<String, dynamic> jsonSerialization) {
    return TaskTagMapImplicit._(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      taskId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['taskId']),
      tagId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['tagId']),
      userId: jsonSerialization['userId'] as int,
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      lastModified: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastModified'],
      ),
      isDeleted: jsonSerialization['isDeleted'] as bool,
      $_tagTasktagmapsTagId: jsonSerialization['_tagTasktagmapsTagId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['_tagTasktagmapsTagId'],
            ),
      $_taskTasktagmapsTaskId:
          jsonSerialization['_taskTasktagmapsTaskId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['_taskTasktagmapsTaskId'],
            ),
    );
  }

  static final t = TaskTagMapTable();

  static const db = TaskTagMapRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue taskId;

  _i1.UuidValue tagId;

  int userId;

  _i1.UuidValue customerId;

  DateTime createdAt;

  DateTime lastModified;

  bool isDeleted;

  final _i1.UuidValue? _tagTasktagmapsTagId;

  final _i1.UuidValue? _taskTasktagmapsTaskId;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [TaskTagMap]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskTagMap copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? taskId,
    _i1.UuidValue? tagId,
    int? userId,
    _i1.UuidValue? customerId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TaskTagMap',
      if (id != null) 'id': id?.toJson(),
      'taskId': taskId.toJson(),
      'tagId': tagId.toJson(),
      'userId': userId,
      'customerId': customerId.toJson(),
      'createdAt': createdAt.toJson(),
      'lastModified': lastModified.toJson(),
      'isDeleted': isDeleted,
      if (_tagTasktagmapsTagId != null)
        '_tagTasktagmapsTagId': _tagTasktagmapsTagId.toJson(),
      if (_taskTasktagmapsTaskId != null)
        '_taskTasktagmapsTaskId': _taskTasktagmapsTaskId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TaskTagMap',
      if (id != null) 'id': id?.toJson(),
      'taskId': taskId.toJson(),
      'tagId': tagId.toJson(),
      'userId': userId,
      'customerId': customerId.toJson(),
      'createdAt': createdAt.toJson(),
      'lastModified': lastModified.toJson(),
      'isDeleted': isDeleted,
    };
  }

  static TaskTagMapInclude include() {
    return TaskTagMapInclude._();
  }

  static TaskTagMapIncludeList includeList({
    _i1.WhereExpressionBuilder<TaskTagMapTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskTagMapTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskTagMapTable>? orderByList,
    TaskTagMapInclude? include,
  }) {
    return TaskTagMapIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TaskTagMap.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TaskTagMap.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskTagMapImpl extends TaskTagMap {
  _TaskTagMapImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue taskId,
    required _i1.UuidValue tagId,
    required int userId,
    required _i1.UuidValue customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
  }) : super._(
         id: id,
         taskId: taskId,
         tagId: tagId,
         userId: userId,
         customerId: customerId,
         createdAt: createdAt,
         lastModified: lastModified,
         isDeleted: isDeleted,
       );

  /// Returns a shallow copy of this [TaskTagMap]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskTagMap copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? taskId,
    _i1.UuidValue? tagId,
    int? userId,
    _i1.UuidValue? customerId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
  }) {
    return TaskTagMapImplicit._(
      id: id is _i1.UuidValue? ? id : this.id,
      taskId: taskId ?? this.taskId,
      tagId: tagId ?? this.tagId,
      userId: userId ?? this.userId,
      customerId: customerId ?? this.customerId,
      createdAt: createdAt ?? this.createdAt,
      lastModified: lastModified ?? this.lastModified,
      isDeleted: isDeleted ?? this.isDeleted,
      $_tagTasktagmapsTagId: this._tagTasktagmapsTagId,
      $_taskTasktagmapsTaskId: this._taskTasktagmapsTaskId,
    );
  }
}

class TaskTagMapImplicit extends _TaskTagMapImpl {
  TaskTagMapImplicit._({
    _i1.UuidValue? id,
    required _i1.UuidValue taskId,
    required _i1.UuidValue tagId,
    required int userId,
    required _i1.UuidValue customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    _i1.UuidValue? $_tagTasktagmapsTagId,
    _i1.UuidValue? $_taskTasktagmapsTaskId,
  }) : _tagTasktagmapsTagId = $_tagTasktagmapsTagId,
       _taskTasktagmapsTaskId = $_taskTasktagmapsTaskId,
       super(
         id: id,
         taskId: taskId,
         tagId: tagId,
         userId: userId,
         customerId: customerId,
         createdAt: createdAt,
         lastModified: lastModified,
         isDeleted: isDeleted,
       );

  factory TaskTagMapImplicit(
    TaskTagMap taskTagMap, {
    _i1.UuidValue? $_tagTasktagmapsTagId,
    _i1.UuidValue? $_taskTasktagmapsTaskId,
  }) {
    return TaskTagMapImplicit._(
      id: taskTagMap.id,
      taskId: taskTagMap.taskId,
      tagId: taskTagMap.tagId,
      userId: taskTagMap.userId,
      customerId: taskTagMap.customerId,
      createdAt: taskTagMap.createdAt,
      lastModified: taskTagMap.lastModified,
      isDeleted: taskTagMap.isDeleted,
      $_tagTasktagmapsTagId: $_tagTasktagmapsTagId,
      $_taskTasktagmapsTaskId: $_taskTasktagmapsTaskId,
    );
  }

  @override
  final _i1.UuidValue? _tagTasktagmapsTagId;

  @override
  final _i1.UuidValue? _taskTasktagmapsTaskId;
}

class TaskTagMapUpdateTable extends _i1.UpdateTable<TaskTagMapTable> {
  TaskTagMapUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> taskId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.taskId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> tagId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.tagId,
        value,
      );

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> customerId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.customerId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastModified(DateTime value) =>
      _i1.ColumnValue(
        table.lastModified,
        value,
      );

  _i1.ColumnValue<bool, bool> isDeleted(bool value) => _i1.ColumnValue(
    table.isDeleted,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> $_tagTasktagmapsTagId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.$_tagTasktagmapsTagId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> $_taskTasktagmapsTaskId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.$_taskTasktagmapsTaskId,
    value,
  );
}

class TaskTagMapTable extends _i1.Table<_i1.UuidValue?> {
  TaskTagMapTable({super.tableRelation}) : super(tableName: 'task_tag_map') {
    updateTable = TaskTagMapUpdateTable(this);
    taskId = _i1.ColumnUuid(
      'taskId',
      this,
    );
    tagId = _i1.ColumnUuid(
      'tagId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    customerId = _i1.ColumnUuid(
      'customerId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    lastModified = _i1.ColumnDateTime(
      'lastModified',
      this,
    );
    isDeleted = _i1.ColumnBool(
      'isDeleted',
      this,
      hasDefault: true,
    );
    $_tagTasktagmapsTagId = _i1.ColumnUuid(
      '_tagTasktagmapsTagId',
      this,
    );
    $_taskTasktagmapsTaskId = _i1.ColumnUuid(
      '_taskTasktagmapsTaskId',
      this,
    );
  }

  late final TaskTagMapUpdateTable updateTable;

  late final _i1.ColumnUuid taskId;

  late final _i1.ColumnUuid tagId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnUuid customerId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime lastModified;

  late final _i1.ColumnBool isDeleted;

  late final _i1.ColumnUuid $_tagTasktagmapsTagId;

  late final _i1.ColumnUuid $_taskTasktagmapsTaskId;

  @override
  List<_i1.Column> get columns => [
    id,
    taskId,
    tagId,
    userId,
    customerId,
    createdAt,
    lastModified,
    isDeleted,
    $_tagTasktagmapsTagId,
    $_taskTasktagmapsTaskId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    taskId,
    tagId,
    userId,
    customerId,
    createdAt,
    lastModified,
    isDeleted,
  ];
}

class TaskTagMapInclude extends _i1.IncludeObject {
  TaskTagMapInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => TaskTagMap.t;
}

class TaskTagMapIncludeList extends _i1.IncludeList {
  TaskTagMapIncludeList._({
    _i1.WhereExpressionBuilder<TaskTagMapTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TaskTagMap.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => TaskTagMap.t;
}

class TaskTagMapRepository {
  const TaskTagMapRepository._();

  /// Returns a list of [TaskTagMap]s matching the given query parameters.
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
  Future<List<TaskTagMap>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskTagMapTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskTagMapTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskTagMapTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TaskTagMap>(
      where: where?.call(TaskTagMap.t),
      orderBy: orderBy?.call(TaskTagMap.t),
      orderByList: orderByList?.call(TaskTagMap.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [TaskTagMap] matching the given query parameters.
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
  Future<TaskTagMap?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskTagMapTable>? where,
    int? offset,
    _i1.OrderByBuilder<TaskTagMapTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TaskTagMapTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TaskTagMap>(
      where: where?.call(TaskTagMap.t),
      orderBy: orderBy?.call(TaskTagMap.t),
      orderByList: orderByList?.call(TaskTagMap.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TaskTagMap] by its [id] or null if no such row exists.
  Future<TaskTagMap?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TaskTagMap>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TaskTagMap]s in the list and returns the inserted rows.
  ///
  /// The returned [TaskTagMap]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TaskTagMap>> insert(
    _i1.Session session,
    List<TaskTagMap> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TaskTagMap>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TaskTagMap] and returns the inserted row.
  ///
  /// The returned [TaskTagMap] will have its `id` field set.
  Future<TaskTagMap> insertRow(
    _i1.Session session,
    TaskTagMap row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TaskTagMap>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TaskTagMap]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TaskTagMap>> update(
    _i1.Session session,
    List<TaskTagMap> rows, {
    _i1.ColumnSelections<TaskTagMapTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TaskTagMap>(
      rows,
      columns: columns?.call(TaskTagMap.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TaskTagMap]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TaskTagMap> updateRow(
    _i1.Session session,
    TaskTagMap row, {
    _i1.ColumnSelections<TaskTagMapTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TaskTagMap>(
      row,
      columns: columns?.call(TaskTagMap.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TaskTagMap] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TaskTagMap?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<TaskTagMapUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TaskTagMap>(
      id,
      columnValues: columnValues(TaskTagMap.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TaskTagMap]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TaskTagMap>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TaskTagMapUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TaskTagMapTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TaskTagMapTable>? orderBy,
    _i1.OrderByListBuilder<TaskTagMapTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TaskTagMap>(
      columnValues: columnValues(TaskTagMap.t.updateTable),
      where: where(TaskTagMap.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TaskTagMap.t),
      orderByList: orderByList?.call(TaskTagMap.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TaskTagMap]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TaskTagMap>> delete(
    _i1.Session session,
    List<TaskTagMap> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TaskTagMap>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TaskTagMap].
  Future<TaskTagMap> deleteRow(
    _i1.Session session,
    TaskTagMap row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TaskTagMap>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TaskTagMap>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TaskTagMapTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TaskTagMap>(
      where: where(TaskTagMap.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TaskTagMapTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TaskTagMap>(
      where: where?.call(TaskTagMap.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
