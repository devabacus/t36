// manifest: entity
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/task/task_entity.dart';
import '../../../domain/providers/task/task_usecase_providers.dart';

part 'task_state_providers.g.dart';

@riverpod
class Tasks extends _$Tasks {
  @override
  Future<List<TaskEntity>> build() {
    return ref.read(getTasksUseCaseProvider)!();
  }

  Future<void> addTask(TaskEntity task) async {
    state = await AsyncValue.guard(() async {
      await ref.read(createTaskUseCaseProvider)!(task);
      return ref.read(getTasksUseCaseProvider)!();
    });
  }

  Future<void> updateTask(TaskEntity task) async {
    state = await AsyncValue.guard(() async {
      await ref.read(updateTaskUseCaseProvider)!(task);
      return ref.read(getTasksUseCaseProvider)!();
    });
  }

  Future<void> deleteTask(String id) async {
    state = await AsyncValue.guard(() async {
      await ref.read(deleteTaskUseCaseProvider)!(id);
      return ref.read(getTasksUseCaseProvider)!();
    });
  }
}

@riverpod
Stream<List<TaskEntity>> tasksStream(Ref ref) {
  final watchUseCase = ref.watch(watchTasksUseCaseProvider);

  if (watchUseCase == null) {
    return Stream.value(<TaskEntity>[]);
  }

  return watchUseCase();
}
