// manifest: manyToMany
import 'package:drift/drift.dart';
import 'package:t36/features/home/data/datasources/local/tables/extensions/task_tag_map_table_extension.dart';
import 'package:t36/features/home/domain/entities/extensions/task_tag_map_entity_extension.dart';
import 'package:t36_client/t36_client.dart' as serverpod;
import 'package:uuid/uuid.dart';

import '../../../../core/data/datasources/local/database.dart';
import '../../../../core/data/datasources/local/database_types.dart';
import '../../../../core/data/datasources/local/interfaces/sync_metadata_local_datasource_service.dart';
import '../../../../core/sync/base_sync_repository.dart';
import '../../domain/entities/tag/tag_entity.dart';
import '../../domain/entities/task/task_entity.dart';
import '../../domain/entities/task_tag_map/task_tag_map_entity.dart';
import '../../domain/repositories/tag_repository.dart';
import '../../domain/repositories/task_tag_map_repository.dart';
import '../datasources/local/interfaces/task_tag_map_local_datasource_service.dart';
import '../datasources/remote/interfaces/task_tag_map_remote_datasource_service.dart';
import '../models/extensions/task_model_extension.dart';
import '../models/extensions/task_tag_map_model_extension.dart';
import '../../../../core/services/logger/logger_service.dart';

