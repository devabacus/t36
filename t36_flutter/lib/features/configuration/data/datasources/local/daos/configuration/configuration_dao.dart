// manifest: startProject

// === generated_start:base ===
import 'package:drift/drift.dart';
import '../../../../../../../core/data/datasources/local/database.dart';
import '../../../../../../../core/data/datasources/local/interfaces/i_database_service.dart';
import '../../tables/configuration_table.dart';

part 'configuration_dao.g.dart';

@DriftAccessor(tables: [ConfigurationTable])
class ConfigurationDao extends DatabaseAccessor<AppDatabase>
    with _$ConfigurationDaoMixin {
  ConfigurationDao(IDatabaseService databaseService)
    : super(databaseService.database);

  AppDatabase get db => attachedDatabase;

  Future<List<ConfigurationTableData>> getConfigurations({
    required int userId,
    required String customerId,
  }) =>
      (select(configurationTable)
            ..where((t) => t.isDeleted.equals(false))
            ..where(
              (t) => t.userId.equals(userId) & t.customerId.equals(customerId),
            ))
          .get();

  Stream<List<ConfigurationTableData>> watchConfigurations({
    required int userId,
    required String customerId,
  }) =>
      (select(configurationTable)
            ..where((t) => t.isDeleted.equals(false))
            ..where(
              (t) => t.userId.equals(userId) & t.customerId.equals(customerId),
            ))
          .watch();

  Future<ConfigurationTableData?> getConfigurationById(
    String id, {
    required int userId,
    required String customerId,
  }) =>
      (select(configurationTable)..where(
        (t) =>
            t.id.equals(id) &
            t.userId.equals(userId) &
            t.customerId.equals(customerId),
      )).getSingleOrNull();

  Future<List<ConfigurationTableData>> getConfigurationsByIds(
    List<String> ids, {
    required int userId,
    required String customerId,
  }) {
    if (ids.isEmpty) {
      return Future.value([]);
    }
    return (select(configurationTable)..where(
      (t) =>
          t.id.isIn(ids) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId) &
          t.isDeleted.equals(false),
    )).get();
  }

  Future<String> createConfiguration(ConfigurationTableCompanion companion) async {
    final id = companion.id.value;
    try {
      final existingConfiguration =
          await (select(configurationTable)..where(
            (t) =>
                t.id.equals(id) &
                t.userId.equals(companion.userId.value) &
                t.customerId.equals(companion.customerId.value),
          )).getSingleOrNull();

      if (existingConfiguration != null) {
        throw StateError('configuration with ID $id exists');
      }

      await into(configurationTable).insert(companion);
      return id;
    } catch (e) {
      print('fail of creating configuration: $e');
      rethrow;
    }
  }

  Future<bool> updateConfigurationById(
    String id,
    ConfigurationTableCompanion companion, {
    required int userId,
    required String customerId,
  }) async {
    // final idToUpdate = companion.id.value;
    final updatedRows = await (update(configurationTable)..where(
      (t) =>
          t.id.equals(id) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).write(companion);
    return updatedRows > 0;
  }

  Future<int> physicallyDeleteConfiguration(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    return (delete(configurationTable)..where(
      (t) =>
          t.id.equals(id) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).go();
  }

  Future<bool> configurationExists(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    if (id.isEmpty) return false;

    final configuration =
        await (select(configurationTable)..where(
          (t) =>
              t.id.equals(id) &
              t.userId.equals(userId) &
              t.customerId.equals(customerId),
        )).getSingleOrNull();

    return configuration != null;
  }

  Future<int> getConfigurationsCount({
    required int userId,
    required String customerId,
  }) async {
    final countQuery =
        selectOnly(configurationTable)
          ..addColumns([configurationTable.id.count()])
          ..where(
            configurationTable.userId.equals(userId) &
                configurationTable.customerId.equals(customerId),
          );

    final result = await countQuery.getSingle();
    return result.read(configurationTable.id.count()) ?? 0;
  }

  Future<void> insertConfigurations(List<ConfigurationTableCompanion> companions) async {
    await batch((batch) {
      batch.insertAll(configurationTable, companions);
    });
  }

  Future<int> deleteAllConfigurations({
    required int userId,
    required String customerId,
  }) {
    return (delete(configurationTable)..where(
      (t) => t.userId.equals(userId) & t.customerId.equals(customerId),
    )).go();
  }
// === generated_end:base ===

 Future<ConfigurationTableData?> getConfigurationByGroupAndKey(
    String group,
    String key, {
    required int userId,
    required String customerId,
  }) async {
    // Старый код падал из-за .getSingleOrNull() на дубликатах.
    // Новый код сортирует найденные записи по дате изменения
    // и безопасно берет самую последнюю, что делает его устойчивым к дубликатам.
    final query = select(configurationTable)
      ..where((t) =>
          t.group.equals(group) &
          t.key.equals(key) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId) &
          t.isDeleted.equals(false))
      ..orderBy([(t) => OrderingTerm(expression: t.lastModified, mode: OrderingMode.desc)]);
    
    final results = await query.get();
    return results.isNotEmpty ? results.first : null;
  }
}

