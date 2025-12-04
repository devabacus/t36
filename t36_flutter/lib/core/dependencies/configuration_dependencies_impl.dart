// manifest: startProject

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t36/core/data/datasources/local/daos/sync_metadata_dao.dart';
import 'package:t36/core/data/datasources/local/providers/database_provider.dart';
import 'package:t36/core/data/datasources/remote/serverpod_configuration_data_source.dart';
import 'package:t36/core/providers/serverpod_client_provider.dart';
import 'package:t36/features/configuration/data/datasources/local/daos/configuration/configuration_dao.dart';
import 'package:t36/features/configuration/domain/datasources/i_configuration_remote_data_source.dart';
import 'package:t36/features/configuration/domain/dependencies/configuration_dependencies.dart';

class ConfigurationDependenciesImpl implements IConfigurationDependencies {
  final Ref _ref;

  ConfigurationDependenciesImpl(this._ref);

  @override
  ConfigurationDao get configurationDao {
    final dbService = _ref.read(databaseServiceProvider);
    return ConfigurationDao(dbService);
  }

  @override
  SyncMetadataDao get syncMetadataDao {
    final dbService = _ref.read(databaseServiceProvider);
    return SyncMetadataDao(dbService.database);
  }

  // Теперь вместо прямого клиента мы предоставляем наш адаптер.
  @override
  IConfigurationRemoteDataSource get remoteDataSource {
    final client = _ref.read(serverpodClientProvider);
    return ServerpodConfigurationDataSource(client);
  }
}