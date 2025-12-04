// manifest: entity
// === generated_start:base ===
import 'package:drift/drift.dart';
import 'package:t36_client/t36_client.dart' as serverpod;
import 'package:uuid/uuid_value.dart';

import '../../../../../../core/data/datasources/local/database.dart';
import '../tables/extensions/tag_table_extension.dart';
import '../../../models/tag/tag_model.dart';
import '../../../models/extensions/tag_model_extension.dart';
import '../../../../../../core/data/datasources/local/database_types.dart';
import '../daos/tag/tag_dao.dart';
import '../interfaces/tag_local_datasource_service.dart';

class TagLocalDataSource implements ITagLocalDataSource {
  final TagDao _tagDao;

  TagLocalDataSource(this._tagDao);

  @override
  Future<List<TagModel>> getTags({
    required int userId,
    required String customerId,
  }) async {
    final tags = await _tagDao.getTags(
      userId: userId,
      customerId: customerId,
    );
    return tags.toModels();
  }

  @override
  Stream<List<TagModel>> watchTags({
    required int userId,
    required String customerId,
  }) {
    return _tagDao
        .watchTags(userId: userId, customerId: customerId)
        .map((list) => list.toModels());
  }

  @override
  Future<TagModel?> getTagById(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    try {
      final tag = await _tagDao.getTagById(
        id,
        userId: userId,
        customerId: customerId,
      );
      return tag?.toModel();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<TagModel>> getTagsByIds(
    List<String> ids, {
    required int userId,
    required String customerId,
  }) async {
    final tagsData = await _tagDao.getTagsByIds(
      ids,
      userId: userId,
      customerId: customerId,
    );
    return tagsData.toModels();
  }

  @override
  Future<String> createTag(TagModel tag) {
    final companion = tag.toCompanion().copyWith(
      syncStatus: const Value(SyncStatus.local),
    );
    return _tagDao.createTag(companion);
  }

  @override
  Future<bool> updateTag(TagModel tag) {
    final companion = tag.toCompanionWithId().copyWith(
      syncStatus: const Value(SyncStatus.local),
    );
    return _tagDao.updateTagById(
      tag.id,
      companion,
      userId: tag.userId,
      customerId: tag.customerId,
    );
  }

  @override
  Future<bool> deleteTag(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    final companion = TagTableCompanion(
      isDeleted: Value(true),
      lastModified: Value(DateTime.now()),
      syncStatus: Value(SyncStatus.local),
    );
    final result = await _tagDao.updateTagById(
      id,
      companion,
      userId: userId,
      customerId: customerId,
    );
    return result;
  }

  @override
  Future<List<TagTableData>> getAllLocalChanges({
    required int userId,
    required String customerId,
  }) {
    return (_tagDao.select(_tagDao.tagTable)..where(
          (t) =>
              (t.syncStatus.equals(SyncStatus.synced.name)).not() &
              t.userId.equals(userId) &
              t.customerId.equals(customerId),
        ))
        .get();
  }

  @override
  Future<void> physicallyDeleteTag(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    await _tagDao.physicallyDeleteTag(
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
    await _tagDao.db
        .into(_tagDao.tagTable)
        .insertOnConflictUpdate(
          (serverChange as serverpod.Tag).toCompanion(status),
        );
  }

  @override
  Future<List<TagTableData>> reconcileServerChanges(
    List<dynamic> serverChanges, {
    required int userId,
    required String customerId,
  }) async {
    final allLocalChanges = await getAllLocalChanges(
      userId: userId,
      customerId: customerId,
    );
    final localChangesMap = {for (var c in allLocalChanges) c.id: c};

    await _tagDao.db.transaction(() async {
      for (final serverChange in serverChanges as List<serverpod.Tag>) {
        if (serverChange.userId != userId ||
            serverChange.customerId.toString() != customerId) {
          continue;
        }

        final localRecord =
            await (_tagDao.select(_tagDao.tagTable)..where(
                  (t) =>
                      t.id.equals(serverChange.id.toString()) &
                      t.userId.equals(userId) &
                      t.customerId.equals(customerId),
                ))
                .getSingleOrNull();

        if (localRecord == null) {
          if (!serverChange.isDeleted) {
            await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
            print('    -> СОЗДАНО с сервера: "${serverChange.id}"');
          }
          continue;
        }

        final serverTime = serverChange.lastModified;
        final localTime = localRecord.lastModified;

        if (serverChange.isDeleted) {
          if (localTime.isAfter(serverTime) &&
              localRecord.syncStatus == SyncStatus.local) {
            print(
              '    -> КОНФЛИКТ: Локальная версия "${localRecord.id}" новее серверного "надгробия". Локальное изменение побеждает.',
            );
          } else {
            print(
              '    -> ✅ Серверное "надгробие" новее или нет локального конфликта. Удаляем локальную запись: ID=${localRecord.id}, Title="${localRecord.id}".',
            );
            await physicallyDeleteTag(
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
                '    -> КОНФЛИКТ: Сервер новее для "${serverChange.id}". Применяем серверные изменения.',
              );
              await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
              localChangesMap.remove(localRecord.id);
            } else {
              print(
                '    -> КОНФЛИКТ: Локальная версия новее для "${localRecord.id}". Она будет отправлена на сервер.',
              );
            }
          } else {
            await insertOrUpdateFromServer(serverChange, SyncStatus.synced);
            print('    -> ОБНОВЛЕНО с сервера: "${serverChange.id}"');
          }
        }
      }
    });
    return localChangesMap.values.toList();
  }

  @override
  Future<void> handleSyncEvent(
    dynamic event, {
    required int userId,
    required String customerId,
  }) async {
    if (event is! serverpod.TagSyncEvent) return;

    switch (event.type) {
      case serverpod.SyncEventType.create:
      case serverpod.SyncEventType.update:
        if (event.tag != null &&
            event.tag!.userId == userId &&
            event.tag!.customerId == UuidValue.fromString(customerId)) {
          await insertOrUpdateFromServer(event.tag!, SyncStatus.synced);
          print(
            '  -> (Real-time) СОЗДАНА/ОБНОВЛЕНА: "${event.tag!.id}"',
          );
        }
        break;
    }
  }

  // === generated_end:base ===
}
