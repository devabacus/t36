// manifest: startProject

import 'package:t36/features/configuration/domain/datasources/i_configuration_remote_data_source.dart';
import 'package:t36/features/configuration/domain/entities/configuration/configuration_entity.dart';
import 'package:t36/features/configuration/domain/entities/extensions/configuration_entity_extension.dart';
import 'package:t36/features/configuration/data/models/extensions/configuration_model_extension.dart';
import 'package:t36_client/t36_client.dart' as serverpod;

class ServerpodConfigurationDataSource implements IConfigurationRemoteDataSource {
  final serverpod.Client _client;

  ServerpodConfigurationDataSource(this._client);

  @override
  Future<List<ConfigurationEntity>> getConfigurationsSince(DateTime? since) async {
    final serverpodConfigs = await _client.configuration.getConfigurationsSince(since);
    return serverpodConfigs.map((e) => e.toModel().toEntity()).toList();
  }

  @override
  Future<ConfigurationEntity> createConfiguration(ConfigurationEntity configuration) async {
    final serverpodConfig = configuration.toServerpodConfiguration();
    final result = await _client.configuration.createConfiguration(serverpodConfig);
    return result.toModel().toEntity();
  }

  @override
  Future<void> updateConfiguration(ConfigurationEntity configuration) async {
    final serverpodConfig = configuration.toServerpodConfiguration();
    await _client.configuration.updateConfiguration(serverpodConfig);
  }

  @override
  Stream<dynamic> watchEvents() {
    // ИЗМЕНЕНИЕ: Мы преобразуем событие от Serverpod в нашу чистую Entity
    return _client.configuration.watchEvents().map((event) {
      // Проверяем, что в событии есть данные, и конвертируем их
      if (event.configuration != null) {
        return event.configuration!.toModel().toEntity();
      }
      return null; // или можно вернуть специальный объект-событие
    }).where((event) => event != null); // Фильтруем пустые события
  }
}