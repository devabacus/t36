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
import '../../../domain/repositories/tag_repository.dart';
import '../../datasources/local/daos/tag/tag_dao.dart';
import '../../datasources/local/datasources/tag_local_data_source.dart';
import '../../datasources/local/interfaces/tag_local_datasource_service.dart';
import '../../datasources/remote/interfaces/tag_remote_datasource_service.dart';
import '../../datasources/remote/sources/tag_remote_data_source.dart';
import '../../repositories/tag_repository_impl.dart';

part 'tag_data_providers.g.dart';

@riverpod
TagDao tagDao(Ref ref) {
  final databaseService = ref.read(databaseServiceProvider);
  return TagDao(databaseService);
}

@riverpod
ITagLocalDataSource tagLocalDataSource(Ref ref) {
  final tagDao = ref.read(tagDaoProvider);
  return TagLocalDataSource(tagDao);
}

@riverpod
ITagRemoteDataSource tagRemoteDataSource(Ref ref) {
  ref.keepAlive();
  final client = ref.watch(serverpodClientProvider);
  return TagRemoteDataSource(client);
}

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
@riverpod
ITagRepository tagRepository(
  Ref ref, {
  required int userId,
  required String customerId,
}) {
  // ref.keepAlive();

  // Получаем все зависимости
  final localDataSource = ref.watch(tagLocalDataSourceProvider);
  final remoteDataSource = ref.watch(tagRemoteDataSourceProvider);
  final syncMetadataLocalDataSource = ref.watch(
    syncMetadataLocalDataSourceProvider,
  );

  final logger = ref.watch(loggerServiceProvider);

  // Создаем репозиторий с фиксированным userId
  final repository = TagRepositoryImpl(
    localDataSource,
    remoteDataSource,
    syncMetadataLocalDataSource,
    logger,
    userId,
    customerId,
  );

  // Автоматически регистрируем в реестре
  final registry = ref.read(syncRegistryProvider);
  registry.registerRepository('tags_${userId}_$customerId', repository);

  ref.onDispose(() {
    registry.unregisterRepository('tags_${userId}_$customerId');
    repository.dispose();
  });

  return repository;
}

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
@riverpod
ITagRepository? currentUserTagRepository(Ref ref) {
  final currentUser = ref.watch(authStateChangesProvider).value;
  final currentCustomerId = ref.watch(currentCustomerIdProvider);

  if (currentUser?.id == null || currentCustomerId == null) {
    // Если пользователь не авторизован, возвращаем null
    return null;
  }

  // Возвращаем репозиторий для текущего пользователя
  return ref.watch(
    tagRepositoryProvider(
      userId: currentUser!.id!,
      customerId: currentCustomerId.toString(),
    ),
  );
}
