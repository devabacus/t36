// manifest: manyToMany

import 'package:drift/drift.dart';

import '../../../../../../../core/data/datasources/local/database.dart';
import '../../../../../../../core/data/datasources/local/interfaces/i_database_service.dart';
import '../../tables/task_tag_map_table.dart';

part 'task_tag_map_dao.g.dart';

@DriftAccessor(tables: [TaskTagMapTable])
class TaskTagMapDao extends DatabaseAccessor<AppDatabase>
    with _$TaskTagMapDaoMixin {
  TaskTagMapDao(IDatabaseService databaseService)
    : super(databaseService.database);

  AppDatabase get db => attachedDatabase;

  /// Создает новую связь Task-Tag.
  /// Вставляет или заменяет запись, если она уже существует.
  Future<String> createTaskTagMap(TaskTagMapTableCompanion companion) async {
    final id = companion.id.value;
    await into(
      taskTagMapTable,
    ).insert(companion, mode: InsertMode.insertOrReplace);
    return id;
  }

  /// Обновляет существующую связь (например, для изменения syncStatus).
  Future<bool> updateTaskTagMap(
    TaskTagMapTableCompanion companion, {
    required int userId,
    required String customerId,
  }) async {
    final idToUpdate = companion.id.value;
    final updatedRows = await (update(taskTagMapTable)..where(
      (t) =>
          t.id.equals(idToUpdate) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).write(companion);
    return updatedRows > 0;
  }

  Future<int> updateRelationsByTaskId(
    String taskId,
    TaskTagMapTableCompanion companion, {
    required int userId,
    required String customerId,
  }) async {
    final updatedRows = await (update(taskTagMapTable)..where(
      (t) =>
          t.taskId.equals(taskId) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).write(companion);

    print('DAO: Массово обновлено $updatedRows связей для задачи $taskId');
    return updatedRows;
  }

  /// Физически удаляет связь из базы данных. Используется после синхронизации.
  Future<int> physicallyDeleteTaskTagMap(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    return (delete(taskTagMapTable)..where(
      (t) =>
          t.id.equals(id) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).go();
  }

  /// Получает одну конкретную связь по ее уникальному ID.
  Future<TaskTagMapTableData?> getRelationById(
    String id, {
    required int userId,
    required String customerId,
  }) {
    return (select(taskTagMapTable)..where(
      (t) =>
          t.id.equals(id) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).getSingleOrNull();
  }

  /// Получает связь по taskId и tagId.
  Future<TaskTagMapTableData?> getRelationByTaskAndTag(
    String taskId,
    String tagId, {
    required int userId,
    required String customerId,
  }) {
    return (select(taskTagMapTable)..where(
      (t) =>
          t.taskId.equals(taskId) &
          t.tagId.equals(tagId) &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).getSingleOrNull();
  }

  /// Отслеживает все активные (не удаленные) связи для указанного пользователя.
  Stream<List<TaskTagMapTableData>> watchAllRelations({
    required int userId,
    required String customerId,
  }) {
    return (select(taskTagMapTable)..where(
      (t) =>
          t.userId.equals(userId) &
          t.customerId.equals(customerId) &
          t.isDeleted.equals(false),
    )).watch();
  }
}
