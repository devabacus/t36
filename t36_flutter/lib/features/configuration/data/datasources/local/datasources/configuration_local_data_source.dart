// manifest: startProject
import 'package:drift/drift.dart';
import '../../../../data/datasources/local/tables/extensions/configuration_table_extension.dart';
import '../../../../domain/entities/configuration/configuration_entity.dart';
import '../../../../domain/entities/extensions/configuration_entity_extension.dart';

import '../../../../../../core/data/datasources/local/database.dart';
import '../../../../../../core/data/datasources/local/database_types.dart';
import '../../../models/configuration/configuration_model.dart';
import '../../../models/extensions/configuration_model_extension.dart';
import '../daos/configuration/configuration_dao.dart';
import '../interfaces/configuration_local_datasource_service.dart';

class ConfigurationLocalDataSource implements IConfigurationLocalDataSource {
  final ConfigurationDao _configurationDao;

  ConfigurationLocalDataSource(this._configurationDao);

  @override
  Future<List<ConfigurationTableData>> reconcileServerChanges(
    List<dynamic> serverChanges, {
    required int userId,
    required String customerId,
  }) async {
    final allLocalChanges = await getAllLocalChanges(
      userId: userId,
      customerId: customerId,
    );
    final localChangesMap = {for (var c in allLocalChanges) c.id: c};
    // Используем Set для отслеживания уже обработанных бизнес-ключей из этого пакета данных с сервера
    final processedBusinessKeys = <String>{};

    await _configurationDao.db.transaction(() async {
      for (final serverChange in (serverChanges as List<ConfigurationEntity>)) {
        if (serverChange.userId != userId || serverChange.customerId != customerId) {
          continue;
        }

        // 1. Определяем уникальный бизнес-ключ
        final businessKey = '${serverChange.group}|${serverChange.key}';
        
        // 2. Проверяем, не было ли дубликата в данных, уже полученных с сервера
        if (processedBusinessKeys.contains(businessKey)) {
          print('    -> ПОВТОР: Пропуск дублирующейся настройки с сервера: "${serverChange.key}"');
          continue;
        }
        processedBusinessKeys.add(businessKey);

        // 3. ИЩЕМ ЛОКАЛЬНУЮ ЗАПИСЬ ПО БИЗНЕС-КЛЮЧУ, А НЕ ПО ID!
        final localRecord = await _configurationDao.getConfigurationByGroupAndKey(
          serverChange.group,
          serverChange.key,
          userId: userId,
          customerId: customerId,
        );

        final companion = serverChange.toModel().toCompanion().copyWith(syncStatus: const Value(SyncStatus.synced));

        if (localRecord == null) {
          // Локальной записи с таким бизнес-ключом нет. Безопасно вставляем.
          if (!serverChange.isDeleted) {
            await _configurationDao.db.into(_configurationDao.configurationTable).insert(companion);
            print('    -> СОЗДАНО с сервера: "${serverChange.key}"');
          }
        } else {
          // Локальная запись найдена. Теперь разрешаем конфликты.
          final serverTime = serverChange.lastModified;
          final localTime = localRecord.lastModified;

          if (serverChange.isDeleted) {
            if (localTime.isAfter(serverTime) && localRecord.syncStatus == SyncStatus.local) {
              print('    -> КОНФЛИКТ: Локальная версия "${localRecord.key}" новее серверного удаления. Локальное изменение побеждает.');
            } else {
              await physicallyDeleteConfiguration(localRecord.id, userId: userId, customerId: customerId);
              localChangesMap.remove(localRecord.id);
              print('    -> ✅ Удалено с сервера: "${localRecord.key}".');
            }
          } else {
            if (localRecord.syncStatus == SyncStatus.local && localTime.isAfter(serverTime)) {
              print('    -> КОНФЛИКТ: Локальная версия "${localRecord.key}" новее. Она будет отправлена на сервер.');
            } else {
              // Сервер новее или локальная запись не изменена. ОБНОВЛЯЕМ существующую запись.
              await (_configurationDao.update(_configurationDao.configurationTable)..where((t) => t.id.equals(localRecord.id))).write(companion);
              localChangesMap.remove(localRecord.id);
              print('    -> ОБНОВЛЕНО с сервера: "${serverChange.key}"');
            }
          }
        }
      }
    });
    return localChangesMap.values.toList();
  }
  
