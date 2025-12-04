// manifest: entity
import 'package:t36_client/t36_client.dart';

abstract class ICategoryRemoteDataSource {
  Stream<CategorySyncEvent> watchEvents();
  Future<List<Category>> getCategories();
  Future<List<Category>> getCategoriesSince(DateTime? since); 
  Future<List<Category>> syncCategories(List<Category> localCategories);
  Future<Category?> getCategoryById(UuidValue id);
  Future<Category> createCategory(Category category);
  Future<bool> updateCategory(Category category);
  Future<bool> checkConnection();
}

