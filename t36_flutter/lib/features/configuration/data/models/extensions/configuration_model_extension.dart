// manifest: startProject
import 'package:drift/drift.dart';

import '../../../../../core/data/datasources/local/database.dart';
import 'package:t36_client/t36_client.dart' as serverpod;
import '../../../domain/entities/configuration/configuration_entity.dart';
import '../../../../../core/data/datasources/local/database_types.dart';
import '../configuration/configuration_model.dart';

extension ConfigurationModelExtension on ConfigurationModel {
  ConfigurationEntity toEntity() => ConfigurationEntity(
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

  ConfigurationTableCompanion toCompanion() => ConfigurationTableCompanion(
    id: Value(id),
    userId: Value(userId),
    customerId: Value(customerId),
    createdAt: Value(createdAt),
    lastModified: Value(lastModified),
    isDeleted: Value(isDeleted),
    syncStatus: Value(SyncStatus.local),

    // === generated_start:valueWrappedFields ===
  group: Value(group),
  key: Value(key),
  value: Value(value)
// === generated_end:valueWrappedFields ===
  );

  ConfigurationTableCompanion toCompanionWithId() => toCompanion();
}

extension ConfigurationModelListExtension on List<ConfigurationModel> {
  List<ConfigurationEntity> toEntities() =>
      map((model) => model.toEntity()).toList();
}

extension ServerpodConfigurationToModelExtension on serverpod.Configuration {
  ConfigurationModel toModel() => ConfigurationModel(
    id: id.toString(),
    userId: userId,
    customerId: customerId.toString(),
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,
    // === generated_start:serverpodToModelParams ===
  group: group,
        key: key,
        value: value
// === generated_end:serverpodToModelParams ===
  );
}

extension ServerpodConfigurationListToModelListExtension
    on List<serverpod.Configuration> {
  List<ConfigurationModel> toModels() =>
      map((serverpodModel) => serverpodModel.toModel()).toList();
}
