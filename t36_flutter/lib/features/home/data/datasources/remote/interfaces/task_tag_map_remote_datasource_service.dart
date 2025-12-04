// manifest: manyToMany
import 'package:t36_client/t36_client.dart';

abstract class ITaskTagMapRemoteDataSource {
  Future<List<TaskTagMap>> getTaskTagMapsSince(DateTime? since);
  Stream<TaskTagMapSyncEvent> watchEvents();
  Future<bool> checkConnection();
  Future<TaskTagMap> createTaskTagMap(taskTagMap);
  Future<bool> deleteTaskTagMapByTaskAndTag(UuidValue taskId, UuidValue tagId);
  Future<List<Tag>> getTagsForTask(UuidValue taskId);
  Future<List<Task>> getTasksForTag(UuidValue tagId);
}
