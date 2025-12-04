// manifest: manyToMany
import 'package:drift/drift.dart';
import 'package:t36_client/t36_client.dart' as serverpod;

import '../../../../../../core/data/datasources/local/database.dart';
import '../../../../../../core/data/datasources/local/database_types.dart';
import '../../../models/task_tag_map/task_tag_map_model.dart';
import '../daos/task_tag_map/task_tag_map_dao.dart';
import '../interfaces/task_tag_map_local_datasource_service.dart';
import '../tables/extensions/task_tag_map_table_extension.dart';
import '../../../models/extensions/task_tag_map_model_extension.dart';

class TaskTagMapLocalDataSource implements ITaskTagMapLocalDataSource {
  final TaskTagMapDao _dao;

  TaskTagMapLocalDataSource(this._dao);

  @override
  Future<String> createTaskTagMap(TaskTagMapModel model) {
    return _dao.createTaskTagMap(
      model.toCompanion().copyWith(syncStatus: const Value(SyncStatus.local)),
    );
  }

  @override
  Future<bool> updateTaskTagMap(TaskTagMapModel model) {
    return _dao.updateTaskTagMap(
      model.toCompanionWithId().copyWith(
        syncStatus: const Value(SyncStatus.local),
      ),
      userId: model.userId,
      customerId: model.customerId,
    );
  }

  @override
  Future<int> updateRelationsByTaskId(
    String taskId,
    TaskTagMapTableCompanion companion, {
    required int userId,
    required String customerId,
  }) {
    return _dao.updateRelationsByTaskId(
      taskId,
      companion,
      userId: userId,
      customerId: customerId,
    );
  }

  @override
  Future<TaskTagMapModel?> getRelationById(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    final result = await _dao.getRelationById(
      id,
      userId: userId,
      customerId: customerId,
    );
    return result?.toModel();
  }

  @override
  Future<TaskTagMapModel?> getRelationByTaskAndTag(
    String taskId,
    String tagId, {
    required int userId,
    required String customerId,
  }) async {
    final result = await _dao.getRelationByTaskAndTag(
      taskId,
      tagId,
      userId: userId,
      customerId: customerId,
    );
    return result?.toModel();
  }

  @override
  Stream<List<TaskTagMapModel>> watchAllRelations({
    required int userId,
    required String customerId,
  }) {
    return _dao
        .watchAllRelations(userId: userId, customerId: customerId)
        .map((list) => list.toModels());
  }

  @override
  Future<List<TaskTagMapTableData>> getAllLocalChanges({
    required int userId,
    required String customerId,
  }) {
    return (_dao.select(_dao.taskTagMapTable)..where(
      (t) =>
          (t.syncStatus.equals(SyncStatus.synced.name)).not() &
          t.userId.equals(userId) &
          t.customerId.equals(customerId),
    )).get();
  }

  @override
  Future<int> physicallyDeleteTaskTagMap(
    String id, {
    required int userId,
    required String customerId,
  }) {
    return _dao.physicallyDeleteTaskTagMap(
      id,
      userId: userId,
      customerId: customerId,
    );
  }

  @override
  Future<void> insertOrUpdateFromServer(
    dynamic serverChange,
    SyncStatus status,
  ) async {
    final serverTaskTagMap = serverChange as serverpod.TaskTagMap;

    // Оборачиваем в транзакцию для атомарности
    await _dao.db.transaction(() async {
      // 1. Ищем, существует ли локальная запись для этой *связи* (по taskId и tagId).
      //    У нее может быть другой, "неправильный" ID.
      final existingRecord =
          await (_dao.select(_dao.taskTagMapTable)..where(
            (t) =>
                t.taskId.equals(serverTaskTagMap.taskId.toString()) &
                t.tagId.equals(serverTaskTagMap.tagId.toString()) &
                t.userId.equals(serverTaskTagMap.userId) &
                t.customerId.equals(serverTaskTagMap.customerId.toString()),
          )).getSingleOrNull();

      // 2. Если такая запись существует, мы должны ее физически удалить,
      //    чтобы избежать конфликта уникальности и освободить место для авторитетной записи с сервера.
      if (existingRecord != null) {
        await _dao.physicallyDeleteTaskTagMap(
          existingRecord.id,
          userId: existingRecord.userId,
          customerId: existingRecord.customerId,
        );
        print(
          '    -> Удалена устаревшая локальная связь: ${existingRecord.id}',
        );
      }

      // 3. Вставляем новую, авторитетную запись с сервера с правильным ID.
      //    Это гарантирует, что все клиенты будут иметь одинаковую запись с одинаковым ID.
      final companion = serverTaskTagMap.toCompanion(status);
      await _dao.db.into(_dao.taskTagMapTable).insert(companion);
      print('    -> СОЗДАНА/ОБНОВЛЕНА связь с сервера: ${serverTaskTagMap.id}');
    });
  }

