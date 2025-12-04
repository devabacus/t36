// manifest: manyToMany
import 'dart:async';
import 'package:t36_client/t36_client.dart';
import '../interfaces/task_tag_map_remote_datasource_service.dart';

class TaskTagMapRemoteDataSource implements ITaskTagMapRemoteDataSource {
  final Client _client;
  TaskTagMapRemoteDataSource(this._client);

  @override
  Future<List<TaskTagMap>> getTaskTagMapsSince(DateTime? since) async {
    try {
      return await _client.taskTagMap.getTaskTagMapsSince(since);
    } catch (e) {
      print('❌ TaskTagMapRemoteDataSource.getTaskTagMapsSince: $e');
      rethrow;
    }
  }

  @override
  Stream<TaskTagMapSyncEvent> watchEvents() {
    try {
      return _client.taskTagMap.watchEvents();
    } catch (e) {
      print('❌ Ошибка подписки на события TaskTagMap: $e');
      // Возвращаем пустой стрим в случае ошибки, чтобы приложение не падало
      return Stream.value(TaskTagMapSyncEvent(type: SyncEventType.create));
    }
  }
  
  @override
  Future<bool> checkConnection() async {
    try {
      await getTaskTagMapsSince(DateTime.now().subtract(const Duration(seconds: 1)));
      return true;
    } catch (e) {
      print('Проверка подключения TaskTagMap неудачна: $e');
      return false;
    }
  }

  @override
  Future<TaskTagMap> createTaskTagMap(taskTagMap) async {
    try {
      print('🚀 Remote: Отправляем на сервер создание связи Task-Tag');
      final result = await _client.taskTagMap.createTaskTagMap(taskTagMap);
      print('✅ Remote: Связь Task-Tag успешно создана на сервере');
      return result;
    } catch (e) {
      print('❌ Remote: Ошибка создания связи Task-Tag на сервере: $e');
      rethrow;
    }
  }
    
  @override
  Future<List<Tag>> getTagsForTask(UuidValue taskId) async {
    try {
      return await _client.taskTagMap.getTagsForTask(taskId);
    } catch (e) {
      print('❌ Remote: Ошибка получения тегов для задачи $taskId: $e');
      rethrow;
    }
  }

  @override
  Future<List<Task>> getTasksForTag(UuidValue tagId) async {
    try {
      return await _client.taskTagMap.getTasksForTag(tagId);
    } catch (e) {
      print('❌ Remote: Ошибка получения задач для тега $tagId: $e');
      rethrow;
    }
  }

 @override
  Future<bool> deleteTaskTagMapByTaskAndTag(UuidValue taskId, UuidValue tagId) async {
    try {
      return await _client.taskTagMap.deleteTaskTagMapByTaskAndTag(taskId, tagId);
    } catch (e) {
      print('❌ Remote: Ошибка удаления связи по Task/Tag ID: $e');
      rethrow;
    }
  }

}