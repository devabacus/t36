// manifest: entity
// === generated_start:base ===
import 'package:drift/drift.dart';
import 'package:t36_client/t36_client.dart' as serverpod;
import 'package:uuid/uuid_value.dart';

import '../../../../../../core/data/datasources/local/database.dart';
import '../tables/extensions/category_table_extension.dart';
import '../../../models/category/category_model.dart';
import '../../../models/extensions/category_model_extension.dart';
import '../../../../../../core/data/datasources/local/database_types.dart';
import '../daos/category/category_dao.dart';
import '../interfaces/category_local_datasource_service.dart';

class CategoryLocalDataSource implements ICategoryLocalDataSource {
  final CategoryDao _categoryDao;

  CategoryLocalDataSource(this._categoryDao);

  @override
  Future<List<CategoryModel>> getCategories({
    required int userId,
    required String customerId,
  }) async {
    final categories = await _categoryDao.getCategories(
      userId: userId,
      customerId: customerId,
    );
    return categories.toModels();
  }

  @override
  Stream<List<CategoryModel>> watchCategories({
    required int userId,
    required String customerId,
  }) {
    return _categoryDao
        .watchCategories(userId: userId, customerId: customerId)
        .map((list) => list.toModels());
  }

  @override
  Future<CategoryModel?> getCategoryById(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    try {
      final category = await _categoryDao.getCategoryById(
        id,
        userId: userId,
        customerId: customerId,
      );
      return category?.toModel();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<CategoryModel>> getCategoriesByIds(
    List<String> ids, {
    required int userId,
    required String customerId,
  }) async {
    final categoriesData = await _categoryDao.getCategoriesByIds(
      ids,
      userId: userId,
      customerId: customerId,
    );
    return categoriesData.toModels();
  }

  @override
  Future<String> createCategory(CategoryModel category) {
    final companion = category.toCompanion().copyWith(
      syncStatus: const Value(SyncStatus.local),
    );
    return _categoryDao.createCategory(companion);
  }

  @override
  Future<bool> updateCategory(CategoryModel category) {
    final companion = category.toCompanionWithId().copyWith(
      syncStatus: const Value(SyncStatus.local),
    );
    return _categoryDao.updateCategoryById(
      category.id,
      companion,
      userId: category.userId,
      customerId: category.customerId,
    );
  }

  @override
  Future<bool> deleteCategory(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    final companion = CategoryTableCompanion(
      isDeleted: Value(true),
      lastModified: Value(DateTime.now()),
      syncStatus: Value(SyncStatus.local),
    );
    final result = await _categoryDao.updateCategoryById(
      id,
      companion,
      userId: userId,
      customerId: customerId,
    );
    return result;
  }

  @override
  Future<List<CategoryTableData>> getAllLocalChanges({
    required int userId,
    required String customerId,
  }) {
    return (_categoryDao.select(_categoryDao.categoryTable)..where(
          (t) =>
              (t.syncStatus.equals(SyncStatus.synced.name)).not() &
              t.userId.equals(userId) &
              t.customerId.equals(customerId),
        ))
        .get();
  }

  @override
  Future<void> physicallyDeleteCategory(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    await _categoryDao.physicallyDeleteCategory(
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
    await _categoryDao.db
        .into(_categoryDao.categoryTable)
        .insertOnConflictUpdate(
          (serverChange as serverpod.Category).toCompanion(status),
        );
  }

  @override
  Future<List<CategoryTableData>> reconcileServerChanges(
    List<dynamic> serverChanges, {
    required int userId,
    required String customerId,
  }) async {
    final allLocalChanges = await getAllLocalChanges(
      userId: userId,
      customerId: customerId,
    );
    final localChangesMap = {for (var c in allLocalChanges) c.id: c};

    await _categoryDao.db.transaction(() async {
      for (final serverChange in serverChanges as List<serverpod.Category>) {
        if (serverChange.userId != userId ||
            serverChange.customerId.toString() != customerId) {
          continue;
        }

        final localRecord =
            await (_categoryDao.select(_categoryDao.categoryTable)..where(
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
            await physicallyDeleteCategory(
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
    if (event is! serverpod.CategorySyncEvent) return;

    switch (event.type) {
      case serverpod.SyncEventType.create:
      case serverpod.SyncEventType.update:
        if (event.category != null &&
            event.category!.userId == userId &&
            event.category!.customerId == UuidValue.fromString(customerId)) {
          await insertOrUpdateFromServer(event.category!, SyncStatus.synced);
          print(
            '  -> (Real-time) СОЗДАНА/ОБНОВЛЕНА: "${event.category!.id}"',
          );
        }
        break;
    }
  }

  // === generated_end:base ===
}
