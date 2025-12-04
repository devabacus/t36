// manifest: manyToMany
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/tag/tag_entity.dart';
import '../../../domain/providers/task_tag_map/task_tag_map_usecase_providers.dart';

part 'task_tag_map_state_providers.g.dart';

@riverpod
class RelatedTagsForTask extends _$RelatedTagsForTask {
  @override
  Future<List<TagEntity>> build(String taskId) {
    final useCase = ref.read(getTagsForTaskUseCaseProvider);
    // Проверяем, что use case доступен (пользователь авторизован)
    if (useCase == null) return Future.value([]);
    return useCase(taskId);
  }

  Future<void> addTag({required String tagId}) async {
    final useCase = ref.read(addTagToTaskUseCaseProvider);
    if (useCase == null) return;
    
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await useCase(
        taskId: taskId,
        tagId: tagId,
      );
      // Перезагружаем данные, чтобы обновить UI
      return build(taskId);
    });
  }

  Future<void> removeTag({required String tagId}) async {
    final useCase = ref.read(removeTagFromTaskUseCaseProvider);
    if (useCase == null) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {    
      await useCase(
        taskId: taskId,
        tagId: tagId,
      );
      return build(taskId);
    });
  }
}
