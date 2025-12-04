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
import '../storage/upload_status.dart' as _i2;

abstract class UploadedFile
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  UploadedFile._({
    this.id,
    required this.bucketName,
    required this.objectKey,
    required this.originalFilename,
    required this.mimeType,
    required this.size,
    required this.status,
    required this.uploadedAt,
    required this.userId,
    required this.customerId,
    this.metadata,
    this.publicUrl,
    this.expiresAt,
  });

  factory UploadedFile({
    _i1.UuidValue? id,
    required String bucketName,
    required String objectKey,
    required String originalFilename,
    required String mimeType,
    required int size,
    required _i2.UploadStatus status,
    required DateTime uploadedAt,
    required int userId,
    required _i1.UuidValue customerId,
    String? metadata,
    String? publicUrl,
    DateTime? expiresAt,
  }) = _UploadedFileImpl;

  factory UploadedFile.fromJson(Map<String, dynamic> jsonSerialization) {
    return UploadedFile(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      bucketName: jsonSerialization['bucketName'] as String,
      objectKey: jsonSerialization['objectKey'] as String,
      originalFilename: jsonSerialization['originalFilename'] as String,
      mimeType: jsonSerialization['mimeType'] as String,
      size: jsonSerialization['size'] as int,
      status: _i2.UploadStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      uploadedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['uploadedAt'],
      ),
      userId: jsonSerialization['userId'] as int,
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      metadata: jsonSerialization['metadata'] as String?,
      publicUrl: jsonSerialization['publicUrl'] as String?,
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
    );
  }

  static final t = UploadedFileTable();

  static const db = UploadedFileRepository._();

  @override
  _i1.UuidValue? id;

  String bucketName;

  String objectKey;

  String originalFilename;

  String mimeType;

  int size;

  _i2.UploadStatus status;

  DateTime uploadedAt;

  int userId;

  _i1.UuidValue customerId;

  String? metadata;

  String? publicUrl;

  DateTime? expiresAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [UploadedFile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UploadedFile copyWith({
    _i1.UuidValue? id,
    String? bucketName,
    String? objectKey,
    String? originalFilename,
    String? mimeType,
    int? size,
    _i2.UploadStatus? status,
    DateTime? uploadedAt,
    int? userId,
    _i1.UuidValue? customerId,
    String? metadata,
    String? publicUrl,
    DateTime? expiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UploadedFile',
      if (id != null) 'id': id?.toJson(),
      'bucketName': bucketName,
      'objectKey': objectKey,
      'originalFilename': originalFilename,
      'mimeType': mimeType,
      'size': size,
      'status': status.toJson(),
      'uploadedAt': uploadedAt.toJson(),
      'userId': userId,
      'customerId': customerId.toJson(),
      if (metadata != null) 'metadata': metadata,
      if (publicUrl != null) 'publicUrl': publicUrl,
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UploadedFile',
      if (id != null) 'id': id?.toJson(),
      'bucketName': bucketName,
      'objectKey': objectKey,
      'originalFilename': originalFilename,
      'mimeType': mimeType,
      'size': size,
      'status': status.toJson(),
      'uploadedAt': uploadedAt.toJson(),
      'userId': userId,
      'customerId': customerId.toJson(),
      if (metadata != null) 'metadata': metadata,
      if (publicUrl != null) 'publicUrl': publicUrl,
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
    };
  }

  static UploadedFileInclude include() {
    return UploadedFileInclude._();
  }

  static UploadedFileIncludeList includeList({
    _i1.WhereExpressionBuilder<UploadedFileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UploadedFileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UploadedFileTable>? orderByList,
    UploadedFileInclude? include,
  }) {
    return UploadedFileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UploadedFile.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UploadedFile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UploadedFileImpl extends UploadedFile {
  _UploadedFileImpl({
    _i1.UuidValue? id,
    required String bucketName,
    required String objectKey,
    required String originalFilename,
    required String mimeType,
    required int size,
    required _i2.UploadStatus status,
    required DateTime uploadedAt,
    required int userId,
    required _i1.UuidValue customerId,
    String? metadata,
    String? publicUrl,
    DateTime? expiresAt,
  }) : super._(
         id: id,
         bucketName: bucketName,
         objectKey: objectKey,
         originalFilename: originalFilename,
         mimeType: mimeType,
         size: size,
         status: status,
         uploadedAt: uploadedAt,
         userId: userId,
         customerId: customerId,
         metadata: metadata,
         publicUrl: publicUrl,
         expiresAt: expiresAt,
       );

  /// Returns a shallow copy of this [UploadedFile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UploadedFile copyWith({
    Object? id = _Undefined,
    String? bucketName,
    String? objectKey,
    String? originalFilename,
    String? mimeType,
    int? size,
    _i2.UploadStatus? status,
    DateTime? uploadedAt,
    int? userId,
    _i1.UuidValue? customerId,
    Object? metadata = _Undefined,
    Object? publicUrl = _Undefined,
    Object? expiresAt = _Undefined,
  }) {
    return UploadedFile(
      id: id is _i1.UuidValue? ? id : this.id,
      bucketName: bucketName ?? this.bucketName,
      objectKey: objectKey ?? this.objectKey,
      originalFilename: originalFilename ?? this.originalFilename,
      mimeType: mimeType ?? this.mimeType,
      size: size ?? this.size,
      status: status ?? this.status,
      uploadedAt: uploadedAt ?? this.uploadedAt,
      userId: userId ?? this.userId,
      customerId: customerId ?? this.customerId,
      metadata: metadata is String? ? metadata : this.metadata,
      publicUrl: publicUrl is String? ? publicUrl : this.publicUrl,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
    );
  }
}

