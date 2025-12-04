// manifest: startProject

import '../../data/datasources/local/daos/configuration/configuration_dao.dart';
import '../../../../core/data/datasources/local/daos/sync_metadata_dao.dart';
import '../datasources/i_configuration_remote_data_source.dart';

/// Обновленный "мост". Теперь он не зависит от Serverpod Client напрямую.
abstract class IConfigurationDependencies {
  ConfigurationDao get configurationDao;
  SyncMetadataDao get syncMetadataDao;
  
  // Вместо Client мы требуем реализацию нашего абстрактного источника данных.
  IConfigurationRemoteDataSource get remoteDataSource;
}