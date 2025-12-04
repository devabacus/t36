// manifest: entity
import 'package:drift/drift.dart';

import '../../../../../core/data/datasources/local/database.dart';
import 'package:t36_client/t36_client.dart' as serverpod;
import '../../../domain/entities/task/task_entity.dart';
import '../../../../../core/data/datasources/local/database_types.dart';
import '../task/task_model.dart';

extension TaskModelExtension on TaskModel {
  TaskEntity toEntity() => TaskEntity(
    id: id,
    userId: userId,
    customerId: customerId,
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,
    // === generated_start:simpleFields ===
  title: title,
  categoryId: categoryId
// === generated_end:simpleFields ===
  );

  TaskTableCompanion toCompanion() => TaskTableCompanion(
    id: Value(id),
    userId: Value(userId),
    customerId: Value(customerId),
    createdAt: Value(createdAt),
    lastModified: Value(lastModified),
    isDeleted: Value(isDeleted),
    syncStatus: Value(SyncStatus.local),

    // === generated_start:valueWrappedFields ===
  title: Value(title),
  categoryId: Value(categoryId.toString())
// === generated_end:valueWrappedFields ===
  );

  TaskTableCompanion toCompanionWithId() => toCompanion();
}

extension TaskModelListExtension on List<TaskModel> {
  List<TaskEntity> toEntities() =>
      map((model) => model.toEntity()).toList();
}

extension ServerpodTaskToModelExtension on serverpod.Task {
  TaskModel toModel() => TaskModel(
    id: id.toString(),
    userId: userId,
    customerId: customerId.toString(),
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,
    // === generated_start:serverpodToModelParams ===
  title: title,
        categoryId: categoryId?.toString()
// === generated_end:serverpodToModelParams ===
  );
}

extension ServerpodTaskListToModelListExtension
    on List<serverpod.Task> {
  List<TaskModel> toModels() =>
      map((serverpodModel) => serverpodModel.toModel()).toList();
}
