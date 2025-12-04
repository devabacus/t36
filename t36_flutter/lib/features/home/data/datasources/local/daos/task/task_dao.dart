// manifest: entity

// === generated_start:base ===
import 'package:drift/drift.dart';
import '../../../../../../../core/data/datasources/local/database.dart';
import '../../../../../../../core/data/datasources/local/interfaces/i_database_service.dart';
import '../../tables/task_table.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [TaskTable])
class TaskDao extends DatabaseAccessor<AppDatabase>
    with _$TaskDaoMixin {
  TaskDao(IDatabaseService databaseService)
    : super(databaseService.database);

  AppDatabase get db => attachedDatabase;

  Future<List<TaskTableData>> getTasks({
    required int userId,
    required String customerId,
  }) =>
      (select(taskTable)
            ..where((t) => t.isDeleted.equals(false))
            ..where(
              (t) => t.userId.equals(userId) & t.customerId.equals(customerId),
            ))
          .get();

  Stream<List<TaskTableData>> watchTasks({
    required int userId,
    required String customerId,
  }) =>
      (select(taskTable)
            ..where((t) => t.isDeleted.equals(false))
            ..where(
              (t) => t.userId.equals(userId) & t.customerId.equals(customerId),
            ))
          .watch();

  Future<TaskTableData?> getTaskById(
    String id, {
    required int userId,
    required String customerId,
  }) =>
      (select(taskTable)..where(
            (t) =>
                t.id.equals(id) &
                t.userId.equals(userId) &
                t.customerId.equals(customerId),
          ))
          .getSingleOrNull();

  Future<List<TaskTableData>> getTasksByIds(
    List<String> ids, {
    required int userId,
    required String customerId,
  }) {
    if (ids.isEmpty) {
      return Future.value([]);
    }
    return (select(taskTable)..where(
          (t) =>
              t.id.isIn(ids) &
              t.userId.equals(userId) &
              t.customerId.equals(customerId) &
              t.isDeleted.equals(false),
        ))
        .get();
  }

  Future<String> createTask(TaskTableCompanion companion) async {
    final id = companion.id.value;
    try {
      final existingTask =
          await (select(taskTable)..where(
                (t) =>
                    t.id.equals(id) &
                    t.userId.equals(companion.userId.value) &
                    t.customerId.equals(companion.customerId.value),
              ))
              .getSingleOrNull();

      if (existingTask != null) {
        throw StateError('task with ID $id exists');
      }

      await into(taskTable).insert(companion);
      return id;
    } catch (e) {
      print('fail of creating task: $e');
      rethrow;
    }
  }

  Future<bool> updateTaskById(
    String id,
    TaskTableCompanion companion, {
    required int userId,
    required String customerId,
  }) async {
    // final idToUpdate = companion.id.value;
    final updatedRows =
        await (update(taskTable)..where(
              (t) =>
                  t.id.equals(id) &
                  t.userId.equals(userId) &
                  t.customerId.equals(customerId),
            ))
            .write(companion);
    return updatedRows > 0;
  }

  Future<int> physicallyDeleteTask(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    return (delete(taskTable)..where(
          (t) =>
              t.id.equals(id) &
              t.userId.equals(userId) &
              t.customerId.equals(customerId),
        ))
        .go();
  }

  Future<bool> taskExists(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    if (id.isEmpty) return false;

    final task =
        await (select(taskTable)..where(
              (t) =>
                  t.id.equals(id) &
                  t.userId.equals(userId) &
                  t.customerId.equals(customerId),
            ))
            .getSingleOrNull();

    return task != null;
  }

  Future<int> getTasksCount({
    required int userId,
    required String customerId,
  }) async {
    final countQuery = selectOnly(taskTable)
      ..addColumns([taskTable.id.count()])
      ..where(
        taskTable.userId.equals(userId) &
            taskTable.customerId.equals(customerId),
      );

    final result = await countQuery.getSingle();
    return result.read(taskTable.id.count()) ?? 0;
  }

  Future<void> insertTasks(List<TaskTableCompanion> companions) async {
    await batch((batch) {
      batch.insertAll(taskTable, companions);
    });
  }

  Future<int> deleteAllTasks({
    required int userId,
    required String customerId,
  }) {
    return (delete(taskTable)..where(
          (t) => t.userId.equals(userId) & t.customerId.equals(customerId),
        ))
        .go();
  }

  // === generated_end:base ===

  // === generated_start:oneToManyMethods ===
  Future<List<TaskTableData>> getTasksByCategoryId(
    String categoryId, {
    required int userId,
    required String customerId,
  }) =>
      (select(taskTable)..where(
            (t) =>
                t.categoryId.equals(categoryId) &
                t.userId.equals(userId) &
                t.customerId.equals(customerId) &
                t.isDeleted.equals(false),
          ))
          .get();
  // === generated_end:oneToManyMethods ===
}
