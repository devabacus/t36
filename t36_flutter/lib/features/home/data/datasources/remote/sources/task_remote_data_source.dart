// manifest: entity
import 'dart:async';
import 'package:t36_client/t36_client.dart';
import '../interfaces/task_remote_datasource_service.dart';

class TaskRemoteDataSource implements ITaskRemoteDataSource {
  final Client _client;

  TaskRemoteDataSource(this._client);

  @override
  Future<List<Task>> getTasks() async {
    try {
      final tasks = await _client.task.getTasks();
      return tasks;
    } catch (e) {
      print('Ошибка получения: $e');
      rethrow;
    }
  }

  @override
  Future<List<Task>> getTasksSince(DateTime? since) async {
    try {
      final tasks = await _client.task.getTasksSince(since);
      return tasks;
    } catch (e) {
      print('Ошибка получения c $since: $e');
      rethrow;
    }
  }

  @override
  Future<Task?> getTaskById(UuidValue id) async {
    try {
      final task = await _client.task.getTaskById(id);
      return task;
    } catch (e) {
      print('Ошибка получения по ID $id: $e');
      rethrow;
    }
  }

  @override
  Future<Task> createTask(Task task) async {
    print('🚀 Remote: Отправляем на сервер: ${_client.host}');

    try {
      final result = await _client.task.createTask(task);
      print('✅ Remote: Успешно создано на сервере');
      return result;
    } catch (e) {
      print('❌ Remote: Ошибка создания на сервере: $e');
      rethrow;
    }
  }

  @override
  Future<bool> updateTask(Task task) async {
    try {
      final result = await _client.task.updateTask(task);
      return result;
    } catch (e) {
      print('Ошибка обновления: $e');
      rethrow;
    }
  }

  @override
  Stream<TaskSyncEvent> watchEvents() {
    try {
      return _client.task.watchEvents();
    } catch (e) {
      print('❌ Ошибка подписки на события сервера: $e');
      return Stream.value(TaskSyncEvent(type: SyncEventType.create));
    }
  }

  @override
  Future<bool> checkConnection() async {
    try {
      await _client.task.getTasks(limit: 1);
      return true;
    } catch (e) {
      print('Проверка подключения неудачна: $e');
      return false;
    }
  }

  @override
  Future<List<Task>> syncTasks(List<Task> localTasks) async {
    try {
      final serverTasks = await getTasks();

      print(
        'Синхронизация: локальных ${localTasks.length}, серверных ${serverTasks.length}',
      );
      return serverTasks;
    } catch (e) {
      print('Ошибка синхронизации: $e');
      return localTasks;
    }
  }

  // === generated_start:oneToManyMethods ===
  @override
  Future<List<Task>> getTasksByCategoryId(UuidValue categoryId) async {
    try {
      final result = await _client.task.getTasksByCategoryId(categoryId);
      return result;
    } catch (e) {
      print('Ошибка получения Tasks по Category ID: $e');
      rethrow;
    }
  }
 // === generated_end:oneToManyMethods ===
}

