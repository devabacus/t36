/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'category.dart' as _i2;
import 'task_tag_map.dart' as _i3;
import 'package:t36_server/src/generated/protocol.dart' as _i4;

abstract class Task
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  Task._({
    this.id,
    required this.userId,
    required this.customerId,
    required this.createdAt,
    required this.lastModified,
    bool? isDeleted,
    required this.title,
    this.categoryId,
    this.category,
    this.taskTagMaps,
  }) : isDeleted = isDeleted ?? false;

  factory Task({
    _i1.UuidValue? id,
    required int userId,
    required _i1.UuidValue customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    required String title,
    _i1.UuidValue? categoryId,
    _i2.Category? category,
    List<_i3.TaskTagMap>? taskTagMaps,
  }) = _TaskImpl;

  factory Task.fromJson(Map<String, dynamic> jsonSerialization) {
    return Task(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
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
      title: jsonSerialization['title'] as String,
      categoryId: jsonSerialization['categoryId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['categoryId'],
            ),
      category: jsonSerialization['category'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Category>(
              jsonSerialization['category'],
            ),
      taskTagMaps: jsonSerialization['taskTagMaps'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.TaskTagMap>>(
              jsonSerialization['taskTagMaps'],
            ),
    );
  }

  static final t = TaskTable();

  static const db = TaskRepository._();

  @override
  _i1.UuidValue? id;

  int userId;

  _i1.UuidValue customerId;

  DateTime createdAt;

  DateTime lastModified;

  bool isDeleted;

  String title;

  _i1.UuidValue? categoryId;

  _i2.Category? category;

  List<_i3.TaskTagMap>? taskTagMaps;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Task]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Task copyWith({
    _i1.UuidValue? id,
    int? userId,
    _i1.UuidValue? customerId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
    String? title,
    _i1.UuidValue? categoryId,
    _i2.Category? category,
    List<_i3.TaskTagMap>? taskTagMaps,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Task',
      if (id != null) 'id': id?.toJson(),
      'userId': userId,
      'customerId': customerId.toJson(),
      'createdAt': createdAt.toJson(),
      'lastModified': lastModified.toJson(),
      'isDeleted': isDeleted,
      'title': title,
      if (categoryId != null) 'categoryId': categoryId?.toJson(),
      if (category != null) 'category': category?.toJson(),
      if (taskTagMaps != null)
        'taskTagMaps': taskTagMaps?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Task',
      if (id != null) 'id': id?.toJson(),
      'userId': userId,
      'customerId': customerId.toJson(),
      'createdAt': createdAt.toJson(),
      'lastModified': lastModified.toJson(),
      'isDeleted': isDeleted,
      'title': title,
      if (categoryId != null) 'categoryId': categoryId?.toJson(),
      if (taskTagMaps != null)
        'taskTagMaps': taskTagMaps?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static TaskInclude include({_i3.TaskTagMapIncludeList? taskTagMaps}) {
    return TaskInclude._(taskTagMaps: taskTagMaps);
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
    _i1.UuidValue? id,
    required int userId,
    required _i1.UuidValue customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    required String title,
    _i1.UuidValue? categoryId,
    _i2.Category? category,
    List<_i3.TaskTagMap>? taskTagMaps,
  }) : super._(
         id: id,
         userId: userId,
         customerId: customerId,
         createdAt: createdAt,
         lastModified: lastModified,
         isDeleted: isDeleted,
         title: title,
         categoryId: categoryId,
         category: category,
         taskTagMaps: taskTagMaps,
       );

  /// Returns a shallow copy of this [Task]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Task copyWith({
    Object? id = _Undefined,
    int? userId,
    _i1.UuidValue? customerId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
    String? title,
    Object? categoryId = _Undefined,
    Object? category = _Undefined,
    Object? taskTagMaps = _Undefined,
  }) {
    return Task(
      id: id is _i1.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      customerId: customerId ?? this.customerId,
      createdAt: createdAt ?? this.createdAt,
      lastModified: lastModified ?? this.lastModified,
      isDeleted: isDeleted ?? this.isDeleted,
      title: title ?? this.title,
      categoryId: categoryId is _i1.UuidValue? ? categoryId : this.categoryId,
      category: category is _i2.Category?
          ? category
          : this.category?.copyWith(),
      taskTagMaps: taskTagMaps is List<_i3.TaskTagMap>?
          ? taskTagMaps
          : this.taskTagMaps?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class TaskUpdateTable extends _i1.UpdateTable<TaskTable> {
  TaskUpdateTable(super.table);

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

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> categoryId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.categoryId,
    value,
  );

  _i1.ColumnValue<_i2.Category, _i2.Category> category(_i2.Category? value) =>
      _i1.ColumnValue(
        table.category,
        value,
      );
}

class TaskTable extends _i1.Table<_i1.UuidValue?> {
  TaskTable({super.tableRelation}) : super(tableName: 'task') {
    updateTable = TaskUpdateTable(this);
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
    title = _i1.ColumnString(
      'title',
      this,
    );
    categoryId = _i1.ColumnUuid(
      'categoryId',
      this,
    );
    category = _i1.ColumnSerializable<_i2.Category>(
      'category',
      this,
    );
  }

  late final TaskUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnUuid customerId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime lastModified;

  late final _i1.ColumnBool isDeleted;

  late final _i1.ColumnString title;

  late final _i1.ColumnUuid categoryId;

  late final _i1.ColumnSerializable<_i2.Category> category;

  _i3.TaskTagMapTable? ___taskTagMaps;

  _i1.ManyRelation<_i3.TaskTagMapTable>? _taskTagMaps;

  _i3.TaskTagMapTable get __taskTagMaps {
    if (___taskTagMaps != null) return ___taskTagMaps!;
    ___taskTagMaps = _i1.createRelationTable(
      relationFieldName: '__taskTagMaps',
      field: Task.t.id,
      foreignField: _i3.TaskTagMap.t.$_taskTasktagmapsTaskId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TaskTagMapTable(tableRelation: foreignTableRelation),
    );
    return ___taskTagMaps!;
  }

  _i1.ManyRelation<_i3.TaskTagMapTable> get taskTagMaps {
    if (_taskTagMaps != null) return _taskTagMaps!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'taskTagMaps',
      field: Task.t.id,
      foreignField: _i3.TaskTagMap.t.$_taskTasktagmapsTaskId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TaskTagMapTable(tableRelation: foreignTableRelation),
    );
    _taskTagMaps = _i1.ManyRelation<_i3.TaskTagMapTable>(
      tableWithRelations: relationTable,
      table: _i3.TaskTagMapTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _taskTagMaps!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    customerId,
    createdAt,
    lastModified,
    isDeleted,
    title,
    categoryId,
    category,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'taskTagMaps') {
      return __taskTagMaps;
    }
    return null;
  }
}

