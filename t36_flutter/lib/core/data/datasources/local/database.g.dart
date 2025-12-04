// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SyncMetadataTableTable extends SyncMetadataTable
    with TableInfo<$SyncMetadataTableTable, SyncMetadataEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetadataTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSyncTimestampMeta = const VerificationMeta(
    'lastSyncTimestamp',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncTimestamp =
      GeneratedColumn<DateTime>(
        'last_sync_timestamp',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _syncVersionMeta = const VerificationMeta(
    'syncVersion',
  );
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
    'sync_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    entityType,
    userId,
    lastSyncTimestamp,
    syncVersion,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_metadata_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetadataEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('last_sync_timestamp')) {
      context.handle(
        _lastSyncTimestampMeta,
        lastSyncTimestamp.isAcceptableOrUnknown(
          data['last_sync_timestamp']!,
          _lastSyncTimestampMeta,
        ),
      );
    }
    if (data.containsKey('sync_version')) {
      context.handle(
        _syncVersionMeta,
        syncVersion.isAcceptableOrUnknown(
          data['sync_version']!,
          _syncVersionMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {entityType};
  @override
  SyncMetadataEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadataEntry(
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      lastSyncTimestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_sync_timestamp'],
      ),
      syncVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_version'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SyncMetadataTableTable createAlias(String alias) {
    return $SyncMetadataTableTable(attachedDatabase, alias);
  }
}

class SyncMetadataEntry extends DataClass
    implements Insertable<SyncMetadataEntry> {
  final String entityType;
  final int userId;
  final DateTime? lastSyncTimestamp;
  final int syncVersion;
  final DateTime updatedAt;
  const SyncMetadataEntry({
    required this.entityType,
    required this.userId,
    this.lastSyncTimestamp,
    required this.syncVersion,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['entity_type'] = Variable<String>(entityType);
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || lastSyncTimestamp != null) {
      map['last_sync_timestamp'] = Variable<DateTime>(lastSyncTimestamp);
    }
    map['sync_version'] = Variable<int>(syncVersion);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncMetadataTableCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadataTableCompanion(
      entityType: Value(entityType),
      userId: Value(userId),
      lastSyncTimestamp: lastSyncTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncTimestamp),
      syncVersion: Value(syncVersion),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncMetadataEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadataEntry(
      entityType: serializer.fromJson<String>(json['entityType']),
      userId: serializer.fromJson<int>(json['userId']),
      lastSyncTimestamp: serializer.fromJson<DateTime?>(
        json['lastSyncTimestamp'],
      ),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entityType': serializer.toJson<String>(entityType),
      'userId': serializer.toJson<int>(userId),
      'lastSyncTimestamp': serializer.toJson<DateTime?>(lastSyncTimestamp),
      'syncVersion': serializer.toJson<int>(syncVersion),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncMetadataEntry copyWith({
    String? entityType,
    int? userId,
    Value<DateTime?> lastSyncTimestamp = const Value.absent(),
    int? syncVersion,
    DateTime? updatedAt,
  }) => SyncMetadataEntry(
    entityType: entityType ?? this.entityType,
    userId: userId ?? this.userId,
    lastSyncTimestamp: lastSyncTimestamp.present
        ? lastSyncTimestamp.value
        : this.lastSyncTimestamp,
    syncVersion: syncVersion ?? this.syncVersion,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SyncMetadataEntry copyWithCompanion(SyncMetadataTableCompanion data) {
    return SyncMetadataEntry(
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      userId: data.userId.present ? data.userId.value : this.userId,
      lastSyncTimestamp: data.lastSyncTimestamp.present
          ? data.lastSyncTimestamp.value
          : this.lastSyncTimestamp,
      syncVersion: data.syncVersion.present
          ? data.syncVersion.value
          : this.syncVersion,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataEntry(')
          ..write('entityType: $entityType, ')
          ..write('userId: $userId, ')
          ..write('lastSyncTimestamp: $lastSyncTimestamp, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    entityType,
    userId,
    lastSyncTimestamp,
    syncVersion,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetadataEntry &&
          other.entityType == this.entityType &&
          other.userId == this.userId &&
          other.lastSyncTimestamp == this.lastSyncTimestamp &&
          other.syncVersion == this.syncVersion &&
          other.updatedAt == this.updatedAt);
}

class SyncMetadataTableCompanion extends UpdateCompanion<SyncMetadataEntry> {
  final Value<String> entityType;
  final Value<int> userId;
  final Value<DateTime?> lastSyncTimestamp;
  final Value<int> syncVersion;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SyncMetadataTableCompanion({
    this.entityType = const Value.absent(),
    this.userId = const Value.absent(),
    this.lastSyncTimestamp = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetadataTableCompanion.insert({
    required String entityType,
    required int userId,
    this.lastSyncTimestamp = const Value.absent(),
    this.syncVersion = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : entityType = Value(entityType),
       userId = Value(userId),
       updatedAt = Value(updatedAt);
  static Insertable<SyncMetadataEntry> custom({
    Expression<String>? entityType,
    Expression<int>? userId,
    Expression<DateTime>? lastSyncTimestamp,
    Expression<int>? syncVersion,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (entityType != null) 'entity_type': entityType,
      if (userId != null) 'user_id': userId,
      if (lastSyncTimestamp != null) 'last_sync_timestamp': lastSyncTimestamp,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetadataTableCompanion copyWith({
    Value<String>? entityType,
    Value<int>? userId,
    Value<DateTime?>? lastSyncTimestamp,
    Value<int>? syncVersion,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SyncMetadataTableCompanion(
      entityType: entityType ?? this.entityType,
      userId: userId ?? this.userId,
      lastSyncTimestamp: lastSyncTimestamp ?? this.lastSyncTimestamp,
      syncVersion: syncVersion ?? this.syncVersion,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (lastSyncTimestamp.present) {
      map['last_sync_timestamp'] = Variable<DateTime>(lastSyncTimestamp.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataTableCompanion(')
          ..write('entityType: $entityType, ')
          ..write('userId: $userId, ')
          ..write('lastSyncTimestamp: $lastSyncTimestamp, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConfigurationTableTable extends ConfigurationTable
    with TableInfo<$ConfigurationTableTable, ConfigurationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConfigurationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _groupMeta = const VerificationMeta('group');
  @override
  late final GeneratedColumn<String> group = GeneratedColumn<String>(
    'group',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Uuid().v7(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, int> lastModified =
      GeneratedColumn<int>(
        'last_modified',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<DateTime>(
        $ConfigurationTableTable.$converterlastModified,
      );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<SyncStatus>(
        $ConfigurationTableTable.$convertersyncStatus,
      );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    group,
    key,
    value,
    id,
    userId,
    customerId,
    createdAt,
    lastModified,
    syncStatus,
    isDeleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'configuration_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConfigurationTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group')) {
      context.handle(
        _groupMeta,
        group.isAcceptableOrUnknown(data['group']!, _groupMeta),
      );
    } else if (isInserting) {
      context.missing(_groupMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConfigurationTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConfigurationTableData(
      group: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}group'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastModified: $ConfigurationTableTable.$converterlastModified.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}last_modified'],
        )!,
      ),
      syncStatus: $ConfigurationTableTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
    );
  }

  @override
  $ConfigurationTableTable createAlias(String alias) {
    return $ConfigurationTableTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, int> $converterlastModified =
      const MillisecondEpochConverter();
  static TypeConverter<SyncStatus, String> $convertersyncStatus =
      const SyncStatusConverter();
}

class ConfigurationTableData extends DataClass
    implements Insertable<ConfigurationTableData> {
  final String group;
  final String key;
  final String value;
  final String id;
  final int userId;
  final String customerId;
  final DateTime createdAt;
  final DateTime lastModified;
  final SyncStatus syncStatus;
  final bool isDeleted;
  const ConfigurationTableData({
    required this.group,
    required this.key,
    required this.value,
    required this.id,
    required this.userId,
    required this.customerId,
    required this.createdAt,
    required this.lastModified,
    required this.syncStatus,
    required this.isDeleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group'] = Variable<String>(group);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<int>(userId);
    map['customer_id'] = Variable<String>(customerId);
    map['created_at'] = Variable<DateTime>(createdAt);
    {
      map['last_modified'] = Variable<int>(
        $ConfigurationTableTable.$converterlastModified.toSql(lastModified),
      );
    }
    {
      map['sync_status'] = Variable<String>(
        $ConfigurationTableTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  ConfigurationTableCompanion toCompanion(bool nullToAbsent) {
    return ConfigurationTableCompanion(
      group: Value(group),
      key: Value(key),
      value: Value(value),
      id: Value(id),
      userId: Value(userId),
      customerId: Value(customerId),
      createdAt: Value(createdAt),
      lastModified: Value(lastModified),
      syncStatus: Value(syncStatus),
      isDeleted: Value(isDeleted),
    );
  }

  factory ConfigurationTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConfigurationTableData(
      group: serializer.fromJson<String>(json['group']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      customerId: serializer.fromJson<String>(json['customerId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastModified: serializer.fromJson<DateTime>(json['lastModified']),
      syncStatus: serializer.fromJson<SyncStatus>(json['syncStatus']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'group': serializer.toJson<String>(group),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<int>(userId),
      'customerId': serializer.toJson<String>(customerId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastModified': serializer.toJson<DateTime>(lastModified),
      'syncStatus': serializer.toJson<SyncStatus>(syncStatus),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  ConfigurationTableData copyWith({
    String? group,
    String? key,
    String? value,
    String? id,
    int? userId,
    String? customerId,
    DateTime? createdAt,
    DateTime? lastModified,
    SyncStatus? syncStatus,
    bool? isDeleted,
  }) => ConfigurationTableData(
    group: group ?? this.group,
    key: key ?? this.key,
    value: value ?? this.value,
    id: id ?? this.id,
    userId: userId ?? this.userId,
    customerId: customerId ?? this.customerId,
    createdAt: createdAt ?? this.createdAt,
    lastModified: lastModified ?? this.lastModified,
    syncStatus: syncStatus ?? this.syncStatus,
    isDeleted: isDeleted ?? this.isDeleted,
  );
  ConfigurationTableData copyWithCompanion(ConfigurationTableCompanion data) {
    return ConfigurationTableData(
      group: data.group.present ? data.group.value : this.group,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastModified: data.lastModified.present
          ? data.lastModified.value
          : this.lastModified,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConfigurationTableData(')
          ..write('group: $group, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('customerId: $customerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastModified: $lastModified, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    group,
    key,
    value,
    id,
    userId,
    customerId,
    createdAt,
    lastModified,
    syncStatus,
    isDeleted,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConfigurationTableData &&
          other.group == this.group &&
          other.key == this.key &&
          other.value == this.value &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.customerId == this.customerId &&
          other.createdAt == this.createdAt &&
          other.lastModified == this.lastModified &&
          other.syncStatus == this.syncStatus &&
          other.isDeleted == this.isDeleted);
}

class ConfigurationTableCompanion
    extends UpdateCompanion<ConfigurationTableData> {
  final Value<String> group;
  final Value<String> key;
  final Value<String> value;
  final Value<String> id;
  final Value<int> userId;
  final Value<String> customerId;
  final Value<DateTime> createdAt;
  final Value<DateTime> lastModified;
  final Value<SyncStatus> syncStatus;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const ConfigurationTableCompanion({
    this.group = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.customerId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastModified = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConfigurationTableCompanion.insert({
    required String group,
    required String key,
    required String value,
    this.id = const Value.absent(),
    required int userId,
    required String customerId,
    this.createdAt = const Value.absent(),
    required DateTime lastModified,
    required SyncStatus syncStatus,
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : group = Value(group),
       key = Value(key),
       value = Value(value),
       userId = Value(userId),
       customerId = Value(customerId),
       lastModified = Value(lastModified),
       syncStatus = Value(syncStatus);
  static Insertable<ConfigurationTableData> custom({
    Expression<String>? group,
    Expression<String>? key,
    Expression<String>? value,
    Expression<String>? id,
    Expression<int>? userId,
    Expression<String>? customerId,
    Expression<DateTime>? createdAt,
    Expression<int>? lastModified,
    Expression<String>? syncStatus,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (group != null) 'group': group,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (customerId != null) 'customer_id': customerId,
      if (createdAt != null) 'created_at': createdAt,
      if (lastModified != null) 'last_modified': lastModified,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConfigurationTableCompanion copyWith({
    Value<String>? group,
    Value<String>? key,
    Value<String>? value,
    Value<String>? id,
    Value<int>? userId,
    Value<String>? customerId,
    Value<DateTime>? createdAt,
    Value<DateTime>? lastModified,
    Value<SyncStatus>? syncStatus,
    Value<bool>? isDeleted,
    Value<int>? rowid,
  }) {
    return ConfigurationTableCompanion(
      group: group ?? this.group,
      key: key ?? this.key,
      value: value ?? this.value,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      customerId: customerId ?? this.customerId,
      createdAt: createdAt ?? this.createdAt,
      lastModified: lastModified ?? this.lastModified,
      syncStatus: syncStatus ?? this.syncStatus,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (group.present) {
      map['group'] = Variable<String>(group.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastModified.present) {
      map['last_modified'] = Variable<int>(
        $ConfigurationTableTable.$converterlastModified.toSql(
          lastModified.value,
        ),
      );
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $ConfigurationTableTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfigurationTableCompanion(')
          ..write('group: $group, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('customerId: $customerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastModified: $lastModified, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SyncMetadataTableTable syncMetadataTable =
      $SyncMetadataTableTable(this);
  late final $ConfigurationTableTable configurationTable =
      $ConfigurationTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    syncMetadataTable,
    configurationTable,
  ];
}

typedef $$SyncMetadataTableTableCreateCompanionBuilder =
    SyncMetadataTableCompanion Function({
      required String entityType,
      required int userId,
      Value<DateTime?> lastSyncTimestamp,
      Value<int> syncVersion,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$SyncMetadataTableTableUpdateCompanionBuilder =
    SyncMetadataTableCompanion Function({
      Value<String> entityType,
      Value<int> userId,
      Value<DateTime?> lastSyncTimestamp,
      Value<int> syncVersion,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SyncMetadataTableTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetadataTableTable> {
  $$SyncMetadataTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncTimestamp => $composableBuilder(
    column: $table.lastSyncTimestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetadataTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetadataTableTable> {
  $$SyncMetadataTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncTimestamp => $composableBuilder(
    column: $table.lastSyncTimestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetadataTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetadataTableTable> {
  $$SyncMetadataTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncTimestamp => $composableBuilder(
    column: $table.lastSyncTimestamp,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncMetadataTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncMetadataTableTable,
          SyncMetadataEntry,
          $$SyncMetadataTableTableFilterComposer,
          $$SyncMetadataTableTableOrderingComposer,
          $$SyncMetadataTableTableAnnotationComposer,
          $$SyncMetadataTableTableCreateCompanionBuilder,
          $$SyncMetadataTableTableUpdateCompanionBuilder,
          (
            SyncMetadataEntry,
            BaseReferences<
              _$AppDatabase,
              $SyncMetadataTableTable,
              SyncMetadataEntry
            >,
          ),
          SyncMetadataEntry,
          PrefetchHooks Function()
        > {
  $$SyncMetadataTableTableTableManager(
    _$AppDatabase db,
    $SyncMetadataTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetadataTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetadataTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetadataTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> entityType = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<DateTime?> lastSyncTimestamp = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataTableCompanion(
                entityType: entityType,
                userId: userId,
                lastSyncTimestamp: lastSyncTimestamp,
                syncVersion: syncVersion,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String entityType,
                required int userId,
                Value<DateTime?> lastSyncTimestamp = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadataTableCompanion.insert(
                entityType: entityType,
                userId: userId,
                lastSyncTimestamp: lastSyncTimestamp,
                syncVersion: syncVersion,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetadataTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncMetadataTableTable,
      SyncMetadataEntry,
      $$SyncMetadataTableTableFilterComposer,
      $$SyncMetadataTableTableOrderingComposer,
      $$SyncMetadataTableTableAnnotationComposer,
      $$SyncMetadataTableTableCreateCompanionBuilder,
      $$SyncMetadataTableTableUpdateCompanionBuilder,
      (
        SyncMetadataEntry,
        BaseReferences<
          _$AppDatabase,
          $SyncMetadataTableTable,
          SyncMetadataEntry
        >,
      ),
      SyncMetadataEntry,
      PrefetchHooks Function()
    >;
typedef $$ConfigurationTableTableCreateCompanionBuilder =
    ConfigurationTableCompanion Function({
      required String group,
      required String key,
      required String value,
      Value<String> id,
      required int userId,
      required String customerId,
      Value<DateTime> createdAt,
      required DateTime lastModified,
      required SyncStatus syncStatus,
      Value<bool> isDeleted,
      Value<int> rowid,
    });
typedef $$ConfigurationTableTableUpdateCompanionBuilder =
    ConfigurationTableCompanion Function({
      Value<String> group,
      Value<String> key,
      Value<String> value,
      Value<String> id,
      Value<int> userId,
      Value<String> customerId,
      Value<DateTime> createdAt,
      Value<DateTime> lastModified,
      Value<SyncStatus> syncStatus,
      Value<bool> isDeleted,
      Value<int> rowid,
    });

class $$ConfigurationTableTableFilterComposer
    extends Composer<_$AppDatabase, $ConfigurationTableTable> {
  $$ConfigurationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get group => $composableBuilder(
    column: $table.group,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, int> get lastModified =>
      $composableBuilder(
        column: $table.lastModified,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ConfigurationTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ConfigurationTableTable> {
  $$ConfigurationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get group => $composableBuilder(
    column: $table.group,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastModified => $composableBuilder(
    column: $table.lastModified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConfigurationTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConfigurationTableTable> {
  $$ConfigurationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get group =>
      $composableBuilder(column: $table.group, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get customerId => $composableBuilder(
    column: $table.customerId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, int> get lastModified =>
      $composableBuilder(
        column: $table.lastModified,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$ConfigurationTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConfigurationTableTable,
          ConfigurationTableData,
          $$ConfigurationTableTableFilterComposer,
          $$ConfigurationTableTableOrderingComposer,
          $$ConfigurationTableTableAnnotationComposer,
          $$ConfigurationTableTableCreateCompanionBuilder,
          $$ConfigurationTableTableUpdateCompanionBuilder,
          (
            ConfigurationTableData,
            BaseReferences<
              _$AppDatabase,
              $ConfigurationTableTable,
              ConfigurationTableData
            >,
          ),
          ConfigurationTableData,
          PrefetchHooks Function()
        > {
  $$ConfigurationTableTableTableManager(
    _$AppDatabase db,
    $ConfigurationTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConfigurationTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConfigurationTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConfigurationTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> group = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> customerId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> lastModified = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConfigurationTableCompanion(
                group: group,
                key: key,
                value: value,
                id: id,
                userId: userId,
                customerId: customerId,
                createdAt: createdAt,
                lastModified: lastModified,
                syncStatus: syncStatus,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String group,
                required String key,
                required String value,
                Value<String> id = const Value.absent(),
                required int userId,
                required String customerId,
                Value<DateTime> createdAt = const Value.absent(),
                required DateTime lastModified,
                required SyncStatus syncStatus,
                Value<bool> isDeleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConfigurationTableCompanion.insert(
                group: group,
                key: key,
                value: value,
                id: id,
                userId: userId,
                customerId: customerId,
                createdAt: createdAt,
                lastModified: lastModified,
                syncStatus: syncStatus,
                isDeleted: isDeleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ConfigurationTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConfigurationTableTable,
      ConfigurationTableData,
      $$ConfigurationTableTableFilterComposer,
      $$ConfigurationTableTableOrderingComposer,
      $$ConfigurationTableTableAnnotationComposer,
      $$ConfigurationTableTableCreateCompanionBuilder,
      $$ConfigurationTableTableUpdateCompanionBuilder,
      (
        ConfigurationTableData,
        BaseReferences<
          _$AppDatabase,
          $ConfigurationTableTable,
          ConfigurationTableData
        >,
      ),
      ConfigurationTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SyncMetadataTableTableTableManager get syncMetadataTable =>
      $$SyncMetadataTableTableTableManager(_db, _db.syncMetadataTable);
  $$ConfigurationTableTableTableManager get configurationTable =>
      $$ConfigurationTableTableTableManager(_db, _db.configurationTable);
}
