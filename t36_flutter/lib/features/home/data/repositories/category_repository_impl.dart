// manifest: entity
// === generated_start:base ===
import '../../domain/entities/extensions/category_entity_extension.dart';
import '../../data/datasources/local/tables/extensions/category_table_extension.dart';
import 'package:t36_client/t36_client.dart' as serverpod;

import '../../../../core/data/datasources/local/database.dart';
import '../../../../core/sync/base_sync_repository.dart';
import '../../domain/entities/category/category_entity.dart';
import '../../domain/repositories/category_repository.dart';
import '../../../../core/data/datasources/local/database_types.dart';
import '../datasources/local/interfaces/category_local_datasource_service.dart';
import '../../../../core/data/datasources/local/interfaces/sync_metadata_local_datasource_service.dart';
import '../datasources/remote/interfaces/category_remote_datasource_service.dart';
import '../models/extensions/category_model_extension.dart';
import '../../../../core/services/logger/logger_service.dart';

class CategoryRepositoryImpl extends BaseSyncRepository
    implements ICategoryRepository {
  final ICategoryLocalDataSource _localDataSource;
  final ICategoryRemoteDataSource _remoteDataSource;

  @override
  String get entityTypeName => 'Category';
  @override
  String get entityType => 'categories_user_$userId';

  CategoryRepositoryImpl(
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
      '✅ CategoryRepositoryImpl: Создан экземпляр для userId: $userId',
    );
    initEventBasedSync();
  }

  @override
  Future<List<serverpod.Category>> getChangesFromServer(DateTime? since) {
    return _remoteDataSource.getCategoriesSince(since);
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
    for (final localChange in localChangesToPush as List<CategoryTableData>) {
      if (localChange.isDeleted) {
        try {
          await _syncUpdateToServer(localChange.toModel().toEntity());
          await _localDataSource.physicallyDeleteCategory(
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
          final serverRecord = await _remoteDataSource.getCategoryById(
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
  Stream<serverpod.CategorySyncEvent> watchEvents() =>
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
  Stream<List<CategoryEntity>> watchCategories() {
    return _localDataSource
        .watchCategories(userId: userId, customerId: customerId)
        .map((models) => models.toEntities());
  }

  @override
  Future<String> createCategory(CategoryEntity category) async {
    final categoryWithUser = category.copyWith(
      userId: userId,
      customerId: customerId,
      lastModified: DateTime.now().toUtc(),
    );
    final id = await _localDataSource.createCategory(
      categoryWithUser.toModel(),
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
  Future<bool> updateCategory(CategoryEntity category) async {
    final categoryWithUser = category.copyWith(
      userId: userId,
      customerId: customerId,
      lastModified: DateTime.now().toUtc(),
    );
    final result = await _localDataSource.updateCategory(
      categoryWithUser.toModel(),
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
  Future<bool> deleteCategory(String id) async {
    final result = await _localDataSource.deleteCategory(
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
  Future<List<CategoryEntity>> getCategories() async => _localDataSource
      .getCategories(userId: userId, customerId: customerId)
      .then((models) => models.toEntities());

  @override
  Future<CategoryEntity?> getCategoryById(String id) async {
    final model = await _localDataSource.getCategoryById(
      id,
      userId: userId,
      customerId: customerId,
    );
    return model?.toEntity();
  }

  @override
  Future<List<CategoryEntity>> getCategoriesByIds(List<String> ids) async {
    ;
    final models = await _localDataSource.getCategoriesByIds(
      ids,
      userId: userId,
      customerId: customerId,
    );
    return models.toEntities();
  }

  Future<void> _syncCreateToServer(CategoryEntity category) async {
    try {
      final serverCategory = category.toServerpodCategory();
      final syncedCategory = await _remoteDataSource.createCategory(
        serverCategory,
      );
      await _localDataSource.insertOrUpdateFromServer(
        syncedCategory,
        SyncStatus.synced,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _syncUpdateToServer(CategoryEntity category) async {
    try {
      final serverCategory = category.toServerpodCategory();
      await _remoteDataSource.updateCategory(serverCategory);
      await _localDataSource.insertOrUpdateFromServer(
        serverCategory,
        SyncStatus.synced,
      );
    } catch (e) {
      rethrow;
    }
  }

  // === generated_end:base ===
}
