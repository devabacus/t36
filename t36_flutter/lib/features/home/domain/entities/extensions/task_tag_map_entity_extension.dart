// manifest: manyToMany
import '../../entities/task_tag_map/task_tag_map_entity.dart';
import '../../../data/models/task_tag_map/task_tag_map_model.dart';
import 'package:t36_client/t36_client.dart' as serverpod;

extension TaskTagMapEntityExtension on TaskTagMapEntity {
  TaskTagMapModel toModel() => TaskTagMapModel(
        id: id,
        userId: userId,
        customerId: customerId,
        createdAt: createdAt,
        lastModified: lastModified,
        isDeleted: isDeleted,
        taskId: taskId, tagId: tagId
      );
}

extension TaskTagMapEntityListExtension on List<TaskTagMapEntity> {
  List<TaskTagMapModel> toModels() => map((entity) => entity.toModel()).toList();
}

extension ServerpodTaskTagMapEntityExtensions on TaskTagMapEntity {
  serverpod.TaskTagMap toServerpodTaskTagMap() => serverpod.TaskTagMap(
    id: serverpod.UuidValue.fromString(id),
    userId: userId,
    customerId: serverpod.UuidValue.fromString(customerId),
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,
    taskId: serverpod.UuidValue.fromString(taskId), tagId: serverpod.UuidValue.fromString(tagId)
  );
  }
