// manifest: manyToMany
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../../../../core/data/datasources/local/database_types.dart';
import 'task_table.dart';
import 'tag_table.dart';

class TaskTagMapTable extends Table {

  TextColumn get id => text().clientDefault(() => Uuid().v7())();
  IntColumn get userId => integer()();
  TextColumn get customerId => text()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now().toUtc())();
  IntColumn get lastModified => integer().map(const MillisecondEpochConverter())();
  TextColumn get syncStatus => text().map(const SyncStatusConverter())();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  TextColumn get taskId => text().references(TaskTable, #id)();
  TextColumn get tagId => text().references(TagTable, #id)();
  
  @override
  List<String> get customConstraints => [
    'UNIQUE(task_id, tag_id, user_id, customer_id)',
  ];
  
  @override
  Set<Column> get primaryKey => {id};
}
