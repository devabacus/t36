// manifest: entity
import 'package:t36/core/data/datasources/local/database.dart';

import '../../../models/task/task_model.dart';
import '../../../../../../core/data/datasources/local/database_types.dart';

abstract class ITaskLocalDataSource {
  Future<List<TaskModel>> getTasks({required int userId, required String customerId});
  Stream<List<TaskModel>> watchTasks({required int userId, required String customerId});
  Future<TaskModel?> getTaskById(String id, {required int userId, required String customerId});
  Future<List<TaskModel>> getTasksByIds(List<String> ids, {required int userId, required String customerId});
  Future<String> createTask(TaskModel task);
  Future<bool> updateTask(TaskModel task);
  Future<bool> deleteTask(String id, {required int userId, required String customerId});
  Future<List<TaskTableData>> getAllLocalChanges({required int userId, required String customerId});
  Future<List<TaskTableData>> reconcileServerChanges(List<dynamic> serverChanges, {required int userId, required String customerId});
  Future<void> physicallyDeleteTask(String id, {required int userId, required String customerId});
  Future<void> insertOrUpdateFromServer(dynamic serverChange, SyncStatus status);
  Future<void> handleSyncEvent(dynamic event, {required int userId, required String customerId});

  // === generated_start:oneToManyMethods ===
  Future<List<TaskModel>> getTasksByCategoryId(String categoryId, {required int userId, required String customerId}); 
 // === generated_end:oneToManyMethods ===
}

