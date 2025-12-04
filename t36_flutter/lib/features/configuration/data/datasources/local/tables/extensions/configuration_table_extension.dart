// manifest: startProject
import 'package:drift/drift.dart';
import 'package:t36_client/t36_client.dart' as serverpod;

import '../../../../../../../core/data/datasources/local/database.dart';
import '../../../../models/configuration/configuration_model.dart';
import '../../../../../../../core/data/datasources/local/database_types.dart';

extension ConfigurationTableDataExtensions on ConfigurationTableData {
  ConfigurationModel toModel() => ConfigurationModel(
    id: id,
    userId: userId,
    customerId: customerId,
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,

// === generated_start:simpleFields ===
  group: group,
  key: key,
  value: value
// === generated_end:simpleFields ===
  );
}

extension ConfigurationTableDataListExtensions on List<ConfigurationTableData> {
  List<ConfigurationModel> toModels() => map((data) => data.toModel()).toList();
}

extension ServerpodConfigurationTableExtensions on serverpod.Configuration {
  ConfigurationTableCompanion toCompanion(SyncStatus status) =>
      ConfigurationTableCompanion(
        id: Value(id.toString()),
        userId: Value(userId),
        customerId: Value(customerId.toString()),
        createdAt: Value(createdAt),
        lastModified: Value(lastModified),
        isDeleted: Value(isDeleted),
        syncStatus: Value(status),

// === generated_start:valueWrappedFields ===
  group: Value(group),
  key: Value(key),
  value: Value(value)
// === generated_end:valueWrappedFields ===
      );
}
