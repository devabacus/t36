// manifest: startProject
import 'package:t36_client/t36_client.dart';

abstract class IConfigurationRemoteDataSource {
  Stream<ConfigurationSyncEvent> watchEvents();
  Future<List<Configuration>> getConfigurations();
  Future<List<Configuration>> getConfigurationsSince(DateTime? since); 
  Future<List<Configuration>> syncConfigurations(List<Configuration> localConfigurations);
  Future<Configuration?> getConfigurationById(UuidValue id);
  Future<Configuration> createConfiguration(Configuration configuration);
  Future<bool> updateConfiguration(Configuration configuration);
  Future<bool> checkConnection();
}

