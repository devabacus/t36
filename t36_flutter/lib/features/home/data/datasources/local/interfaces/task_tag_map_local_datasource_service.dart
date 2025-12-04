// manifest: manyToMany
import '../../../../../../core/data/datasources/local/database.dart';
import '../../../../../../core/data/datasources/local/database_types.dart';
import '../../../models/task_tag_map/task_tag_map_model.dart';

abstract class ITaskTagMapLocalDataSource {
  // === Основные CRUD-операции ===
  Future<String> createTaskTagMap(TaskTagMapModel model);
  Future<bool> updateTaskTagMap(TaskTagMapModel model);
  Future<int> updateRelationsByTaskId(String taskId, TaskTagMapTableCompanion companion, {required int userId, required String customerId});
  Future<TaskTagMapModel?> getRelationById(String id, {required int userId, required String customerId});
  Future<TaskTagMapModel?> getRelationByTaskAndTag(String taskId, String tagId, {required int userId, required String customerId});
  Stream<List<TaskTagMapModel>> watchAllRelations({required int userId, required String customerId});
  Future<List<TaskTagMapTableData>> getAllLocalChanges({required int userId, required String customerId});
  Future<List<TaskTagMapTableData>> reconcileServerChanges(List<dynamic> serverChanges, {required int userId, required String customerId});
  Future<int> physicallyDeleteTaskTagMap(String id, {required int userId, required String customerId});
  Future<void> insertOrUpdateFromServer(dynamic serverChange, SyncStatus status);
  Future<void> handleSyncEvent(dynamic event, {required int userId, required String customerId});
}
