// manifest: startProject

// === generated_start:base ===
import 'package:t36/core/data/datasources/local/database.dart';

import '../../../models/configuration/configuration_model.dart';
import '../../../../../../core/data/datasources/local/database_types.dart';

abstract class IConfigurationLocalDataSource {
  Future<List<ConfigurationModel>> getConfigurations({required int userId, required String customerId});
  Stream<List<ConfigurationModel>> watchConfigurations({required int userId, required String customerId});
  Future<ConfigurationModel?> getConfigurationById(String id, {required int userId, required String customerId});
  Future<List<ConfigurationModel>> getConfigurationsByIds(List<String> ids, {required int userId, required String customerId});
  Future<String> createConfiguration(ConfigurationModel configuration);
  Future<bool> updateConfiguration(ConfigurationModel configuration);
  Future<bool> deleteConfiguration(String id, {required int userId, required String customerId});
  Future<List<ConfigurationTableData>> getAllLocalChanges({required int userId, required String customerId});
  Future<List<ConfigurationTableData>> reconcileServerChanges(List<dynamic> serverChanges, {required int userId, required String customerId});
  Future<void> physicallyDeleteConfiguration(String id, {required int userId, required String customerId});
  Future<void> insertOrUpdateFromServer(dynamic serverChange, SyncStatus status);
  Future<void> handleSyncEvent(dynamic event, {required int userId, required String customerId});
  // === generated_end:base ===
  Future<ConfigurationModel?> getConfigurationByGroupAndKey(String group, String key, {required int userId, required String customerId});

}

