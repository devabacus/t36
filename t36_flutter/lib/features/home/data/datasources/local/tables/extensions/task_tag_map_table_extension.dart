// manifest: manyToMany
import 'package:drift/drift.dart';
import 'package:t36_client/t36_client.dart' as serverpod;

import '../../../../../../../core/data/datasources/local/database.dart';
import '../../../../models/task_tag_map/task_tag_map_model.dart';
import '../../../../../../../core/data/datasources/local/database_types.dart';

extension TaskTagMapTableDataExtensions on TaskTagMapTableData {
  TaskTagMapModel toModel() => TaskTagMapModel(id: id, userId: userId, customerId: customerId, createdAt: createdAt, lastModified: lastModified, isDeleted: isDeleted, taskId: taskId, tagId: tagId);
}

extension TaskTagMapTableDataListExtensions on List<TaskTagMapTableData> {
  List<TaskTagMapModel> toModels() => map((data)=> data.toModel()).toList();
}

extension ServerpodTaskTagMapTableExtensions on serverpod.TaskTagMap {
  TaskTagMapTableCompanion toCompanion(SyncStatus status) =>
      TaskTagMapTableCompanion(
        id: Value(id.toString()),
        userId: Value(userId),
        customerId: Value(customerId.toString()),
        createdAt: Value(createdAt),
        lastModified: Value(lastModified),
        isDeleted: Value(isDeleted),
        syncStatus: Value(status),
        taskId: Value(taskId.toString()), tagId: Value(tagId.toString())
  );
}