class TaskTagMapRepositoryImpl extends BaseSyncRepository
    implements ITaskTagMapRepository {
  final ITaskTagMapLocalDataSource _localDataSource;
  final ITaskTagMapRemoteDataSource _remoteDataSource;
  final ITagRepository _tagRepository;

  @override
  String get entityTypeName => 'TaskTagMap';
  @override
  String get entityType => 'task_tag_maps_user_$userId';

  TaskTagMapRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    ISyncMetadataLocalDataSource syncMetadataDataSource,
    int userId,
    String customerId,
    this._tagRepository,
    LoggerService logger,
  ) : super(
        userId,
        customerId,
        syncMetadataDataSource: syncMetadataDataSource,
        logger: logger,
      ) {
    initEventBasedSync();
  }

  @override
  Stream<List<TaskTagMapEntity>> watchTaskTagMaps() {
    return _localDataSource
        .watchAllRelations(userId: userId, customerId: customerId)
        .map((models) => models.toEntities());
  }

  @override
  Future<String> createTaskTagMap(TaskTagMapEntity taskTagMap) async {
    final id = await _localDataSource.createTaskTagMap(taskTagMap.toModel());
    syncWithServer().catchError(
      (e, st) => logger.error(
        '⚠️ Фоновая синхронизация после создания связи не удалась',
        e,
        st,
      ),
    );
    return id;
  }

  @override
  Future<bool> deleteTaskTagMap(TaskTagMapEntity taskTagMap) async {
    final result = await _localDataSource.updateTaskTagMap(
      taskTagMap.toModel(),
    );
    syncWithServer().catchError(
      (e, st) => logger.error(
        '⚠️ Фоновая синхронизация после удаления связи не удалась',
        e,
        st,
      ),
    );
    return result;
  }

  @override
  Future<void> addTagToTask({
    required String taskId,
    required String tagId,
  }) async {
    final newRelation = TaskTagMapEntity(
      id: const Uuid().v7(),
      userId: userId,
      customerId: customerId,
      createdAt: DateTime.now().toUtc(),
      lastModified: DateTime.now().toUtc(),
      taskId: taskId,
      tagId: tagId,
    );
    await createTaskTagMap(newRelation);
  }

  @override
  Future<void> removeTagFromTask({
    required String taskId,
    required String tagId,
  }) async {
    try {
      // Находим связь по taskId и tagId
      final relation = await _localDataSource.getRelationByTaskAndTag(
        taskId,
        tagId,
        userId: userId,
        customerId: customerId,
      );

      if (relation != null) {
        // Удаляем связь по найденному ID
        await deleteTaskTagMap(relation.copyWith(isDeleted: true).toEntity());
        logger.info('✅ Связь найдена и удалена: Task($taskId) ↔ Tag($tagId)');
      } else {
        logger.warning('⚠️ Связь не найдена: Task($taskId) ↔ Tag($tagId)');
      }
    } catch (e, st) {
      logger.error(
        '❌ Ошибка удаления связи Task($taskId) ↔ Tag($tagId)',
        e,
        st,
      );
      rethrow;
    }
  }

  @override
  Future<void> removeAllTagsFromTask(String taskId) async {
    try {
      final companion = TaskTagMapTableCompanion(
        isDeleted: const Value(true),
        lastModified: Value(DateTime.now().toUtc()),
        syncStatus: const Value(SyncStatus.local),
      );

      await _localDataSource.updateRelationsByTaskId(
        taskId,
        companion,
        userId: userId,
        customerId: customerId,
      );
      logger.info(
        '✅ Все связи для источника $taskId помечены для удаления локально.',
      );
      // Запускаем фоновую синхронизацию, чтобы сервер узнал об удалениях
      syncWithServer().catchError(
        (e, st) => logger.error(
          '⚠️ Фоновая синхронизация после очистки тегов не удалась',
          e,
          st,
        ),
      );
    } catch (e, st) {
      logger.error('❌ Ошибка при удалении всех записей $taskId', e, st);
      rethrow;
    }
  }

  @override
  Future<List<TagEntity>> getTagsForTask(String taskId) async {
    final allRelations =
        await _localDataSource
            .watchAllRelations(userId: userId, customerId: customerId)
            .first;

    final tagIdsForTask =
        allRelations
            .where((relation) => relation.taskId == taskId)
            .map((relation) => relation.tagId)
            .toList();

    if (tagIdsForTask.isEmpty) {
      return [];
    }
    return _tagRepository.getTagsByIds(tagIdsForTask);
  }

  @override
  Future<List<TaskEntity>> getTasksForTag(String tagId) async {
    final serverTasks = await _remoteDataSource.getTasksForTag(
      serverpod.UuidValue.fromString(tagId),
    );
    return serverTasks.toModels().toEntities();
  }

  @override
  Future<List<dynamic>> getChangesFromServer(DateTime? since) {
    return _remoteDataSource.getTaskTagMapsSince(since);
  }

  @override
  Future<List<dynamic>> reconcileChanges(List<dynamic> serverChanges) {
    return _localDataSource.reconcileServerChanges(
      serverChanges,
      userId: userId,
      customerId: customerId,
    );
  }

  @override
  Future<void> pushLocalChanges(List<dynamic> localChangesToPush) async {
    for (final localChange in localChangesToPush as List<TaskTagMapTableData>) {
      if (localChange.isDeleted) {
        try {
          // Вместо удаления по локальному ID, удаляем по бизнес-ключу
          await _syncDeleteByTaskAndTag(localChange.taskId, localChange.tagId);
          await _localDataSource.physicallyDeleteTaskTagMap(
            localChange.id,
            userId: userId,
            customerId: customerId,
          );
          logger.info(
            '    -> ✅ Удаление связи для Task ${localChange.taskId.substring(0, 8)}... синхронизировано с сервером.',
          );
        } catch (e, st) {
          logger.error(
            '    -> ⚠️ Не удалось синхронизировать удаление связи для Task: ${localChange.taskId}. Повторим позже.',
            e,
            st,
          );
        }
      } else if (localChange.syncStatus == SyncStatus.local) {
        try {
          final syncedEntity = await _syncCreateToServer(
            localChange.toModel().toEntity(),
          );
          await _localDataSource.insertOrUpdateFromServer(
            syncedEntity,
            SyncStatus.synced,
          );
          logger.info(
            '    -> ✅ Создание/обновление связи ID ${localChange.id.substring(0, 8)}... синхронизировано с сервером.',
          );
        } catch (e, st) {
          logger.error(
            '    -> ⚠️ Не удалось синхронизировать создание/обновление связи ID: ${localChange.id}. Повторим позже.',
            e,
            st,
          );
        }
      }
    }
  }

  // Новый вспомогательный метод для вызова удаления по Task и Tag ID
  Future<void> _syncDeleteByTaskAndTag(String taskId, String tagId) async {
    await _remoteDataSource.deleteTaskTagMapByTaskAndTag(
      serverpod.UuidValue.fromString(taskId),
      serverpod.UuidValue.fromString(tagId),
    );
  }

  Future<serverpod.TaskTagMap> _syncCreateToServer(
    TaskTagMapEntity entity,
  ) async {
    return await _remoteDataSource.createTaskTagMap(
      entity.toServerpodTaskTagMap(),
    );
  }

  @override
  Stream<dynamic> watchEvents() => _remoteDataSource.watchEvents();

  @override
  Future<void> handleSyncEvent(dynamic event) async {
    await _localDataSource.handleSyncEvent(
      event,
      userId: userId,
      customerId: customerId,
    );
  }

  @override
  Future<TaskTagMapEntity?> getTaskTagMapById(String id) async {
    final model = await _localDataSource.getRelationById(
      id,
      userId: userId,
      customerId: customerId,
    );
    return model?.toEntity();
  }

  @override
  Future<bool> updateTaskTagMap(TaskTagMapEntity taskTagMap) async {
    final result = await _localDataSource.updateTaskTagMap(
      taskTagMap.toModel(),
    );
    syncWithServer().catchError(
      (e, st) => logger.error(
        '⚠️ Фоновая синхронизация после обновления связи не удалась',
        e,
        st,
      ),
    );
    return result;
  }
}
