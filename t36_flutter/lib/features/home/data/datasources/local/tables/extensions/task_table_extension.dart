// manifest: entity
import 'package:drift/drift.dart';
import 'package:t36_client/t36_client.dart' as serverpod;

import '../../../../../../../core/data/datasources/local/database.dart';
import '../../../../models/task/task_model.dart';
import '../../../../../../../core/data/datasources/local/database_types.dart';

extension TaskTableDataExtensions on TaskTableData {
  TaskModel toModel() => TaskModel(
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
}

extension TaskTableDataListExtensions on List<TaskTableData> {
  List<TaskModel> toModels() => map((data) => data.toModel()).toList();
}

extension ServerpodTaskTableExtensions on serverpod.Task {
  TaskTableCompanion toCompanion(SyncStatus status) =>
      TaskTableCompanion(
        id: Value(id.toString()),
        userId: Value(userId),
        customerId: Value(customerId.toString()),
        createdAt: Value(createdAt),
        lastModified: Value(lastModified),
        isDeleted: Value(isDeleted),
        syncStatus: Value(status),

// === generated_start:valueWrappedFields ===
  title: Value(title),
  categoryId: Value(categoryId.toString())
// === generated_end:valueWrappedFields ===
      );
}
