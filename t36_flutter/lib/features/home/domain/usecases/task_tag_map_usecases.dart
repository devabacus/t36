// manifest: manyToMany
import '../repositories/task_tag_map_repository.dart';
import '../entities/task/task_entity.dart';
import '../entities/tag/tag_entity.dart';

class AddTagToTaskUseCase {
  final ITaskTagMapRepository _repository;
  AddTagToTaskUseCase(this._repository);

  Future<void> call({required String taskId, required String tagId}) {
    return _repository.addTagToTask(taskId: taskId, tagId: tagId);
  }
}

class RemoveTagFromTaskUseCase {
  final ITaskTagMapRepository _repository;
  RemoveTagFromTaskUseCase(this._repository);

  Future<void> call({required String taskId, required String tagId}) {
    return _repository.removeTagFromTask(taskId: taskId, tagId: tagId);
  }
}

class RemoveAllTagsFromTaskUseCase {
  final ITaskTagMapRepository _repository;
  RemoveAllTagsFromTaskUseCase(this._repository);

  Future<void> call(String taskId) {
    return _repository.removeAllTagsFromTask(taskId);
  }
}

class GetTagsForTaskUseCase {
  final ITaskTagMapRepository _repository;
  GetTagsForTaskUseCase(this._repository);

  Future<List<TagEntity>> call(String taskId) {
    return _repository.getTagsForTask(taskId);
  }
}

class GetTasksForTagUseCase {
  final ITaskTagMapRepository _repository;
  GetTasksForTagUseCase(this._repository);

  Future<List<TaskEntity>> call(String tagId) {
    return _repository.getTasksForTag(tagId);
  }
}
