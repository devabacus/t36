// manifest: startProject
import 'dart:async';
import 'package:t36_client/t36_client.dart';
import '../interfaces/configuration_remote_datasource_service.dart';

class ConfigurationRemoteDataSource implements IConfigurationRemoteDataSource {
  final Client _client;

  ConfigurationRemoteDataSource(this._client);

  @override
  Future<List<Configuration>> getConfigurations() async {
    try {
      final categories = await _client.configuration.getConfigurations();
      return categories;
    } catch (e) {
      print('Ошибка получения: $e');
      rethrow;
    }
  }

  @override
  Future<List<Configuration>> getConfigurationsSince(DateTime? since) async {
    try {
      final categories = await _client.configuration.getConfigurationsSince(since);
      return categories;
    } catch (e) {
      print('Ошибка получения c $since: $e');
      rethrow;
    }
  }

  @override
  Future<Configuration?> getConfigurationById(UuidValue id) async {
    try {
      final configuration = await _client.configuration.getConfigurationById(id);
      return configuration;
    } catch (e) {
      print('Ошибка получения по ID $id: $e');
      rethrow;
    }
  }

  @override
  Future<Configuration> createConfiguration(Configuration configuration) async {
    print('🚀 Remote: Отправляем на сервер: ${_client.host}');

    try {
      final result = await _client.configuration.createConfiguration(configuration);
      print('✅ Remote: Успешно создано на сервере');
      return result;
    } catch (e) {
      print('❌ Remote: Ошибка создания на сервере: $e');
      rethrow;
    }
  }

  @override
  Future<bool> updateConfiguration(Configuration configuration) async {
    try {
      final result = await _client.configuration.updateConfiguration(configuration);
      return result;
    } catch (e) {
      print('Ошибка обновления: $e');
      rethrow;
    }
  }

  @override
  Stream<ConfigurationSyncEvent> watchEvents() {
    try {
      return _client.configuration.watchEvents();
    } catch (e) {
      print('❌ Ошибка подписки на события сервера: $e');
      return Stream.value(ConfigurationSyncEvent(type: SyncEventType.create));
    }
  }

  @override
  Future<bool> checkConnection() async {
    try {
      await _client.configuration.getConfigurations(limit: 1);
      return true;
    } catch (e) {
      print('Проверка подключения неудачна: $e');
      return false;
    }
  }

  @override
  Future<List<Configuration>> syncConfigurations(List<Configuration> localConfigurations) async {
    try {
      final serverConfigurations = await getConfigurations();

      print(
        'Синхронизация: локальных ${localConfigurations.length}, серверных ${serverConfigurations.length}',
      );
      return serverConfigurations;
    } catch (e) {
      print('Ошибка синхронизации: $e');
      return localConfigurations;
    }
  }

}

