// manifest: entity
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../usecases/category_usecases.dart';
import '../../../data/providers/category/category_data_providers.dart';

part 'category_usecase_providers.g.dart';

@riverpod
GetCategoriesUseCase? getCategoriesUseCase(Ref ref) {
  final repository = ref.watch(currentUserCategoryRepositoryProvider);
  if (repository == null) {
    // пользователь не авторизован
    return null;
  }
  return GetCategoriesUseCase(repository);
}   

@riverpod
WatchCategoriesUseCase? watchCategoriesUseCase(Ref ref) {
  final repository = ref.watch(currentUserCategoryRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return WatchCategoriesUseCase(repository);
}

@riverpod
CreateCategoryUseCase? createCategoryUseCase(Ref ref) {
  final repository = ref.watch(currentUserCategoryRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return CreateCategoryUseCase(repository);
}

@riverpod
DeleteCategoryUseCase? deleteCategoryUseCase(Ref ref) {
  final repository = ref.watch(currentUserCategoryRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return DeleteCategoryUseCase(repository);
}

@riverpod
UpdateCategoryUseCase? updateCategoryUseCase(Ref ref) {
  final repository = ref.watch(currentUserCategoryRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return UpdateCategoryUseCase(repository);
}

@riverpod
GetCategoryByIdUseCase? getCategoryByIdUseCase(Ref ref) {
  final repository = ref.watch(currentUserCategoryRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return GetCategoryByIdUseCase(repository);
}
  
    