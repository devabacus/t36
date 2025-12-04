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

abstract class Customer
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  Customer._({
    this.id,
    required this.userId,
    required this.createdAt,
    required this.lastModified,
    bool? isDeleted,
    required this.name,
    this.email,
    this.info,
    this.subscriptionStatus,
  }) : isDeleted = isDeleted ?? false;

  factory Customer({
    _i1.UuidValue? id,
    required int userId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    required String name,
    String? email,
    String? info,
    String? subscriptionStatus,
  }) = _CustomerImpl;

  factory Customer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Customer(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: jsonSerialization['userId'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      lastModified: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastModified'],
      ),
      isDeleted: jsonSerialization['isDeleted'] as bool,
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String?,
      info: jsonSerialization['info'] as String?,
      subscriptionStatus: jsonSerialization['subscriptionStatus'] as String?,
    );
  }

  static final t = CustomerTable();

  static const db = CustomerRepository._();

  @override
  _i1.UuidValue? id;

  int userId;

  DateTime createdAt;

  DateTime lastModified;

  bool isDeleted;

  String name;

  String? email;

  String? info;

  String? subscriptionStatus;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Customer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Customer copyWith({
    _i1.UuidValue? id,
    int? userId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
    String? name,
    String? email,
    String? info,
    String? subscriptionStatus,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Customer',
      if (id != null) 'id': id?.toJson(),
      'userId': userId,
      'createdAt': createdAt.toJson(),
      'lastModified': lastModified.toJson(),
      'isDeleted': isDeleted,
      'name': name,
      if (email != null) 'email': email,
      if (info != null) 'info': info,
      if (subscriptionStatus != null) 'subscriptionStatus': subscriptionStatus,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Customer',
      if (id != null) 'id': id?.toJson(),
      'userId': userId,
      'createdAt': createdAt.toJson(),
      'lastModified': lastModified.toJson(),
      'isDeleted': isDeleted,
      'name': name,
      if (email != null) 'email': email,
      if (info != null) 'info': info,
      if (subscriptionStatus != null) 'subscriptionStatus': subscriptionStatus,
    };
  }

  static CustomerInclude include() {
    return CustomerInclude._();
  }

  static CustomerIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerTable>? orderByList,
    CustomerInclude? include,
  }) {
    return CustomerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Customer.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Customer.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerImpl extends Customer {
  _CustomerImpl({
    _i1.UuidValue? id,
    required int userId,
    required DateTime createdAt,
    required DateTime lastModified,
    bool? isDeleted,
    required String name,
    String? email,
    String? info,
    String? subscriptionStatus,
  }) : super._(
         id: id,
         userId: userId,
         createdAt: createdAt,
         lastModified: lastModified,
         isDeleted: isDeleted,
         name: name,
         email: email,
         info: info,
         subscriptionStatus: subscriptionStatus,
       );

  /// Returns a shallow copy of this [Customer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Customer copyWith({
    Object? id = _Undefined,
    int? userId,
    DateTime? createdAt,
    DateTime? lastModified,
    bool? isDeleted,
    String? name,
    Object? email = _Undefined,
    Object? info = _Undefined,
    Object? subscriptionStatus = _Undefined,
  }) {
    return Customer(
      id: id is _i1.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      lastModified: lastModified ?? this.lastModified,
      isDeleted: isDeleted ?? this.isDeleted,
      name: name ?? this.name,
      email: email is String? ? email : this.email,
      info: info is String? ? info : this.info,
      subscriptionStatus: subscriptionStatus is String?
          ? subscriptionStatus
          : this.subscriptionStatus,
    );
  }
}

class CustomerUpdateTable extends _i1.UpdateTable<CustomerTable> {
  CustomerUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
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

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> email(String? value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<String, String> info(String? value) => _i1.ColumnValue(
    table.info,
    value,
  );

  _i1.ColumnValue<String, String> subscriptionStatus(String? value) =>
      _i1.ColumnValue(
        table.subscriptionStatus,
        value,
      );
}

class CustomerTable extends _i1.Table<_i1.UuidValue?> {
  CustomerTable({super.tableRelation}) : super(tableName: 'customer') {
    updateTable = CustomerUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
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
    name = _i1.ColumnString(
      'name',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    info = _i1.ColumnString(
      'info',
      this,
    );
    subscriptionStatus = _i1.ColumnString(
      'subscriptionStatus',
      this,
    );
  }

  late final CustomerUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime lastModified;

  late final _i1.ColumnBool isDeleted;

  late final _i1.ColumnString name;

  late final _i1.ColumnString email;

  late final _i1.ColumnString info;

  late final _i1.ColumnString subscriptionStatus;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    createdAt,
    lastModified,
    isDeleted,
    name,
    email,
    info,
    subscriptionStatus,
  ];
}

class CustomerInclude extends _i1.IncludeObject {
  CustomerInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Customer.t;
}

class CustomerIncludeList extends _i1.IncludeList {
  CustomerIncludeList._({
    _i1.WhereExpressionBuilder<CustomerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Customer.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Customer.t;
}

class CustomerRepository {
  const CustomerRepository._();

  /// Returns a list of [Customer]s matching the given query parameters.
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
  Future<List<Customer>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Customer>(
      where: where?.call(Customer.t),
      orderBy: orderBy?.call(Customer.t),
      orderByList: orderByList?.call(Customer.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Customer] matching the given query parameters.
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
  Future<Customer?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Customer>(
      where: where?.call(Customer.t),
      orderBy: orderBy?.call(Customer.t),
      orderByList: orderByList?.call(Customer.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Customer] by its [id] or null if no such row exists.
  Future<Customer?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Customer>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Customer]s in the list and returns the inserted rows.
  ///
  /// The returned [Customer]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Customer>> insert(
    _i1.Session session,
    List<Customer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Customer>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Customer] and returns the inserted row.
  ///
  /// The returned [Customer] will have its `id` field set.
  Future<Customer> insertRow(
    _i1.Session session,
    Customer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Customer>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Customer]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Customer>> update(
    _i1.Session session,
    List<Customer> rows, {
    _i1.ColumnSelections<CustomerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Customer>(
      rows,
      columns: columns?.call(Customer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Customer]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Customer> updateRow(
    _i1.Session session,
    Customer row, {
    _i1.ColumnSelections<CustomerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Customer>(
      row,
      columns: columns?.call(Customer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Customer] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Customer?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<CustomerUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Customer>(
      id,
      columnValues: columnValues(Customer.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Customer]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Customer>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CustomerUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CustomerTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerTable>? orderBy,
    _i1.OrderByListBuilder<CustomerTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Customer>(
      columnValues: columnValues(Customer.t.updateTable),
      where: where(Customer.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Customer.t),
      orderByList: orderByList?.call(Customer.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Customer]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Customer>> delete(
    _i1.Session session,
    List<Customer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Customer>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Customer].
  Future<Customer> deleteRow(
    _i1.Session session,
    Customer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Customer>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Customer>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Customer>(
      where: where(Customer.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Customer>(
      where: where?.call(Customer.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
