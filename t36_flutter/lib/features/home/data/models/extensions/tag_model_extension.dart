// manifest: entity
import 'package:drift/drift.dart';

import '../../../../../core/data/datasources/local/database.dart';
import 'package:t36_client/t36_client.dart' as serverpod;
import '../../../domain/entities/tag/tag_entity.dart';
import '../../../../../core/data/datasources/local/database_types.dart';
import '../tag/tag_model.dart';

extension TagModelExtension on TagModel {
  TagEntity toEntity() => TagEntity(
    id: id,
    userId: userId,
    customerId: customerId,
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,
    // === generated_start:simpleFields ===
  title: title
// === generated_end:simpleFields ===
  );

  TagTableCompanion toCompanion() => TagTableCompanion(
    id: Value(id),
    userId: Value(userId),
    customerId: Value(customerId),
    createdAt: Value(createdAt),
    lastModified: Value(lastModified),
    isDeleted: Value(isDeleted),
    syncStatus: Value(SyncStatus.local),

    // === generated_start:valueWrappedFields ===
  title: Value(title)
// === generated_end:valueWrappedFields ===
  );

  TagTableCompanion toCompanionWithId() => toCompanion();
}

extension TagModelListExtension on List<TagModel> {
  List<TagEntity> toEntities() =>
      map((model) => model.toEntity()).toList();
}

extension ServerpodTagToModelExtension on serverpod.Tag {
  TagModel toModel() => TagModel(
    id: id.toString(),
    userId: userId,
    customerId: customerId.toString(),
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,
    // === generated_start:serverpodToModelParams ===
  title: title
// === generated_end:serverpodToModelParams ===
  );
}

extension ServerpodTagListToModelListExtension
    on List<serverpod.Tag> {
  List<TagModel> toModels() =>
      map((serverpodModel) => serverpodModel.toModel()).toList();
}
