// manifest: startProject
import '../../entities/configuration/configuration_entity.dart';
import '../../../data/models/configuration/configuration_model.dart';
import 'package:t36_client/t36_client.dart' as serverpod;

extension ConfigurationEntityExtension on ConfigurationEntity {
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

extension ConfigurationEntityListExtension on List<ConfigurationEntity> {
  List<ConfigurationModel> toModels() => map((entity) => entity.toModel()).toList();
}

extension ServerpodConfigurationEntityExtensions on ConfigurationEntity {
  serverpod.Configuration toServerpodConfiguration() => serverpod.Configuration(
    id: serverpod.UuidValue.fromString(id),
    userId: userId,
    customerId: serverpod.UuidValue.fromString(customerId),
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
