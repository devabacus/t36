// manifest: entity
// === generated_start:base ===
import '../../domain/entities/extensions/tag_entity_extension.dart';
import '../../data/datasources/local/tables/extensions/tag_table_extension.dart';
import 'package:t36_client/t36_client.dart' as serverpod;

import '../../../../core/data/datasources/local/database.dart';
import '../../../../core/sync/base_sync_repository.dart';
import '../../domain/entities/tag/tag_entity.dart';
import '../../domain/repositories/tag_repository.dart';
import '../../../../core/data/datasources/local/database_types.dart';
import '../datasources/local/interfaces/tag_local_datasource_service.dart';
import '../../../../core/data/datasources/local/interfaces/sync_metadata_local_datasource_service.dart';
import '../datasources/remote/interfaces/tag_remote_datasource_service.dart';
import '../models/extensions/tag_model_extension.dart';
import '../../../../core/services/logger/logger_service.dart';

class TagRepositoryImpl extends BaseSyncRepository
    implements ITagRepository {
  final ITagLocalDataSource _localDataSource;
  final ITagRemoteDataSource _remoteDataSource;

  @override
  String get entityTypeName => 'Tag';
  @override
  String get entityType => 'tags_user_$userId';

  TagRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    ISyncMetadataLocalDataSource syncMetadataDataSource,
    LoggerService logger,
    int userId,
    String customerId,
  ) : super(
        userId,
        customerId,
        syncMetadataDataSource: syncMetadataDataSource,
        logger: logger,
      ) {
    logger.info(
      '✅ TagRepositoryImpl: Создан экземпляр для userId: $userId',
    );
    initEventBasedSync();
  }

  @override
  Future<List<serverpod.Tag>> getChangesFromServer(DateTime? since) {
    return _remoteDataSource.getTagsSince(since);
  }

  @override
  Future<List<dynamic>> reconcileChanges(List<dynamic> serverChanges) async {
    return _localDataSource.reconcileServerChanges(
      serverChanges,
      userId: userId,
      customerId: customerId,
    );
  }

  @override
  Future<void> pushLocalChanges(List<dynamic> localChangesToPush) async {
    for (final localChange in localChangesToPush as List<TagTableData>) {
      if (localChange.isDeleted) {
        try {
          await _syncUpdateToServer(localChange.toModel().toEntity());
          await _localDataSource.physicallyDeleteTag(
            localChange.id,
            userId: userId,
            customerId: customerId,
          );
          logger.info(
            '    -> ✅ Удаление "${localChange.id}" синхронизировано с сервером.',
          );
        } catch (e, st) {
          logger.error(
            '    -> ⚠️ Не удалось синхронизировать удаление ID: ${localChange.id}. Повторим позже.',
            e,
            st,
          );
        }
      } else if (localChange.syncStatus == SyncStatus.local) {
        try {
          final entity = localChange.toModel().toEntity();
          final serverRecord = await _remoteDataSource.getTagById(
            serverpod.UuidValue.fromString(entity.id),
          );
          if (serverRecord != null && !serverRecord.isDeleted) {
            await _syncUpdateToServer(entity);
          } else {
            await _syncCreateToServer(entity);
          }
          logger.info(
            '    -> ✅ Изменение "${localChange.id}" синхронизировано с сервером.',
          );
        } catch (e, st) {
          logger.error(
            '    -> ⚠️ Не удалось синхронизировать изменение ID: ${localChange.id}. Повторим позже.',
            e,
            st,
          );
        }
      }
    }
  }

  @override
  Stream<serverpod.TagSyncEvent> watchEvents() =>
      _remoteDataSource.watchEvents();

  @override
  Future<void> handleSyncEvent(dynamic event) async {
    await _localDataSource.handleSyncEvent(
      event,
      userId: userId,
      customerId: customerId,
    );
  }

  @override
  Stream<List<TagEntity>> watchTags() {
    return _localDataSource
        .watchTags(userId: userId, customerId: customerId)
        .map((models) => models.toEntities());
  }

  @override
  Future<String> createTag(TagEntity tag) async {
    final tagWithUser = tag.copyWith(
      userId: userId,
      customerId: customerId,
      lastModified: DateTime.now().toUtc(),
    );
    final id = await _localDataSource.createTag(
      tagWithUser.toModel(),
    );
    syncWithServer().catchError(
      (e, st) => logger.error(
        '⚠️ Фоновая синхронизация после создания не удалась',
        e,
        st,
      ),
    );
    return id;
  }

  @override
  Future<bool> updateTag(TagEntity tag) async {
    final tagWithUser = tag.copyWith(
      userId: userId,
      customerId: customerId,
      lastModified: DateTime.now().toUtc(),
    );
    final result = await _localDataSource.updateTag(
      tagWithUser.toModel(),
    );
    syncWithServer().catchError(
      (e, st) => logger.error(
        '⚠️ Фоновая синхронизация после обновления не удалась',
        e,
        st,
      ),
    );
    return result;
  }

  @override
  Future<bool> deleteTag(String id) async {
    final result = await _localDataSource.deleteTag(
      id,
      userId: userId,
      customerId: customerId,
    );
    syncWithServer().catchError(
      (e, st) => logger.error(
        '⚠️ Фоновая синхронизация после удаления не удалась',
        e,
        st,
      ),
    );
    return result;
  }

  @override
  Future<List<TagEntity>> getTags() async => _localDataSource
      .getTags(userId: userId, customerId: customerId)
      .then((models) => models.toEntities());

  @override
  Future<TagEntity?> getTagById(String id) async {
    final model = await _localDataSource.getTagById(
      id,
      userId: userId,
      customerId: customerId,
    );
    return model?.toEntity();
  }

  @override
  Future<List<TagEntity>> getTagsByIds(List<String> ids) async {
    ;
    final models = await _localDataSource.getTagsByIds(
      ids,
      userId: userId,
      customerId: customerId,
    );
    return models.toEntities();
  }

  Future<void> _syncCreateToServer(TagEntity tag) async {
    try {
      final serverTag = tag.toServerpodTag();
      final syncedTag = await _remoteDataSource.createTag(
        serverTag,
      );
      await _localDataSource.insertOrUpdateFromServer(
        syncedTag,
        SyncStatus.synced,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _syncUpdateToServer(TagEntity tag) async {
    try {
      final serverTag = tag.toServerpodTag();
      await _remoteDataSource.updateTag(serverTag);
      await _localDataSource.insertOrUpdateFromServer(
        serverTag,
        SyncStatus.synced,
      );
    } catch (e) {
      rethrow;
    }
  }

  // === generated_end:base ===
}
