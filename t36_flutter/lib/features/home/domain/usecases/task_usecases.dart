// manifest: entity
import '../repositories/task_repository.dart';
import '../entities/task/task_entity.dart';

class CreateTaskUseCase {
  final ITaskRepository _repository;
  
  CreateTaskUseCase(this._repository);
  
  Future<String> call(TaskEntity task) {
    return _repository.createTask(task);
  }
}

class UpdateTaskUseCase {
  final ITaskRepository _repository;

  UpdateTaskUseCase(this._repository);

  Future<bool> call(TaskEntity task) async {
    return _repository.updateTask(task);
  }
}

class DeleteTaskUseCase {
  final ITaskRepository _repository;

  DeleteTaskUseCase(this._repository);

  Future<bool> call(String id) async {
    return _repository.deleteTask(id);
  }
}

class GetTasksUseCase {
  final ITaskRepository _repository;

  GetTasksUseCase(this._repository);

  Future<List<TaskEntity>> call() {
    return _repository.getTasks();
  }
}

class GetTaskByIdUseCase {
  final ITaskRepository _repository;

  GetTaskByIdUseCase(this._repository);

  Future<TaskEntity?> call(String id) {
    return _repository.getTaskById(id);
  }
}

class WatchTasksUseCase {
  final ITaskRepository _repository;

  WatchTasksUseCase(this._repository);

  Stream<List<TaskEntity>> call() {
    return _repository.watchTasks();
  }
}


// === generated_start:oneToManyMethods ===
class GetTasksByCategoryIdUseCase {
  final ITaskRepository _repository;

  GetTasksByCategoryIdUseCase(this._repository);

  Future<List<TaskEntity>> call(String categoryId) {
    return _repository.getTasksByCategoryId(categoryId);
  }
}
// === generated_end:oneToManyMethods ===