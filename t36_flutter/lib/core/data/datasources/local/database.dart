
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'database_types.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/sync_metadata_table.dart';
import '../../../../features/configuration/data/datasources/local/tables/configuration_table.dart';
// === GENERATED_IMPORTS_START ===

// === GENERATED_IMPORTS_END ===

part 'database.g.dart';

@DriftDatabase(tables: [
    SyncMetadataTable,
    ConfigurationTable,
// === GENERATED_TABLES_START ===

// === GENERATED_TABLES_END ===
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

@override
MigrationStrategy get migration => MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // === GENERATED_MIGRATION_START ===

// === GENERATED_MIGRATION_END ===
        }        
    );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 't36_flutter',
    );
  }

}


