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

abstract class Configuration
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  Configuration._({
    this.id,
    required this.userId,
    required this.customerId,
    required this.createdAt,
    required this.lastModified,
    bool? isDeleted,
    required this.group,
    required this.key,
    required this.value,
  }) : isDeleted = isDeleted ?? false;

  factory Configuration({
    _i1.UuidValue? id,
    required int userId,
    required _i1.UuidValue customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    required String group,
    required String key,
    required String value,
  }) = _ConfigurationImpl;

  factory Configuration.fromJson(Map<String, dynamic> jsonSerialization) {
    return Configuration(
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
      group: jsonSerialization['group'] as String,
      key: jsonSerialization['key'] as String,
      value: jsonSerialization['value'] as String,
    );
  }

  static final t = ConfigurationTable();

  static const db = ConfigurationRepository._();

  @override
  _i1.UuidValue? id;

  int userId;

  _i1.UuidValue customerId;

  DateTime createdAt;

  DateTime lastModified;

  bool isDeleted;

  String group;

  String key;

  String value;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Configuration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Configuration copyWith({
    _i1.UuidValue? id,
    int? userId,
    _i1.UuidValue? customerId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
    String? group,
    String? key,
    String? value,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Configuration',
      if (id != null) 'id': id?.toJson(),
      'userId': userId,
      'customerId': customerId.toJson(),
      'createdAt': createdAt.toJson(),
      'lastModified': lastModified.toJson(),
      'isDeleted': isDeleted,
      'group': group,
      'key': key,
      'value': value,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Configuration',
      if (id != null) 'id': id?.toJson(),
      'userId': userId,
      'customerId': customerId.toJson(),
      'createdAt': createdAt.toJson(),
      'lastModified': lastModified.toJson(),
      'isDeleted': isDeleted,
      'group': group,
      'key': key,
      'value': value,
    };
  }

  static ConfigurationInclude include() {
    return ConfigurationInclude._();
  }

  static ConfigurationIncludeList includeList({
    _i1.WhereExpressionBuilder<ConfigurationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ConfigurationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ConfigurationTable>? orderByList,
    ConfigurationInclude? include,
  }) {
    return ConfigurationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Configuration.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Configuration.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ConfigurationImpl extends Configuration {
  _ConfigurationImpl({
    _i1.UuidValue? id,
    required int userId,
    required _i1.UuidValue customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    required String group,
    required String key,
    required String value,
  }) : super._(
         id: id,
         userId: userId,
         customerId: customerId,
         createdAt: createdAt,
         lastModified: lastModified,
         isDeleted: isDeleted,
         group: group,
         key: key,
         value: value,
       );

  /// Returns a shallow copy of this [Configuration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Configuration copyWith({
    Object? id = _Undefined,
    int? userId,
    _i1.UuidValue? customerId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
    String? group,
    String? key,
    String? value,
  }) {
    return Configuration(
      id: id is _i1.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      customerId: customerId ?? this.customerId,
      createdAt: createdAt ?? this.createdAt,
      lastModified: lastModified ?? this.lastModified,
      isDeleted: isDeleted ?? this.isDeleted,
      group: group ?? this.group,
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }
}

class ConfigurationUpdateTable extends _i1.UpdateTable<ConfigurationTable> {
  ConfigurationUpdateTable(super.table);

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

  _i1.ColumnValue<String, String> group(String value) => _i1.ColumnValue(
    table.group,
    value,
  );

  _i1.ColumnValue<String, String> key(String value) => _i1.ColumnValue(
    table.key,
    value,
  );

  _i1.ColumnValue<String, String> value(String value) => _i1.ColumnValue(
    table.value,
    value,
  );
}

class ConfigurationTable extends _i1.Table<_i1.UuidValue?> {
  ConfigurationTable({super.tableRelation})
    : super(tableName: 'configuration') {
    updateTable = ConfigurationUpdateTable(this);
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
    group = _i1.ColumnString(
      'group',
      this,
    );
    key = _i1.ColumnString(
      'key',
      this,
    );
    value = _i1.ColumnString(
      'value',
      this,
    );
  }

  late final ConfigurationUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnUuid customerId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime lastModified;

  late final _i1.ColumnBool isDeleted;

  late final _i1.ColumnString group;

  late final _i1.ColumnString key;

  late final _i1.ColumnString value;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    customerId,
    createdAt,
    lastModified,
    isDeleted,
    group,
    key,
    value,
  ];
}

class ConfigurationInclude extends _i1.IncludeObject {
  ConfigurationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Configuration.t;
}

class ConfigurationIncludeList extends _i1.IncludeList {
  ConfigurationIncludeList._({
    _i1.WhereExpressionBuilder<ConfigurationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Configuration.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Configuration.t;
}

class ConfigurationRepository {
  const ConfigurationRepository._();

  /// Returns a list of [Configuration]s matching the given query parameters.
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
  Future<List<Configuration>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ConfigurationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ConfigurationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ConfigurationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Configuration>(
      where: where?.call(Configuration.t),
      orderBy: orderBy?.call(Configuration.t),
      orderByList: orderByList?.call(Configuration.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Configuration] matching the given query parameters.
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
  Future<Configuration?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ConfigurationTable>? where,
    int? offset,
    _i1.OrderByBuilder<ConfigurationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ConfigurationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Configuration>(
      where: where?.call(Configuration.t),
      orderBy: orderBy?.call(Configuration.t),
      orderByList: orderByList?.call(Configuration.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Configuration] by its [id] or null if no such row exists.
  Future<Configuration?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Configuration>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Configuration]s in the list and returns the inserted rows.
  ///
  /// The returned [Configuration]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Configuration>> insert(
    _i1.Session session,
    List<Configuration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Configuration>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Configuration] and returns the inserted row.
  ///
  /// The returned [Configuration] will have its `id` field set.
  Future<Configuration> insertRow(
    _i1.Session session,
    Configuration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Configuration>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Configuration]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Configuration>> update(
    _i1.Session session,
    List<Configuration> rows, {
    _i1.ColumnSelections<ConfigurationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Configuration>(
      rows,
      columns: columns?.call(Configuration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Configuration]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Configuration> updateRow(
    _i1.Session session,
    Configuration row, {
    _i1.ColumnSelections<ConfigurationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Configuration>(
      row,
      columns: columns?.call(Configuration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Configuration] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Configuration?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ConfigurationUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Configuration>(
      id,
      columnValues: columnValues(Configuration.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Configuration]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Configuration>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ConfigurationUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ConfigurationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ConfigurationTable>? orderBy,
    _i1.OrderByListBuilder<ConfigurationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Configuration>(
      columnValues: columnValues(Configuration.t.updateTable),
      where: where(Configuration.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Configuration.t),
      orderByList: orderByList?.call(Configuration.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Configuration]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Configuration>> delete(
    _i1.Session session,
    List<Configuration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Configuration>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Configuration].
  Future<Configuration> deleteRow(
    _i1.Session session,
    Configuration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Configuration>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Configuration>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ConfigurationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Configuration>(
      where: where(Configuration.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ConfigurationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Configuration>(
      where: where?.call(Configuration.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
