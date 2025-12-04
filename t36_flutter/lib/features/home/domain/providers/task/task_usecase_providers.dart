// manifest: entity
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../usecases/task_usecases.dart';
import '../../../data/providers/task/task_data_providers.dart';

part 'task_usecase_providers.g.dart';

@riverpod
GetTasksUseCase? getTasksUseCase(Ref ref) {
  final repository = ref.watch(currentUserTaskRepositoryProvider);
  if (repository == null) {
    // пользователь не авторизован
    return null;
  }
  return GetTasksUseCase(repository);
}   

@riverpod
WatchTasksUseCase? watchTasksUseCase(Ref ref) {
  final repository = ref.watch(currentUserTaskRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return WatchTasksUseCase(repository);
}

@riverpod
CreateTaskUseCase? createTaskUseCase(Ref ref) {
  final repository = ref.watch(currentUserTaskRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return CreateTaskUseCase(repository);
}

@riverpod
DeleteTaskUseCase? deleteTaskUseCase(Ref ref) {
  final repository = ref.watch(currentUserTaskRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return DeleteTaskUseCase(repository);
}

@riverpod
UpdateTaskUseCase? updateTaskUseCase(Ref ref) {
  final repository = ref.watch(currentUserTaskRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return UpdateTaskUseCase(repository);
}

@riverpod
GetTaskByIdUseCase? getTaskByIdUseCase(Ref ref) {
  final repository = ref.watch(currentUserTaskRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return GetTaskByIdUseCase(repository);
}
  
    

// === generated_start:oneToManyMethods === 
@riverpod
GetTasksByCategoryIdUseCase? getTasksByCategoryIdUseCase(Ref ref) {
  final repository = ref.watch(currentUserTaskRepositoryProvider);
  if (repository == null) {
    // пользователь не авторизован
    return null;
  }
  return GetTasksByCategoryIdUseCase(repository);
}
// === generated_end:oneToManyMethods ===