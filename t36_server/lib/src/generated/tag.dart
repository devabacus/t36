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
import 'task_tag_map.dart' as _i2;
import 'package:t36_server/src/generated/protocol.dart' as _i3;

abstract class Tag
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  Tag._({
    this.id,
    required this.userId,
    required this.customerId,
    required this.createdAt,
    required this.lastModified,
    bool? isDeleted,
    required this.title,
    this.taskTagMaps,
  }) : isDeleted = isDeleted ?? false;

  factory Tag({
    _i1.UuidValue? id,
    required int userId,
    required _i1.UuidValue customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    required String title,
    List<_i2.TaskTagMap>? taskTagMaps,
  }) = _TagImpl;

  factory Tag.fromJson(Map<String, dynamic> jsonSerialization) {
    return Tag(
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
      taskTagMaps: jsonSerialization['taskTagMaps'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.TaskTagMap>>(
              jsonSerialization['taskTagMaps'],
            ),
    );
  }

  static final t = TagTable();

  static const db = TagRepository._();

  @override
  _i1.UuidValue? id;

  int userId;

  _i1.UuidValue customerId;

  DateTime createdAt;

  DateTime lastModified;

  bool isDeleted;

  String title;

  List<_i2.TaskTagMap>? taskTagMaps;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Tag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Tag copyWith({
    _i1.UuidValue? id,
    int? userId,
    _i1.UuidValue? customerId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
    String? title,
    List<_i2.TaskTagMap>? taskTagMaps,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Tag',
      if (id != null) 'id': id?.toJson(),
      'userId': userId,
      'customerId': customerId.toJson(),
      'createdAt': createdAt.toJson(),
      'lastModified': lastModified.toJson(),
      'isDeleted': isDeleted,
      'title': title,
      if (taskTagMaps != null)
        'taskTagMaps': taskTagMaps?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Tag',
      if (id != null) 'id': id?.toJson(),
      'userId': userId,
      'customerId': customerId.toJson(),
      'createdAt': createdAt.toJson(),
      'lastModified': lastModified.toJson(),
      'isDeleted': isDeleted,
      'title': title,
      if (taskTagMaps != null)
        'taskTagMaps': taskTagMaps?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static TagInclude include({_i2.TaskTagMapIncludeList? taskTagMaps}) {
    return TagInclude._(taskTagMaps: taskTagMaps);
  }

  static TagIncludeList includeList({
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    TagInclude? include,
  }) {
    return TagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Tag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Tag.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TagImpl extends Tag {
  _TagImpl({
    _i1.UuidValue? id,
    required int userId,
    required _i1.UuidValue customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    required String title,
    List<_i2.TaskTagMap>? taskTagMaps,
  }) : super._(
         id: id,
         userId: userId,
         customerId: customerId,
         createdAt: createdAt,
         lastModified: lastModified,
         isDeleted: isDeleted,
         title: title,
         taskTagMaps: taskTagMaps,
       );

  /// Returns a shallow copy of this [Tag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Tag copyWith({
    Object? id = _Undefined,
    int? userId,
    _i1.UuidValue? customerId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
    String? title,
    Object? taskTagMaps = _Undefined,
  }) {
    return Tag(
      id: id is _i1.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      customerId: customerId ?? this.customerId,
      createdAt: createdAt ?? this.createdAt,
      lastModified: lastModified ?? this.lastModified,
      isDeleted: isDeleted ?? this.isDeleted,
      title: title ?? this.title,
      taskTagMaps: taskTagMaps is List<_i2.TaskTagMap>?
          ? taskTagMaps
          : this.taskTagMaps?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class TagUpdateTable extends _i1.UpdateTable<TagTable> {
  TagUpdateTable(super.table);

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
}

class TagTable extends _i1.Table<_i1.UuidValue?> {
  TagTable({super.tableRelation}) : super(tableName: 'tag') {
    updateTable = TagUpdateTable(this);
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
  }

  late final TagUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnUuid customerId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime lastModified;

  late final _i1.ColumnBool isDeleted;

  late final _i1.ColumnString title;

  _i2.TaskTagMapTable? ___taskTagMaps;

  _i1.ManyRelation<_i2.TaskTagMapTable>? _taskTagMaps;

  _i2.TaskTagMapTable get __taskTagMaps {
    if (___taskTagMaps != null) return ___taskTagMaps!;
    ___taskTagMaps = _i1.createRelationTable(
      relationFieldName: '__taskTagMaps',
      field: Tag.t.id,
      foreignField: _i2.TaskTagMap.t.$_tagTasktagmapsTagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TaskTagMapTable(tableRelation: foreignTableRelation),
    );
    return ___taskTagMaps!;
  }

  _i1.ManyRelation<_i2.TaskTagMapTable> get taskTagMaps {
    if (_taskTagMaps != null) return _taskTagMaps!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'taskTagMaps',
      field: Tag.t.id,
      foreignField: _i2.TaskTagMap.t.$_tagTasktagmapsTagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TaskTagMapTable(tableRelation: foreignTableRelation),
    );
    _taskTagMaps = _i1.ManyRelation<_i2.TaskTagMapTable>(
      tableWithRelations: relationTable,
      table: _i2.TaskTagMapTable(
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
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'taskTagMaps') {
      return __taskTagMaps;
    }
    return null;
  }
}

class TagInclude extends _i1.IncludeObject {
  TagInclude._({_i2.TaskTagMapIncludeList? taskTagMaps}) {
    _taskTagMaps = taskTagMaps;
  }

  _i2.TaskTagMapIncludeList? _taskTagMaps;

  @override
  Map<String, _i1.Include?> get includes => {'taskTagMaps': _taskTagMaps};

  @override
  _i1.Table<_i1.UuidValue?> get table => Tag.t;
}

class TagIncludeList extends _i1.IncludeList {
  TagIncludeList._({
    _i1.WhereExpressionBuilder<TagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Tag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Tag.t;
}

class TagRepository {
  const TagRepository._();

  final attach = const TagAttachRepository._();

  final attachRow = const TagAttachRowRepository._();

  final detach = const TagDetachRepository._();

  final detachRow = const TagDetachRowRepository._();

  /// Returns a list of [Tag]s matching the given query parameters.
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
  Future<List<Tag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.find<Tag>(
      where: where?.call(Tag.t),
      orderBy: orderBy?.call(Tag.t),
      orderByList: orderByList?.call(Tag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Tag] matching the given query parameters.
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
  Future<Tag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.findFirstRow<Tag>(
      where: where?.call(Tag.t),
      orderBy: orderBy?.call(Tag.t),
      orderByList: orderByList?.call(Tag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Tag] by its [id] or null if no such row exists.
  Future<Tag?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.findById<Tag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Tag]s in the list and returns the inserted rows.
  ///
  /// The returned [Tag]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Tag>> insert(
    _i1.Session session,
    List<Tag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Tag>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Tag] and returns the inserted row.
  ///
  /// The returned [Tag] will have its `id` field set.
  Future<Tag> insertRow(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Tag>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Tag]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Tag>> update(
    _i1.Session session,
    List<Tag> rows, {
    _i1.ColumnSelections<TagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Tag>(
      rows,
      columns: columns?.call(Tag.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Tag]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Tag> updateRow(
    _i1.Session session,
    Tag row, {
    _i1.ColumnSelections<TagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Tag>(
      row,
      columns: columns?.call(Tag.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Tag] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Tag?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<TagUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Tag>(
      id,
      columnValues: columnValues(Tag.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Tag]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Tag>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TagUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TagTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Tag>(
      columnValues: columnValues(Tag.t.updateTable),
      where: where(Tag.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Tag.t),
      orderByList: orderByList?.call(Tag.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Tag]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Tag>> delete(
    _i1.Session session,
    List<Tag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Tag>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Tag].
  Future<Tag> deleteRow(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Tag>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Tag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Tag>(
      where: where(Tag.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Tag>(
      where: where?.call(Tag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TagAttachRepository {
  const TagAttachRepository._();

  /// Creates a relation between this [Tag] and the given [TaskTagMap]s
  /// by setting each [TaskTagMap]'s foreign key `_tagTasktagmapsTagId` to refer to this [Tag].
  Future<void> taskTagMaps(
    _i1.Session session,
    Tag tag,
    List<_i2.TaskTagMap> taskTagMap, {
    _i1.Transaction? transaction,
  }) async {
    if (taskTagMap.any((e) => e.id == null)) {
      throw ArgumentError.notNull('taskTagMap.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $taskTagMap = taskTagMap
        .map(
          (e) => _i2.TaskTagMapImplicit(
            e,
            $_tagTasktagmapsTagId: tag.id,
          ),
        )
        .toList();
    await session.db.update<_i2.TaskTagMap>(
      $taskTagMap,
      columns: [_i2.TaskTagMap.t.$_tagTasktagmapsTagId],
      transaction: transaction,
    );
  }
}

class TagAttachRowRepository {
  const TagAttachRowRepository._();

  /// Creates a relation between this [Tag] and the given [TaskTagMap]
  /// by setting the [TaskTagMap]'s foreign key `_tagTasktagmapsTagId` to refer to this [Tag].
  Future<void> taskTagMaps(
    _i1.Session session,
    Tag tag,
    _i2.TaskTagMap taskTagMap, {
    _i1.Transaction? transaction,
  }) async {
    if (taskTagMap.id == null) {
      throw ArgumentError.notNull('taskTagMap.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $taskTagMap = _i2.TaskTagMapImplicit(
      taskTagMap,
      $_tagTasktagmapsTagId: tag.id,
    );
    await session.db.updateRow<_i2.TaskTagMap>(
      $taskTagMap,
      columns: [_i2.TaskTagMap.t.$_tagTasktagmapsTagId],
      transaction: transaction,
    );
  }
}

class TagDetachRepository {
  const TagDetachRepository._();

  /// Detaches the relation between this [Tag] and the given [TaskTagMap]
  /// by setting the [TaskTagMap]'s foreign key `_tagTasktagmapsTagId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> taskTagMaps(
    _i1.Session session,
    List<_i2.TaskTagMap> taskTagMap, {
    _i1.Transaction? transaction,
  }) async {
    if (taskTagMap.any((e) => e.id == null)) {
      throw ArgumentError.notNull('taskTagMap.id');
    }

    var $taskTagMap = taskTagMap
        .map(
          (e) => _i2.TaskTagMapImplicit(
            e,
            $_tagTasktagmapsTagId: null,
          ),
        )
        .toList();
    await session.db.update<_i2.TaskTagMap>(
      $taskTagMap,
      columns: [_i2.TaskTagMap.t.$_tagTasktagmapsTagId],
      transaction: transaction,
    );
  }
}

class TagDetachRowRepository {
  const TagDetachRowRepository._();

  /// Detaches the relation between this [Tag] and the given [TaskTagMap]
  /// by setting the [TaskTagMap]'s foreign key `_tagTasktagmapsTagId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> taskTagMaps(
    _i1.Session session,
    _i2.TaskTagMap taskTagMap, {
    _i1.Transaction? transaction,
  }) async {
    if (taskTagMap.id == null) {
      throw ArgumentError.notNull('taskTagMap.id');
    }

    var $taskTagMap = _i2.TaskTagMapImplicit(
      taskTagMap,
      $_tagTasktagmapsTagId: null,
    );
    await session.db.updateRow<_i2.TaskTagMap>(
      $taskTagMap,
      columns: [_i2.TaskTagMap.t.$_tagTasktagmapsTagId],
      transaction: transaction,
    );
  }
}
