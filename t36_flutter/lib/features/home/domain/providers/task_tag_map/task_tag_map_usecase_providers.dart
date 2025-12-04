// manifest: manyToMany
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../usecases/task_tag_map_usecases.dart';
import '../../../data/providers/task_tag_map/task_tag_map_data_providers.dart';

part 'task_tag_map_usecase_providers.g.dart';

@riverpod
AddTagToTaskUseCase? addTagToTaskUseCase(Ref ref) {
  final repository = ref.watch(currentUserTaskTagMapRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return AddTagToTaskUseCase(repository);
}

@riverpod
RemoveTagFromTaskUseCase? removeTagFromTaskUseCase(Ref ref) {
  final repository = ref.watch(currentUserTaskTagMapRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return RemoveTagFromTaskUseCase(repository);
}

@riverpod
RemoveAllTagsFromTaskUseCase? removeAllTagsFromTaskUseCase(Ref ref) {
  final repository = ref.watch(currentUserTaskTagMapRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return RemoveAllTagsFromTaskUseCase(repository);
}

@riverpod
GetTagsForTaskUseCase? getTagsForTaskUseCase(Ref ref) {
  final repository = ref.watch(currentUserTaskTagMapRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return GetTagsForTaskUseCase(repository);
}

@riverpod
GetTasksForTagUseCase? getTasksForTagUseCase(Ref ref) {
  final repository = ref.watch(currentUserTaskTagMapRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return GetTasksForTagUseCase(repository);
}
