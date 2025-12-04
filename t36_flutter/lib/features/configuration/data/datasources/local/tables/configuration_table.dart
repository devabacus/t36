// manifest: startProject
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../../../../core/data/datasources/local/database_types.dart';
// === generated_start:driftTableImports ===
// === generated_end:driftTableImports ===

class ConfigurationTable extends Table {

  // === generated_start:driftTableColumns ===
    TextColumn get group => text()();
    TextColumn get key => text()();
    TextColumn get value => text()();
// === generated_end:driftTableColumns ===

  TextColumn get id => text().clientDefault(() => Uuid().v7())();
  IntColumn get userId => integer()();
  TextColumn get customerId => text()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now().toUtc())();
  IntColumn get lastModified => integer().map(const MillisecondEpochConverter())();
  TextColumn get syncStatus => text().map(const SyncStatusConverter())();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
    
  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'UNIQUE("group", key, user_id, customer_id)',
  ];
}
