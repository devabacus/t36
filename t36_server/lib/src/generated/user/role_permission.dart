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

abstract class RolePermission
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  RolePermission._({
    this.id,
    required this.roleId,
    required this.permissionId,
  });

  factory RolePermission({
    _i1.UuidValue? id,
    required _i1.UuidValue roleId,
    required _i1.UuidValue permissionId,
  }) = _RolePermissionImpl;

  factory RolePermission.fromJson(Map<String, dynamic> jsonSerialization) {
    return RolePermission(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      roleId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['roleId']),
      permissionId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['permissionId'],
      ),
    );
  }

  static final t = RolePermissionTable();

  static const db = RolePermissionRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue roleId;

  _i1.UuidValue permissionId;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [RolePermission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RolePermission copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? roleId,
    _i1.UuidValue? permissionId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RolePermission',
      if (id != null) 'id': id?.toJson(),
      'roleId': roleId.toJson(),
      'permissionId': permissionId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RolePermission',
      if (id != null) 'id': id?.toJson(),
      'roleId': roleId.toJson(),
      'permissionId': permissionId.toJson(),
    };
  }

  static RolePermissionInclude include() {
    return RolePermissionInclude._();
  }

  static RolePermissionIncludeList includeList({
    _i1.WhereExpressionBuilder<RolePermissionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RolePermissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RolePermissionTable>? orderByList,
    RolePermissionInclude? include,
  }) {
    return RolePermissionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RolePermission.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RolePermission.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RolePermissionImpl extends RolePermission {
  _RolePermissionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue roleId,
    required _i1.UuidValue permissionId,
  }) : super._(
         id: id,
         roleId: roleId,
         permissionId: permissionId,
       );

  /// Returns a shallow copy of this [RolePermission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RolePermission copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? roleId,
    _i1.UuidValue? permissionId,
  }) {
    return RolePermission(
      id: id is _i1.UuidValue? ? id : this.id,
      roleId: roleId ?? this.roleId,
      permissionId: permissionId ?? this.permissionId,
    );
  }
}

class RolePermissionUpdateTable extends _i1.UpdateTable<RolePermissionTable> {
  RolePermissionUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> roleId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.roleId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> permissionId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.permissionId,
    value,
  );
}

class RolePermissionTable extends _i1.Table<_i1.UuidValue?> {
  RolePermissionTable({super.tableRelation})
    : super(tableName: 'role_permission') {
    updateTable = RolePermissionUpdateTable(this);
    roleId = _i1.ColumnUuid(
      'roleId',
      this,
    );
    permissionId = _i1.ColumnUuid(
      'permissionId',
      this,
    );
  }

  late final RolePermissionUpdateTable updateTable;

  late final _i1.ColumnUuid roleId;

  late final _i1.ColumnUuid permissionId;

  @override
  List<_i1.Column> get columns => [
    id,
    roleId,
    permissionId,
  ];
}

class RolePermissionInclude extends _i1.IncludeObject {
  RolePermissionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => RolePermission.t;
}

class RolePermissionIncludeList extends _i1.IncludeList {
  RolePermissionIncludeList._({
    _i1.WhereExpressionBuilder<RolePermissionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RolePermission.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => RolePermission.t;
}

class RolePermissionRepository {
  const RolePermissionRepository._();

  /// Returns a list of [RolePermission]s matching the given query parameters.
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
  Future<List<RolePermission>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RolePermissionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RolePermissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RolePermissionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<RolePermission>(
      where: where?.call(RolePermission.t),
      orderBy: orderBy?.call(RolePermission.t),
      orderByList: orderByList?.call(RolePermission.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [RolePermission] matching the given query parameters.
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
  Future<RolePermission?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RolePermissionTable>? where,
    int? offset,
    _i1.OrderByBuilder<RolePermissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RolePermissionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<RolePermission>(
      where: where?.call(RolePermission.t),
      orderBy: orderBy?.call(RolePermission.t),
      orderByList: orderByList?.call(RolePermission.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [RolePermission] by its [id] or null if no such row exists.
  Future<RolePermission?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<RolePermission>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [RolePermission]s in the list and returns the inserted rows.
  ///
  /// The returned [RolePermission]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RolePermission>> insert(
    _i1.Session session,
    List<RolePermission> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RolePermission>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RolePermission] and returns the inserted row.
  ///
  /// The returned [RolePermission] will have its `id` field set.
  Future<RolePermission> insertRow(
    _i1.Session session,
    RolePermission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RolePermission>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RolePermission]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RolePermission>> update(
    _i1.Session session,
    List<RolePermission> rows, {
    _i1.ColumnSelections<RolePermissionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RolePermission>(
      rows,
      columns: columns?.call(RolePermission.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RolePermission]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RolePermission> updateRow(
    _i1.Session session,
    RolePermission row, {
    _i1.ColumnSelections<RolePermissionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RolePermission>(
      row,
      columns: columns?.call(RolePermission.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RolePermission] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RolePermission?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<RolePermissionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<RolePermission>(
      id,
      columnValues: columnValues(RolePermission.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RolePermission]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<RolePermission>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<RolePermissionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<RolePermissionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RolePermissionTable>? orderBy,
    _i1.OrderByListBuilder<RolePermissionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<RolePermission>(
      columnValues: columnValues(RolePermission.t.updateTable),
      where: where(RolePermission.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RolePermission.t),
      orderByList: orderByList?.call(RolePermission.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [RolePermission]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RolePermission>> delete(
    _i1.Session session,
    List<RolePermission> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RolePermission>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RolePermission].
  Future<RolePermission> deleteRow(
    _i1.Session session,
    RolePermission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RolePermission>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RolePermission>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RolePermissionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RolePermission>(
      where: where(RolePermission.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RolePermissionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RolePermission>(
      where: where?.call(RolePermission.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
