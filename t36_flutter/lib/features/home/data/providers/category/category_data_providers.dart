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
import '../../../domain/repositories/category_repository.dart';
import '../../datasources/local/daos/category/category_dao.dart';
import '../../datasources/local/datasources/category_local_data_source.dart';
import '../../datasources/local/interfaces/category_local_datasource_service.dart';
import '../../datasources/remote/interfaces/category_remote_datasource_service.dart';
import '../../datasources/remote/sources/category_remote_data_source.dart';
import '../../repositories/category_repository_impl.dart';

part 'category_data_providers.g.dart';

@riverpod
CategoryDao categoryDao(Ref ref) {
  final databaseService = ref.read(databaseServiceProvider);
  return CategoryDao(databaseService);
}

@riverpod
ICategoryLocalDataSource categoryLocalDataSource(Ref ref) {
  final categoryDao = ref.read(categoryDaoProvider);
  return CategoryLocalDataSource(categoryDao);
}

@riverpod
ICategoryRemoteDataSource categoryRemoteDataSource(Ref ref) {
  ref.keepAlive();
  final client = ref.watch(serverpodClientProvider);
  return CategoryRemoteDataSource(client);
}

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
@riverpod
ICategoryRepository categoryRepository(
  Ref ref, {
  required int userId,
  required String customerId,
}) {
  // ref.keepAlive();

  // Получаем все зависимости
  final localDataSource = ref.watch(categoryLocalDataSourceProvider);
  final remoteDataSource = ref.watch(categoryRemoteDataSourceProvider);
  final syncMetadataLocalDataSource = ref.watch(
    syncMetadataLocalDataSourceProvider,
  );

  final logger = ref.watch(loggerServiceProvider);

  // Создаем репозиторий с фиксированным userId
  final repository = CategoryRepositoryImpl(
    localDataSource,
    remoteDataSource,
    syncMetadataLocalDataSource,
    logger,
    userId,
    customerId,
  );

  // Автоматически регистрируем в реестре
  final registry = ref.read(syncRegistryProvider);
  registry.registerRepository('categories_${userId}_$customerId', repository);

  ref.onDispose(() {
    registry.unregisterRepository('categories_${userId}_$customerId');
    repository.dispose();
  });

  return repository;
}

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
@riverpod
ICategoryRepository? currentUserCategoryRepository(Ref ref) {
  final currentUser = ref.watch(authStateChangesProvider).value;
  final currentCustomerId = ref.watch(currentCustomerIdProvider);

  if (currentUser?.id == null || currentCustomerId == null) {
    // Если пользователь не авторизован, возвращаем null
    return null;
  }

  // Возвращаем репозиторий для текущего пользователя
  return ref.watch(
    categoryRepositoryProvider(
      userId: currentUser!.id!,
      customerId: currentCustomerId.toString(),
    ),
  );
}
