// manifest: startProject
// === generated_start:base ===
import '../entities/configuration/configuration_entity.dart';

abstract class IConfigurationRepository {
  Future<List<ConfigurationEntity>> getConfigurations();
  Stream<List<ConfigurationEntity>> watchConfigurations();
  Future<ConfigurationEntity?> getConfigurationById(String id);
  Future<List<ConfigurationEntity>> getConfigurationsByIds(List<String> ids);
  Future<String> createConfiguration(ConfigurationEntity configuration);
  Future<bool> updateConfiguration(ConfigurationEntity configuration);
  Future<bool> deleteConfiguration(String id);
  Future<void> syncWithServer();
  void initEventBasedSync();
  void dispose();
  // === generated_end:base ===
  Future<ConfigurationEntity?> getConfigurationByGroupAndKey(String group, String key);  
}