class TaskInclude extends _i1.IncludeObject {
  TaskInclude._({_i3.TaskTagMapIncludeList? taskTagMaps}) {
    _taskTagMaps = taskTagMaps;
  }

  _i3.TaskTagMapIncludeList? _taskTagMaps;

  @override
  Map<String, _i1.Include?> get includes => {'taskTagMaps': _taskTagMaps};

  @override
  _i1.Table<_i1.UuidValue?> get table => Task.t;
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
  _i1.Table<_i1.UuidValue?> get table => Task.t;
}

class TaskRepository {
  const TaskRepository._();

  final attach = const TaskAttachRepository._();

  final attachRow = const TaskAttachRowRepository._();

  final detach = const TaskDetachRepository._();

  final detachRow = const TaskDetachRowRepository._();

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
    TaskInclude? include,
  }) async {
    return session.db.find<Task>(
      where: where?.call(Task.t),
      orderBy: orderBy?.call(Task.t),
      orderByList: orderByList?.call(Task.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
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
    TaskInclude? include,
  }) async {
    return session.db.findFirstRow<Task>(
      where: where?.call(Task.t),
      orderBy: orderBy?.call(Task.t),
      orderByList: orderByList?.call(Task.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Task] by its [id] or null if no such row exists.
  Future<Task?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    TaskInclude? include,
  }) async {
    return session.db.findById<Task>(
      id,
      transaction: transaction,
      include: include,
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
    _i1.UuidValue id, {
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

class TaskAttachRepository {
  const TaskAttachRepository._();

  /// Creates a relation between this [Task] and the given [TaskTagMap]s
  /// by setting each [TaskTagMap]'s foreign key `_taskTasktagmapsTaskId` to refer to this [Task].
  Future<void> taskTagMaps(
    _i1.Session session,
    Task task,
    List<_i3.TaskTagMap> taskTagMap, {
    _i1.Transaction? transaction,
  }) async {
    if (taskTagMap.any((e) => e.id == null)) {
      throw ArgumentError.notNull('taskTagMap.id');
    }
    if (task.id == null) {
      throw ArgumentError.notNull('task.id');
    }

    var $taskTagMap = taskTagMap
        .map(
          (e) => _i3.TaskTagMapImplicit(
            e,
            $_taskTasktagmapsTaskId: task.id,
          ),
        )
        .toList();
    await session.db.update<_i3.TaskTagMap>(
      $taskTagMap,
      columns: [_i3.TaskTagMap.t.$_taskTasktagmapsTaskId],
      transaction: transaction,
    );
  }
}

class TaskAttachRowRepository {
  const TaskAttachRowRepository._();

  /// Creates a relation between this [Task] and the given [TaskTagMap]
  /// by setting the [TaskTagMap]'s foreign key `_taskTasktagmapsTaskId` to refer to this [Task].
  Future<void> taskTagMaps(
    _i1.Session session,
    Task task,
    _i3.TaskTagMap taskTagMap, {
    _i1.Transaction? transaction,
  }) async {
    if (taskTagMap.id == null) {
      throw ArgumentError.notNull('taskTagMap.id');
    }
    if (task.id == null) {
      throw ArgumentError.notNull('task.id');
    }

    var $taskTagMap = _i3.TaskTagMapImplicit(
      taskTagMap,
      $_taskTasktagmapsTaskId: task.id,
    );
    await session.db.updateRow<_i3.TaskTagMap>(
      $taskTagMap,
      columns: [_i3.TaskTagMap.t.$_taskTasktagmapsTaskId],
      transaction: transaction,
    );
  }
}

class TaskDetachRepository {
  const TaskDetachRepository._();

  /// Detaches the relation between this [Task] and the given [TaskTagMap]
  /// by setting the [TaskTagMap]'s foreign key `_taskTasktagmapsTaskId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> taskTagMaps(
    _i1.Session session,
    List<_i3.TaskTagMap> taskTagMap, {
    _i1.Transaction? transaction,
  }) async {
    if (taskTagMap.any((e) => e.id == null)) {
      throw ArgumentError.notNull('taskTagMap.id');
    }

    var $taskTagMap = taskTagMap
        .map(
          (e) => _i3.TaskTagMapImplicit(
            e,
            $_taskTasktagmapsTaskId: null,
          ),
        )
        .toList();
    await session.db.update<_i3.TaskTagMap>(
      $taskTagMap,
      columns: [_i3.TaskTagMap.t.$_taskTasktagmapsTaskId],
      transaction: transaction,
    );
  }
}

class TaskDetachRowRepository {
  const TaskDetachRowRepository._();

  /// Detaches the relation between this [Task] and the given [TaskTagMap]
  /// by setting the [TaskTagMap]'s foreign key `_taskTasktagmapsTaskId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> taskTagMaps(
    _i1.Session session,
    _i3.TaskTagMap taskTagMap, {
    _i1.Transaction? transaction,
  }) async {
    if (taskTagMap.id == null) {
      throw ArgumentError.notNull('taskTagMap.id');
    }

    var $taskTagMap = _i3.TaskTagMapImplicit(
      taskTagMap,
      $_taskTasktagmapsTaskId: null,
    );
    await session.db.updateRow<_i3.TaskTagMap>(
      $taskTagMap,
      columns: [_i3.TaskTagMap.t.$_taskTasktagmapsTaskId],
      transaction: transaction,
    );
  }
}
