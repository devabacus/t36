// manifest: entity
// === generated_start:base ===
import '../entities/task/task_entity.dart';

abstract class ITaskRepository {
  Future<List<TaskEntity>> getTasks();
  Stream<List<TaskEntity>> watchTasks();
  Future<TaskEntity?> getTaskById(String id);
  Future<List<TaskEntity>> getTasksByIds(List<String> ids);
  Future<String> createTask(TaskEntity task);
  Future<bool> updateTask(TaskEntity task);
  Future<bool> deleteTask(String id);
  Future<void> syncWithServer();
  void initEventBasedSync();
  void dispose();
  // === generated_end:base ===

  // === generated_start:oneToManyMethods ===
  Future<List<TaskEntity>> getTasksByCategoryId(String categoryId);
  // === generated_end:oneToManyMethods ===
}

