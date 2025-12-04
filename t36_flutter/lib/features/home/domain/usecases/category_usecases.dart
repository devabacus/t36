// manifest: entity
import '../repositories/category_repository.dart';
import '../entities/category/category_entity.dart';

class CreateCategoryUseCase {
  final ICategoryRepository _repository;
  
  CreateCategoryUseCase(this._repository);
  
  Future<String> call(CategoryEntity category) {
    return _repository.createCategory(category);
  }
}

class UpdateCategoryUseCase {
  final ICategoryRepository _repository;

  UpdateCategoryUseCase(this._repository);

  Future<bool> call(CategoryEntity category) async {
    return _repository.updateCategory(category);
  }
}

class DeleteCategoryUseCase {
  final ICategoryRepository _repository;

  DeleteCategoryUseCase(this._repository);

  Future<bool> call(String id) async {
    return _repository.deleteCategory(id);
  }
}

class GetCategoriesUseCase {
  final ICategoryRepository _repository;

  GetCategoriesUseCase(this._repository);

  Future<List<CategoryEntity>> call() {
    return _repository.getCategories();
  }
}

class GetCategoryByIdUseCase {
  final ICategoryRepository _repository;

  GetCategoryByIdUseCase(this._repository);

  Future<CategoryEntity?> call(String id) {
    return _repository.getCategoryById(id);
  }
}

class WatchCategoriesUseCase {
  final ICategoryRepository _repository;

  WatchCategoriesUseCase(this._repository);

  Stream<List<CategoryEntity>> call() {
    return _repository.watchCategories();
  }
}
