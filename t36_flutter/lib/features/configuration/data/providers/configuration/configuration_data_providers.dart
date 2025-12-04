// manifest: startProject
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/data/datasources/local/providers/sync_metadata_providers.dart';
import '../../../../../core/providers/session_manager_provider.dart';
import '../../../../../core/sync/sync_registry.dart';
import '../../../../../core/services/logger/logger_provider.dart';
import '../../../../auth/presentation/providers/auth_state_providers.dart';
import '../../../domain/datasources/i_configuration_remote_data_source.dart';
import '../../../domain/providers/configuration/configuration_dependencies_provider.dart';
import '../../../domain/repositories/configuration_repository.dart';
import '../../datasources/local/daos/configuration/configuration_dao.dart';
import '../../datasources/local/datasources/configuration_local_data_source.dart';
import '../../datasources/local/interfaces/configuration_local_datasource_service.dart';
import '../../repositories/configuration_repository_impl.dart';

part 'configuration_data_providers.g.dart';

@riverpod
ConfigurationDao configurationDao(Ref ref) {
  // Получаем зависимость через "мост"
  return ref.watch(configurationDependenciesProvider).configurationDao;
}

@riverpod
IConfigurationRemoteDataSource configurationRemoteDataSource(Ref ref) {
  return ref.watch(configurationDependenciesProvider).remoteDataSource;
}

@riverpod
IConfigurationLocalDataSource configurationLocalDataSource(Ref ref) {
  final configurationDao = ref.read(configurationDaoProvider);
  return ConfigurationLocalDataSource(configurationDao);
}

/// Семейный провайдер репозитория для конкретного пользователя
/// Каждый userId получает свой изолированный экземпляр репозитория
@riverpod
IConfigurationRepository configurationRepository(
  Ref ref, {
  required int userId,
  required String customerId,
}) {
  // ref.keepAlive();

  // Получаем все зависимости
  final localDataSource = ref.watch(configurationLocalDataSourceProvider);
  final remoteDataSource = ref.watch(configurationRemoteDataSourceProvider);
  final syncMetadataLocalDataSource = ref.watch(
    syncMetadataLocalDataSourceProvider,
  );

  final logger = ref.watch(loggerServiceProvider);

  // Создаем репозиторий с фиксированным userId
  final repository = ConfigurationRepositoryImpl(
    localDataSource,
    remoteDataSource,
    syncMetadataLocalDataSource,
    logger,
    userId,
    customerId,
  );

  // Автоматически регистрируем в реестре
  final registry = ref.read(syncRegistryProvider);
  // registry.registerRepository('categories_${userId}_$customerId', repository);
  final repoKey = 'configurations_${userId}_$customerId';
  registry.registerRepository(repoKey, repository);

  ref.onDispose(() {
    // registry.unregisterRepository('categories_${userId}_$customerId');
    registry.unregisterRepository(repoKey);

    repository.dispose();
  });

  return repository;
}

/// Удобный провайдер для получения репозитория текущего пользователя
/// Автоматически следит за сменой пользователя и предоставляет соответствующий репозиторий
@riverpod
IConfigurationRepository? currentUserConfigurationRepository(Ref ref) {
  final currentUser = ref.watch(authStateChangesProvider).value;

  final currentCustomerId = ref.watch(currentCustomerIdProvider);

  if (currentUser?.id == null || currentCustomerId == null) {
    // Если пользователь не авторизован, возвращаем null
    return null;
  }

  // Возвращаем репозиторий для текущего пользователя
  return ref.watch(
    configurationRepositoryProvider(
      userId: currentUser!.id!,
      customerId: currentCustomerId.toString(),
    ),
  );
}
