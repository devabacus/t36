// manifest: startProject

import '../../domain/entities/extensions/configuration_entity_extension.dart';

import '../../../../core/data/datasources/local/database.dart';
import '../../../../core/sync/base_sync_repository.dart';
import '../../domain/entities/configuration/configuration_entity.dart';
import '../../domain/repositories/configuration_repository.dart';
import '../../../../core/data/datasources/local/database_types.dart';
import '../datasources/local/interfaces/configuration_local_datasource_service.dart';
import '../../../../core/data/datasources/local/interfaces/sync_metadata_local_datasource_service.dart';
import '../../domain/datasources/i_configuration_remote_data_source.dart';
import '../models/extensions/configuration_model_extension.dart';
import '../datasources/local/tables/extensions/configuration_table_extension.dart';
import '../../../../core/services/logger/logger_service.dart';

class ConfigurationRepositoryImpl extends BaseSyncRepository
    implements IConfigurationRepository {
  final IConfigurationLocalDataSource _localDataSource;
  // Теперь репозиторий зависит от абстракции, а не от конкретной реализации
  final IConfigurationRemoteDataSource _remoteDataSource;

  @override
  String get entityTypeName => 'Configuration';
  @override
  String get entityType => 'configurations_user_$userId';

  ConfigurationRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource, // Принимаем абстракцию
    ISyncMetadataLocalDataSource syncMetadataDataSource,
    LoggerService logger,
    int userId,
    String customerId,
  ) : super(
        userId,
        customerId,
        syncMetadataDataSource: syncMetadataDataSource,
        logger: logger,
      ) {
    initEventBasedSync();
  }

  @override
  Future<List<dynamic>> getChangesFromServer(DateTime? since) {
    // Делегируем вызов нашему абстрактному источнику данных.
    // Возвращаемый тип Future<List<ConfigurationEntity>> совместим с Future<List<dynamic>>.
    return _remoteDataSource.getConfigurationsSince(since);
  }

  @override
  Future<void> pushLocalChanges(List<dynamic> localChangesToPush) async {
    for (final localChange
        in localChangesToPush as List<ConfigurationTableData>) {
      final entity = localChange.toModel().toEntity();
      try {
        // Мы больше не проверяем 'serverRecord', так как этим может заниматься адаптер.
        // Мы просто доверяем контракту.
        if (localChange.isDeleted) {
          await _syncUpdateToServer(
            entity,
          ); // Отправляем как обновление с isDeleted = true
          await _localDataSource.physicallyDeleteConfiguration(
            entity.id,
            userId: userId,
            customerId: customerId,
          );
        } else {
          // Пытаемся создать. Если сервер вернет ошибку (уже существует), обновляем.
          // Эта логика более надежна, чем проверка на null.
          await _syncCreateToServer(entity).catchError((e, st) {
            // Предполагаем, что ошибка - это конфликт (запись уже есть) и пробуем обновить.
            return _syncUpdateToServer(entity);
          });
        }
      } catch (e, st) {
        logger.error(
          '    -> ⚠️ Не удалось синхронизировать изменение ID: ${entity.id}. Повторим позже.',
          e,
          st,
        );
      }
    }
  }

  Future<void> _syncCreateToServer(ConfigurationEntity configuration) async {
    final syncedEntity = await _remoteDataSource.createConfiguration(
      configuration,
    );
    await _localDataSource.insertOrUpdateFromServer(
      syncedEntity,
      SyncStatus.synced,
    );
  }

  Future<void> _syncUpdateToServer(ConfigurationEntity configuration) async {
    await _remoteDataSource.updateConfiguration(configuration);
    await _localDataSource.insertOrUpdateFromServer(
      configuration,
      SyncStatus.synced,
    );
  }

  @override
  Stream<dynamic> watchEvents() => _remoteDataSource.watchEvents();

  // ... Остальные методы репозитория (reconcileChanges, handleSyncEvent, локальные CRUD) остаются БЕЗ ИЗМЕНЕНИЙ ...
  @override
  Future<List<dynamic>> reconcileChanges(List<dynamic> serverChanges) async {
    return _localDataSource.reconcileServerChanges(
      serverChanges,
      userId: userId,
      customerId: customerId,
    );
  }

  @override
  Future<void> handleSyncEvent(dynamic event) async {
    await _localDataSource.handleSyncEvent(
      event,
      userId: userId,
      customerId: customerId,
    );
  }

  @override
  Stream<List<ConfigurationEntity>> watchConfigurations() {
    return _localDataSource
        .watchConfigurations(userId: userId, customerId: customerId)
        .map((models) => models.toEntities());
  }

  @override
  Future<String> createConfiguration(ConfigurationEntity configuration) async {
    final configurationWithUser = configuration.copyWith(
      userId: userId,
      customerId: customerId,
      lastModified: DateTime.now().toUtc(),
    );
    final id = await _localDataSource.createConfiguration(
      configurationWithUser.toModel(),
    );
    syncWithServer().catchError(
      (e, st) => logger.error(
        '⚠️ Фоновая синхронизация после создания не удалась',
        e,
        st,
      ),
    );
    return id;
  }

  @override
  Future<bool> updateConfiguration(ConfigurationEntity configuration) async {
    final configurationWithUser = configuration.copyWith(
      userId: userId,
      customerId: customerId,
      lastModified: DateTime.now().toUtc(),
    );
    final result = await _localDataSource.updateConfiguration(
      configurationWithUser.toModel(),
    );
    syncWithServer().catchError(
      (e, st) => logger.error(
        '⚠️ Фоновая синхронизация после обновления не удалась',
        e,
        st,
      ),
    );
    return result;
  }

  @override
  Future<bool> deleteConfiguration(String id) async {
    final result = await _localDataSource.deleteConfiguration(
      id,
      userId: userId,
      customerId: customerId,
    );
    syncWithServer().catchError(
      (e, st) => logger.error(
        '⚠️ Фоновая синхронизация после удаления не удалась',
        e,
        st,
      ),
    );
    return result;
  }

  @override
  Future<List<ConfigurationEntity>> getConfigurations() async =>
      _localDataSource
          .getConfigurations(userId: userId, customerId: customerId)
          .then((models) => models.toEntities());

  @override
  Future<ConfigurationEntity?> getConfigurationById(String id) async {
    final model = await _localDataSource.getConfigurationById(
      id,
      userId: userId,
      customerId: customerId,
    );
    return model?.toEntity();
  }

  @override
  Future<List<ConfigurationEntity>> getConfigurationsByIds(
    List<String> ids,
  ) async {
    final models = await _localDataSource.getConfigurationsByIds(
      ids,
      userId: userId,
      customerId: customerId,
    );
    return models.toEntities();
  }

  @override
  Future<ConfigurationEntity?> getConfigurationByGroupAndKey(
    String group,
    String key,
  ) async {
    final model = await _localDataSource.getConfigurationByGroupAndKey(
      group,
      key,
      userId: userId,
      customerId: customerId,
    );
    return model?.toEntity();
  }
}
