// manifest: entity
import 'package:t36/core/data/datasources/local/database.dart';

import '../../../models/category/category_model.dart';
import '../../../../../../core/data/datasources/local/database_types.dart';

abstract class ICategoryLocalDataSource {
  Future<List<CategoryModel>> getCategories({required int userId, required String customerId});
  Stream<List<CategoryModel>> watchCategories({required int userId, required String customerId});
  Future<CategoryModel?> getCategoryById(String id, {required int userId, required String customerId});
  Future<List<CategoryModel>> getCategoriesByIds(List<String> ids, {required int userId, required String customerId});
  Future<String> createCategory(CategoryModel category);
  Future<bool> updateCategory(CategoryModel category);
  Future<bool> deleteCategory(String id, {required int userId, required String customerId});
  Future<List<CategoryTableData>> getAllLocalChanges({required int userId, required String customerId});
  Future<List<CategoryTableData>> reconcileServerChanges(List<dynamic> serverChanges, {required int userId, required String customerId});
  Future<void> physicallyDeleteCategory(String id, {required int userId, required String customerId});
  Future<void> insertOrUpdateFromServer(dynamic serverChange, SyncStatus status);
  Future<void> handleSyncEvent(dynamic event, {required int userId, required String customerId});
}