  @override
  Future<void> handleSyncEvent(
    dynamic event, {
    required int userId,
    required String customerId,
  }) async {
    if (event is! ConfigurationEntity) return;
    if (event.userId != userId || event.customerId != customerId) return;
    
    // Для real-time событий мы можем использовать более простую логику "вставить или заменить",
    // так как они приходят по одному и обычно относятся к уже существующим записям.
    final companion = event.toModel().toCompanion().copyWith(syncStatus: const Value(SyncStatus.synced));
    await _configurationDao.db.into(_configurationDao.configurationTable).insert(companion, mode: InsertMode.insertOrReplace);
    print('  -> (Real-time) ОБРАБОТАНО событие для: "${event.key}"');
  }

  // Этот метод больше не нужен для логики синхронизации, но мы оставим его,
  // так как он является частью интерфейса и может использоваться в других местах.
  @override
  Future<void> insertOrUpdateFromServer(dynamic serverChange, SyncStatus status) async {
     final entity = serverChange as ConfigurationEntity;
     final companion = entity.toModel().toCompanion().copyWith(syncStatus: Value(status));
     await _configurationDao.db.into(_configurationDao.configurationTable).insert(companion, mode: InsertMode.insertOrReplace);
  }

  // --- Остальные методы файла без изменений ---
  
  @override
  Future<List<ConfigurationModel>> getConfigurations({required int userId, required String customerId}) async {
    final data = await _configurationDao.getConfigurations(userId: userId, customerId: customerId);
    return data.toModels();
  }

  @override
  Stream<List<ConfigurationModel>> watchConfigurations({required int userId, required String customerId}) {
    return _configurationDao.watchConfigurations(userId: userId, customerId: customerId).map((list) => list.toModels());
  }

  @override
  Future<ConfigurationModel?> getConfigurationById(String id, {required int userId, required String customerId}) async {
    final data = await _configurationDao.getConfigurationById(id, userId: userId, customerId: customerId);
    return data?.toModel();
  }

  @override
  Future<List<ConfigurationModel>> getConfigurationsByIds(List<String> ids, {required int userId, required String customerId}) async {
    final data = await _configurationDao.getConfigurationsByIds(ids, userId: userId, customerId: customerId);
    return data.toModels();
  }

  @override
  Future<String> createConfiguration(ConfigurationModel configuration) {
    return _configurationDao.createConfiguration(configuration.toCompanion().copyWith(syncStatus: const Value(SyncStatus.local)));
  }

  @override
  Future<bool> updateConfiguration(ConfigurationModel configuration) {
    return _configurationDao.updateConfigurationById(configuration.id, configuration.toCompanionWithId().copyWith(syncStatus: const Value(SyncStatus.local)), userId: configuration.userId, customerId: configuration.customerId);
  }

  @override
  Future<bool> deleteConfiguration(String id, {required int userId, required String customerId}) async {
    final companion = ConfigurationTableCompanion(isDeleted: const Value(true), lastModified: Value(DateTime.now()), syncStatus: const Value(SyncStatus.local));
    return await _configurationDao.updateConfigurationById(id, companion, userId: userId, customerId: customerId);
  }

  @override
  Future<List<ConfigurationTableData>> getAllLocalChanges({required int userId, required String customerId}) {
    return (_configurationDao.select(_configurationDao.configurationTable)..where((t) => (t.syncStatus.equals(SyncStatus.synced.name)).not() & t.userId.equals(userId) & t.customerId.equals(customerId))).get();
  }

  @override
  Future<void> physicallyDeleteConfiguration(String id, {required int userId, required String customerId}) async {
    await _configurationDao.physicallyDeleteConfiguration(id, userId: userId, customerId: customerId);
  }
  
  @override
  Future<ConfigurationModel?> getConfigurationByGroupAndKey(String group, String key, {required int userId, required String customerId}) async {
    final result = await _configurationDao.getConfigurationByGroupAndKey(group, key, userId: userId, customerId: customerId);
    return result?.toModel();
  }
}