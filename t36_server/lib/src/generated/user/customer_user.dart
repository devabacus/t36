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

abstract class CustomerUser
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  CustomerUser._({
    this.id,
    required this.customerId,
    required this.userId,
    required this.roleId,
  });

  factory CustomerUser({
    _i1.UuidValue? id,
    required _i1.UuidValue customerId,
    required int userId,
    required _i1.UuidValue roleId,
  }) = _CustomerUserImpl;

  factory CustomerUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomerUser(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      userId: jsonSerialization['userId'] as int,
      roleId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['roleId']),
    );
  }

  static final t = CustomerUserTable();

  static const db = CustomerUserRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue customerId;

  int userId;

  _i1.UuidValue roleId;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [CustomerUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerUser copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? customerId,
    int? userId,
    _i1.UuidValue? roleId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CustomerUser',
      if (id != null) 'id': id?.toJson(),
      'customerId': customerId.toJson(),
      'userId': userId,
      'roleId': roleId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CustomerUser',
      if (id != null) 'id': id?.toJson(),
      'customerId': customerId.toJson(),
      'userId': userId,
      'roleId': roleId.toJson(),
    };
  }

  static CustomerUserInclude include() {
    return CustomerUserInclude._();
  }

  static CustomerUserIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomerUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerUserTable>? orderByList,
    CustomerUserInclude? include,
  }) {
    return CustomerUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerUser.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CustomerUser.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerUserImpl extends CustomerUser {
  _CustomerUserImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue customerId,
    required int userId,
    required _i1.UuidValue roleId,
  }) : super._(
         id: id,
         customerId: customerId,
         userId: userId,
         roleId: roleId,
       );

  /// Returns a shallow copy of this [CustomerUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerUser copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? customerId,
    int? userId,
    _i1.UuidValue? roleId,
  }) {
    return CustomerUser(
      id: id is _i1.UuidValue? ? id : this.id,
      customerId: customerId ?? this.customerId,
      userId: userId ?? this.userId,
      roleId: roleId ?? this.roleId,
    );
  }
}

class CustomerUserUpdateTable extends _i1.UpdateTable<CustomerUserTable> {
  CustomerUserUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> customerId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.customerId,
    value,
  );

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> roleId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.roleId,
        value,
      );
}

class CustomerUserTable extends _i1.Table<_i1.UuidValue?> {
  CustomerUserTable({super.tableRelation}) : super(tableName: 'customer_user') {
    updateTable = CustomerUserUpdateTable(this);
    customerId = _i1.ColumnUuid(
      'customerId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    roleId = _i1.ColumnUuid(
      'roleId',
      this,
    );
  }

  late final CustomerUserUpdateTable updateTable;

  late final _i1.ColumnUuid customerId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnUuid roleId;

  @override
  List<_i1.Column> get columns => [
    id,
    customerId,
    userId,
    roleId,
  ];
}

class CustomerUserInclude extends _i1.IncludeObject {
  CustomerUserInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => CustomerUser.t;
}

class CustomerUserIncludeList extends _i1.IncludeList {
  CustomerUserIncludeList._({
    _i1.WhereExpressionBuilder<CustomerUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CustomerUser.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => CustomerUser.t;
}

class CustomerUserRepository {
  const CustomerUserRepository._();

  /// Returns a list of [CustomerUser]s matching the given query parameters.
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
  Future<List<CustomerUser>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerUserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CustomerUser>(
      where: where?.call(CustomerUser.t),
      orderBy: orderBy?.call(CustomerUser.t),
      orderByList: orderByList?.call(CustomerUser.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CustomerUser] matching the given query parameters.
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
  Future<CustomerUser?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerUserTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomerUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerUserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CustomerUser>(
      where: where?.call(CustomerUser.t),
      orderBy: orderBy?.call(CustomerUser.t),
      orderByList: orderByList?.call(CustomerUser.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CustomerUser] by its [id] or null if no such row exists.
  Future<CustomerUser?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CustomerUser>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CustomerUser]s in the list and returns the inserted rows.
  ///
  /// The returned [CustomerUser]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CustomerUser>> insert(
    _i1.Session session,
    List<CustomerUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CustomerUser>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CustomerUser] and returns the inserted row.
  ///
  /// The returned [CustomerUser] will have its `id` field set.
  Future<CustomerUser> insertRow(
    _i1.Session session,
    CustomerUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CustomerUser>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CustomerUser]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CustomerUser>> update(
    _i1.Session session,
    List<CustomerUser> rows, {
    _i1.ColumnSelections<CustomerUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CustomerUser>(
      rows,
      columns: columns?.call(CustomerUser.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerUser]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CustomerUser> updateRow(
    _i1.Session session,
    CustomerUser row, {
    _i1.ColumnSelections<CustomerUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CustomerUser>(
      row,
      columns: columns?.call(CustomerUser.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerUser] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CustomerUser?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<CustomerUserUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CustomerUser>(
      id,
      columnValues: columnValues(CustomerUser.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CustomerUser]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CustomerUser>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CustomerUserUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CustomerUserTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerUserTable>? orderBy,
    _i1.OrderByListBuilder<CustomerUserTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CustomerUser>(
      columnValues: columnValues(CustomerUser.t.updateTable),
      where: where(CustomerUser.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerUser.t),
      orderByList: orderByList?.call(CustomerUser.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CustomerUser]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CustomerUser>> delete(
    _i1.Session session,
    List<CustomerUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CustomerUser>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CustomerUser].
  Future<CustomerUser> deleteRow(
    _i1.Session session,
    CustomerUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CustomerUser>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CustomerUser>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomerUserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CustomerUser>(
      where: where(CustomerUser.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerUserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CustomerUser>(
      where: where?.call(CustomerUser.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