  @override
  Future<void> handleSyncEvent(
    dynamic event, {
    required int userId,
    required String customerId,
  }) async {
    if (event is! serverpod.TaskTagMapSyncEvent) return;
    final taskTagMap = event.taskTagMap;

    switch (event.type) {
      case serverpod.SyncEventType.create:
      case serverpod.SyncEventType.update:
        if (taskTagMap != null &&
            taskTagMap.userId == userId &&
            taskTagMap.customerId.toString() == customerId) {
          await insertOrUpdateFromServer(taskTagMap, SyncStatus.synced);

          if (taskTagMap.isDeleted) {
            print(
              '  -> (Real-time) ОБРАБОТАНО "мягкое" удаление с сервера: ID ${taskTagMap.id}',
            );
          } else {
            print(
              '  -> (Real-time) ОБРАБОТАНО создание/обновление с сервера: ID ${taskTagMap.id}',
            );
          }
        }
    }
  }

  @override
  Future<List<TaskTagMapTableData>> reconcileServerChanges(
    List<dynamic> serverChanges, {
    required int userId,
    required String customerId,
  }) async {
    final localChanges = await getAllLocalChanges(
      userId: userId,
      customerId: customerId,
    );
    final localChangesMap = {for (var c in localChanges) c.id: c};

    await _dao.db.transaction(() async {
      for (final serverChange in serverChanges as List<serverpod.TaskTagMap>) {
        if (serverChange.userId != userId &&
            serverChange.customerId.toString() != customerId)
          continue;

        final localRecord =
            await (_dao.select(_dao.taskTagMapTable)..where(
              (t) => t.id.equals(serverChange.id.toString()),
            )).getSingleOrNull();

        final serverTime = serverChange.lastModified;

        if (localRecord == null) {
          if (!serverChange.isDeleted) {
            await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
            print('    -> СОЗДАНА с сервера: Связь ID ${serverChange.id}');
          }
          continue;
        }

        final localTime = localRecord.lastModified;

        if (serverChange.isDeleted) {
          if (localTime.isAfter(serverTime) &&
              localRecord.syncStatus == SyncStatus.local) {
            print(
              '    -> КОНФЛИКТ: Локальная версия связи ID ${localRecord.id} новее серверного "надгробия". Локальное изменение побеждает.',
            );
          } else {
            print(
              '    -> ✅ Серверное "надгробие" новее или нет локального конфликта. Удаляем локальную запись: ID=${localRecord.id}.',
            );
            await physicallyDeleteTaskTagMap(
              localRecord.id,
              userId: userId,
              customerId: customerId,
            );
            localChangesMap.remove(localRecord.id);
          }
        } else {
          if (localRecord.syncStatus == SyncStatus.local ||
              localRecord.isDeleted) {
            if (serverTime.isAfter(localTime)) {
              print(
                '    -> КОНФЛИКТ: Сервер новее для связи ID ${serverChange.id}. Применяем серверные изменения.',
              );
              await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
              localChangesMap.remove(localRecord.id);
            } else {
              print(
                '    -> КОНФЛИКТ: Локальная версия связи ID ${localRecord.id} новее. Она будет отправлена на сервер.',
              );
            }
          } else {
            await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
            print('    -> ОБНОВЛЕНА с сервера: Связь ID ${serverChange.id}');
          }
        }
      }
    });
    return localChangesMap.values.toList();
  }
}

