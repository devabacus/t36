// manifest: manyToMany
import '../../../../core/sync/sync_registry.dart';
import '../entities/tag/tag_entity.dart';
import '../entities/task/task_entity.dart';
import '../entities/task_tag_map/task_tag_map_entity.dart';

abstract class ITaskTagMapRepository implements ISyncableRepository {
  
  Stream<List<TaskTagMapEntity>> watchTaskTagMaps();
  Future<String> createTaskTagMap(TaskTagMapEntity taskTagMap);
  Future<bool> updateTaskTagMap(TaskTagMapEntity taskTagMap);
  Future<bool> deleteTaskTagMap(TaskTagMapEntity taskTagMap);
  Future<TaskTagMapEntity?> getTaskTagMapById(String id);
  Future<void> addTagToTask({required String taskId, required String tagId});
  Future<void> removeTagFromTask({
    required String taskId,
    required String tagId,
  });
  Future<void> removeAllTagsFromTask(String taskId);
  Future<List<TagEntity>> getTagsForTask(String taskId);
  Future<List<TaskEntity>> getTasksForTag(String tagId);
}
