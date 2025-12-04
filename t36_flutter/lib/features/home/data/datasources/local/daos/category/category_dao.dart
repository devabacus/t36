// manifest: entity

// === generated_start:base ===
import 'package:drift/drift.dart';
import '../../../../../../../core/data/datasources/local/database.dart';
import '../../../../../../../core/data/datasources/local/interfaces/i_database_service.dart';
import '../../tables/category_table.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [CategoryTable])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(IDatabaseService databaseService)
    : super(databaseService.database);

  AppDatabase get db => attachedDatabase;

  Future<List<CategoryTableData>> getCategories({
    required int userId,
    required String customerId,
  }) =>
      (select(categoryTable)
            ..where((t) => t.isDeleted.equals(false))
            ..where(
              (t) => t.userId.equals(userId) & t.customerId.equals(customerId),
            ))
          .get();

  Stream<List<CategoryTableData>> watchCategories({
    required int userId,
    required String customerId,
  }) =>
      (select(categoryTable)
            ..where((t) => t.isDeleted.equals(false))
            ..where(
              (t) => t.userId.equals(userId) & t.customerId.equals(customerId),
            ))
          .watch();

  Future<CategoryTableData?> getCategoryById(
    String id, {
    required int userId,
    required String customerId,
  }) =>
      (select(categoryTable)..where(
            (t) =>
                t.id.equals(id) &
                t.userId.equals(userId) &
                t.customerId.equals(customerId),
          ))
          .getSingleOrNull();

  Future<List<CategoryTableData>> getCategoriesByIds(
    List<String> ids, {
    required int userId,
    required String customerId,
  }) {
    if (ids.isEmpty) {
      return Future.value([]);
    }
    return (select(categoryTable)..where(
          (t) =>
              t.id.isIn(ids) &
              t.userId.equals(userId) &
              t.customerId.equals(customerId) &
              t.isDeleted.equals(false),
        ))
        .get();
  }

  Future<String> createCategory(CategoryTableCompanion companion) async {
    final id = companion.id.value;
    try {
      final existingCategory =
          await (select(categoryTable)..where(
                (t) =>
                    t.id.equals(id) &
                    t.userId.equals(companion.userId.value) &
                    t.customerId.equals(companion.customerId.value),
              ))
              .getSingleOrNull();

      if (existingCategory != null) {
        throw StateError('category with ID $id exists');
      }

      await into(categoryTable).insert(companion);
      return id;
    } catch (e) {
      print('fail of creating category: $e');
      rethrow;
    }
  }

  Future<bool> updateCategoryById(
    String id,
    CategoryTableCompanion companion, {
    required int userId,
    required String customerId,
  }) async {
    // final idToUpdate = companion.id.value;
    final updatedRows =
        await (update(categoryTable)..where(
              (t) =>
                  t.id.equals(id) &
                  t.userId.equals(userId) &
                  t.customerId.equals(customerId),
            ))
            .write(companion);
    return updatedRows > 0;
  }

  Future<int> physicallyDeleteCategory(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    return (delete(categoryTable)..where(
          (t) =>
              t.id.equals(id) &
              t.userId.equals(userId) &
              t.customerId.equals(customerId),
        ))
        .go();
  }

  Future<bool> categoryExists(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    if (id.isEmpty) return false;

    final category =
        await (select(categoryTable)..where(
              (t) =>
                  t.id.equals(id) &
                  t.userId.equals(userId) &
                  t.customerId.equals(customerId),
            ))
            .getSingleOrNull();

    return category != null;
  }

  Future<int> getCategoriesCount({
    required int userId,
    required String customerId,
  }) async {
    final countQuery = selectOnly(categoryTable)
      ..addColumns([categoryTable.id.count()])
      ..where(
        categoryTable.userId.equals(userId) &
            categoryTable.customerId.equals(customerId),
      );

    final result = await countQuery.getSingle();
    return result.read(categoryTable.id.count()) ?? 0;
  }

  Future<void> insertCategories(List<CategoryTableCompanion> companions) async {
    await batch((batch) {
      batch.insertAll(categoryTable, companions);
    });
  }

  Future<int> deleteAllCategories({
    required int userId,
    required String customerId,
  }) {
    return (delete(categoryTable)..where(
          (t) => t.userId.equals(userId) & t.customerId.equals(customerId),
        ))
        .go();
  }

  // === generated_end:base ===
}
