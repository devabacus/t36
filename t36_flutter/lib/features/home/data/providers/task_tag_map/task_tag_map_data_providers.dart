// manifest: manyToMany
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../auth/presentation/providers/auth_state_providers.dart';
import '../../datasources/remote/interfaces/task_tag_map_remote_datasource_service.dart';
import '../../datasources/remote/sources/task_tag_map_remote_data_source.dart';
import '../../../../../core/data/datasources/local/interfaces/sync_metadata_local_datasource_service.dart';
import '../../../../../core/data/datasources/local/providers/database_provider.dart';
import '../../../../../core/data/datasources/local/datasources/sync_metadata_local_data_source.dart';
import '../../../../../core/providers/serverpod_client_provider.dart';
import '../../../../../core/providers/session_manager_provider.dart';
import '../../../../../core/sync/sync_registry.dart';
import '../../../../../core/services/logger/logger_provider.dart';
import '../../../domain/repositories/task_tag_map_repository.dart';
import '../../datasources/local/daos/task_tag_map/task_tag_map_dao.dart';
import '../../datasources/local/interfaces/task_tag_map_local_datasource_service.dart';
import '../../datasources/local/datasources/task_tag_map_local_data_source.dart';
import '../../repositories/task_tag_map_repository_impl.dart';
import '../../../../../core/data/datasources/local/daos/sync_metadata_dao.dart';
import '../tag/tag_data_providers.dart';

part 'task_tag_map_data_providers.g.dart';

@riverpod
TaskTagMapDao taskTagMapDao(Ref ref) {
  final databaseService = ref.read(databaseServiceProvider);
  return TaskTagMapDao(databaseService);
}

@riverpod
ITaskTagMapLocalDataSource taskTagMapLocalDataSource(Ref ref) {
  final dao = ref.read(taskTagMapDaoProvider);
  return TaskTagMapLocalDataSource(dao);
}

@riverpod
ITaskTagMapRemoteDataSource taskTagMapRemoteDataSource(Ref ref) {
  final client = ref.watch(serverpodClientProvider);
  return TaskTagMapRemoteDataSource(client);
}

@riverpod
ISyncMetadataLocalDataSource syncMetadataLocalDataSource(Ref ref) {
  final syncMetadataDao = ref.read(syncMetadataDaoProvider);
  return SyncMetadataLocalDataSource(syncMetadataDao);
}

@riverpod
SyncMetadataDao syncMetadataDao(Ref ref) {
  final databaseService = ref.read(databaseServiceProvider);
  return SyncMetadataDao(databaseService.database);
}

/// Семейный провайдер репозитория для конкретного пользователя
@riverpod
ITaskTagMapRepository taskTagMapRepository(
  Ref ref, {
  required int userId,
  required String customerId,
}) {
  // Получаем все зависимости
  final localDataSource = ref.watch(taskTagMapLocalDataSourceProvider);
  final remoteDataSource = ref.watch(taskTagMapRemoteDataSourceProvider);
  final syncMetadataLocalDataSource = ref.watch(
    syncMetadataLocalDataSourceProvider,
  );
  final tagRepository = ref.watch(
    tagRepositoryProvider(userId: userId, customerId: customerId),
  );

  final logger = ref.watch(loggerServiceProvider);

  // Создаем репозиторий с фиксированным userId
  final repository = TaskTagMapRepositoryImpl(
    localDataSource,
    remoteDataSource,
    syncMetadataLocalDataSource,
    userId,
    customerId,
    tagRepository, //нужно для удаления task_tag_map при удалении task
    logger,
  );

  // Регистрируем в реестре для автоматической синхронизации
  final registry = ref.read(syncRegistryProvider);
  final repoKey = 'task_tag_maps__${userId}_$customerId';
  registry.registerRepository(repoKey, repository);

  // При уничтожении провайдера удаляем репозиторий из реестра
  ref.onDispose(() {
    registry.unregisterRepository(repoKey);
    repository.dispose();
  });

  return repository;
}

@riverpod
ITaskTagMapRepository? currentUserTaskTagMapRepository(Ref ref) {
  final currentUser = ref.watch(authStateChangesProvider).value;

  final currentCustomerId = ref.watch(currentCustomerIdProvider);

  if (currentUser?.id == null) {
    return null;
  }

  return ref.watch(
    taskTagMapRepositoryProvider(
      userId: currentUser!.id!,
      customerId: currentCustomerId.toString(),
    ),
  );
}
