// manifest: entity
import 'package:t36_client/t36_client.dart';

abstract class ITaskRemoteDataSource {
  Stream<TaskSyncEvent> watchEvents();
  Future<List<Task>> getTasks();
  Future<List<Task>> getTasksSince(DateTime? since); 
  Future<List<Task>> syncTasks(List<Task> localTasks);
  Future<Task?> getTaskById(UuidValue id);
  Future<Task> createTask(Task task);
  Future<bool> updateTask(Task task);
  Future<bool> checkConnection();

  // === generated_start:oneToManyMethods ===
  Future<List<Task>> getTasksByCategoryId(UuidValue categoryId);
// === generated_end:oneToManyMethods ===
}

