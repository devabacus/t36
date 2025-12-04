// manifest: manyToMany
import 'package:drift/drift.dart';

import '../../../../../core/data/datasources/local/database.dart';
import 'package:t36_client/t36_client.dart' as serverpod;
import '../../../domain/entities/task_tag_map/task_tag_map_entity.dart';
import '../../../../../core/data/datasources/local/database_types.dart';
import '../task_tag_map/task_tag_map_model.dart';

extension TaskTagMapModelExtension on TaskTagMapModel {
  TaskTagMapEntity toEntity() => TaskTagMapEntity(
        id: id,
        userId: userId,
        customerId: customerId,
        createdAt: createdAt,
        lastModified: lastModified,
        isDeleted: isDeleted,
         taskId: taskId, tagId: tagId
      );

  TaskTagMapTableCompanion toCompanion() => TaskTagMapTableCompanion(
        id: Value(id),
        userId: Value(userId),
        customerId: Value(customerId),
        createdAt: Value(createdAt),
        lastModified: Value(lastModified),
        isDeleted: Value(isDeleted),
        syncStatus: Value(SyncStatus.local),
        taskId: Value(taskId), tagId: Value(tagId)

      );
  
  TaskTagMapTableCompanion toCompanionWithId() => toCompanion();
}

extension TaskTagMapModelListExtension on List<TaskTagMapModel> {
  List<TaskTagMapEntity> toEntities() =>
      map((model) => model.toEntity()).toList();
}

extension ServerpodTaskTagMapToModelExtension on serverpod.TaskTagMap {
  TaskTagMapModel toModel() => TaskTagMapModel(
        id: id.toString(),
        userId: userId,
        customerId: customerId.toString(),
        createdAt: createdAt,
        lastModified: lastModified,
        isDeleted: isDeleted,
        taskId: taskId.toString(), tagId: tagId.toString()
      );
}

extension ServerpodTaskTagMapListToModelListExtension on List<serverpod.TaskTagMap> {
  List<TaskTagMapModel> toModels() =>
      map((serverpodModel) => serverpodModel.toModel()).toList();
}

  