class UploadedFileUpdateTable extends _i1.UpdateTable<UploadedFileTable> {
  UploadedFileUpdateTable(super.table);

  _i1.ColumnValue<String, String> bucketName(String value) => _i1.ColumnValue(
    table.bucketName,
    value,
  );

  _i1.ColumnValue<String, String> objectKey(String value) => _i1.ColumnValue(
    table.objectKey,
    value,
  );

  _i1.ColumnValue<String, String> originalFilename(String value) =>
      _i1.ColumnValue(
        table.originalFilename,
        value,
      );

  _i1.ColumnValue<String, String> mimeType(String value) => _i1.ColumnValue(
    table.mimeType,
    value,
  );

  _i1.ColumnValue<int, int> size(int value) => _i1.ColumnValue(
    table.size,
    value,
  );

  _i1.ColumnValue<_i2.UploadStatus, _i2.UploadStatus> status(
    _i2.UploadStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> uploadedAt(DateTime value) =>
      _i1.ColumnValue(
        table.uploadedAt,
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

  _i1.ColumnValue<String, String> metadata(String? value) => _i1.ColumnValue(
    table.metadata,
    value,
  );

  _i1.ColumnValue<String, String> publicUrl(String? value) => _i1.ColumnValue(
    table.publicUrl,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime? value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );
}

class UploadedFileTable extends _i1.Table<_i1.UuidValue?> {
  UploadedFileTable({super.tableRelation})
    : super(tableName: 'uploaded_files') {
    updateTable = UploadedFileUpdateTable(this);
    bucketName = _i1.ColumnString(
      'bucketName',
      this,
    );
    objectKey = _i1.ColumnString(
      'objectKey',
      this,
    );
    originalFilename = _i1.ColumnString(
      'originalFilename',
      this,
    );
    mimeType = _i1.ColumnString(
      'mimeType',
      this,
    );
    size = _i1.ColumnInt(
      'size',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    uploadedAt = _i1.ColumnDateTime(
      'uploadedAt',
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
    metadata = _i1.ColumnString(
      'metadata',
      this,
    );
    publicUrl = _i1.ColumnString(
      'publicUrl',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
  }

  late final UploadedFileUpdateTable updateTable;

  late final _i1.ColumnString bucketName;

  late final _i1.ColumnString objectKey;

  late final _i1.ColumnString originalFilename;

  late final _i1.ColumnString mimeType;

  late final _i1.ColumnInt size;

  late final _i1.ColumnEnum<_i2.UploadStatus> status;

  late final _i1.ColumnDateTime uploadedAt;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnUuid customerId;

  late final _i1.ColumnString metadata;

  late final _i1.ColumnString publicUrl;

  late final _i1.ColumnDateTime expiresAt;

  @override
  List<_i1.Column> get columns => [
    id,
    bucketName,
    objectKey,
    originalFilename,
    mimeType,
    size,
    status,
    uploadedAt,
    userId,
    customerId,
    metadata,
    publicUrl,
    expiresAt,
  ];
}

class UploadedFileInclude extends _i1.IncludeObject {
  UploadedFileInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue?> get table => UploadedFile.t;
}

class UploadedFileIncludeList extends _i1.IncludeList {
  UploadedFileIncludeList._({
    _i1.WhereExpressionBuilder<UploadedFileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UploadedFile.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => UploadedFile.t;
}

class UploadedFileRepository {
  const UploadedFileRepository._();

  /// Returns a list of [UploadedFile]s matching the given query parameters.
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
  Future<List<UploadedFile>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UploadedFileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UploadedFileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UploadedFileTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UploadedFile>(
      where: where?.call(UploadedFile.t),
      orderBy: orderBy?.call(UploadedFile.t),
      orderByList: orderByList?.call(UploadedFile.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [UploadedFile] matching the given query parameters.
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
  Future<UploadedFile?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UploadedFileTable>? where,
    int? offset,
    _i1.OrderByBuilder<UploadedFileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UploadedFileTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UploadedFile>(
      where: where?.call(UploadedFile.t),
      orderBy: orderBy?.call(UploadedFile.t),
      orderByList: orderByList?.call(UploadedFile.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [UploadedFile] by its [id] or null if no such row exists.
  Future<UploadedFile?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UploadedFile>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [UploadedFile]s in the list and returns the inserted rows.
  ///
  /// The returned [UploadedFile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<UploadedFile>> insert(
    _i1.Session session,
    List<UploadedFile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UploadedFile>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [UploadedFile] and returns the inserted row.
  ///
  /// The returned [UploadedFile] will have its `id` field set.
  Future<UploadedFile> insertRow(
    _i1.Session session,
    UploadedFile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UploadedFile>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [UploadedFile]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UploadedFile>> update(
    _i1.Session session,
    List<UploadedFile> rows, {
    _i1.ColumnSelections<UploadedFileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UploadedFile>(
      rows,
      columns: columns?.call(UploadedFile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UploadedFile]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UploadedFile> updateRow(
    _i1.Session session,
    UploadedFile row, {
    _i1.ColumnSelections<UploadedFileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UploadedFile>(
      row,
      columns: columns?.call(UploadedFile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UploadedFile] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UploadedFile?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<UploadedFileUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UploadedFile>(
      id,
      columnValues: columnValues(UploadedFile.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UploadedFile]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UploadedFile>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UploadedFileUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<UploadedFileTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UploadedFileTable>? orderBy,
    _i1.OrderByListBuilder<UploadedFileTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UploadedFile>(
      columnValues: columnValues(UploadedFile.t.updateTable),
      where: where(UploadedFile.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UploadedFile.t),
      orderByList: orderByList?.call(UploadedFile.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [UploadedFile]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UploadedFile>> delete(
    _i1.Session session,
    List<UploadedFile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UploadedFile>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [UploadedFile].
  Future<UploadedFile> deleteRow(
    _i1.Session session,
    UploadedFile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UploadedFile>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<UploadedFile>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UploadedFileTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UploadedFile>(
      where: where(UploadedFile.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UploadedFileTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UploadedFile>(
      where: where?.call(UploadedFile.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
