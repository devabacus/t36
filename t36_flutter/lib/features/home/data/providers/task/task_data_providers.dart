// manifest: entity
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/data/datasources/local/providers/database_provider.dart';
import '../../../../../core/data/datasources/local/providers/sync_metadata_providers.dart';
import '../../../../../core/providers/serverpod_client_provider.dart';
import '../../../../../core/providers/session_manager_provider.dart';
import '../../../../../core/sync/sync_registry.dart';
import '../../../../../core/services/logger/logger_provider.dart';
import '../../../../auth/presentation/providers/auth_state_providers.dart';
import '../../../domain/repositories/task_repository.dart';
import '../../datasources/local/daos/task/task_dao.dart';
import '../../datasources/local/datasources/task_local_data_source.dart';
import '../../datasources/local/interfaces/task_local_datasource_service.dart';
import '../../datasources/remote/interfaces/task_remote_datasource_service.dart';
import '../../datasources/remote/sources/task_remote_data_source.dart';
import '../../repositories/task_repository_impl.dart';

part 'task_data_providers.g.dart';

@riverpod
TaskDao taskDao(Ref ref) {
  final databaseService = ref.read(databaseServiceProvider);
  return TaskDao(databaseService);
}

@riverpod
ITaskLocalDataSource taskLocalDataSource(Ref ref) {
  final taskDao = ref.read(taskDaoProvider);
  return TaskLocalDataSource(taskDao);
}

@riverpod
ITaskRemoteDataSource taskRemoteDataSource(Ref ref) {
  ref.keepAlive();
  final client = ref.watch(serverpodClientProvider);
  return TaskRemoteDataSource(client);
}

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
@riverpod
ITaskRepository taskRepository(
  Ref ref, {
  required int userId,
  required String customerId,
}) {
  // ref.keepAlive();

  // Получаем все зависимости
  final localDataSource = ref.watch(taskLocalDataSourceProvider);
  final remoteDataSource = ref.watch(taskRemoteDataSourceProvider);
  final syncMetadataLocalDataSource = ref.watch(
    syncMetadataLocalDataSourceProvider,
  );

  final logger = ref.watch(loggerServiceProvider);

  // Создаем репозиторий с фиксированным userId
  final repository = TaskRepositoryImpl(
    localDataSource,
    remoteDataSource,
    syncMetadataLocalDataSource,
    logger,
    userId,
    customerId,
  );

  // Автоматически регистрируем в реестре
  final registry = ref.read(syncRegistryProvider);
  registry.registerRepository('tasks_${userId}_$customerId', repository);

  ref.onDispose(() {
    registry.unregisterRepository('tasks_${userId}_$customerId');
    repository.dispose();
  });

  return repository;
}

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
@riverpod
ITaskRepository? currentUserTaskRepository(Ref ref) {
  final currentUser = ref.watch(authStateChangesProvider).value;
  final currentCustomerId = ref.watch(currentCustomerIdProvider);

  if (currentUser?.id == null || currentCustomerId == null) {
    // Если пользователь не авторизован, возвращаем null
    return null;
  }

  // Возвращаем репозиторий для текущего пользователя
  return ref.watch(
    taskRepositoryProvider(
      userId: currentUser!.id!,
      customerId: currentCustomerId.toString(),
    ),
  );
}
