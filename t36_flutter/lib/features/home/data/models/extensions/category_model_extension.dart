// manifest: entity
import 'package:drift/drift.dart';

import '../../../../../core/data/datasources/local/database.dart';
import 'package:t36_client/t36_client.dart' as serverpod;
import '../../../domain/entities/category/category_entity.dart';
import '../../../../../core/data/datasources/local/database_types.dart';
import '../category/category_model.dart';

extension CategoryModelExtension on CategoryModel {
  CategoryEntity toEntity() => CategoryEntity(
    id: id,
    userId: userId,
    customerId: customerId,
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,
    // === generated_start:simpleFields ===
  title: title
// === generated_end:simpleFields ===
  );

  CategoryTableCompanion toCompanion() => CategoryTableCompanion(
    id: Value(id),
    userId: Value(userId),
    customerId: Value(customerId),
    createdAt: Value(createdAt),
    lastModified: Value(lastModified),
    isDeleted: Value(isDeleted),
    syncStatus: Value(SyncStatus.local),

    // === generated_start:valueWrappedFields ===
  title: Value(title)
// === generated_end:valueWrappedFields ===
  );

  CategoryTableCompanion toCompanionWithId() => toCompanion();
}

extension CategoryModelListExtension on List<CategoryModel> {
  List<CategoryEntity> toEntities() =>
      map((model) => model.toEntity()).toList();
}

extension ServerpodCategoryToModelExtension on serverpod.Category {
  CategoryModel toModel() => CategoryModel(
    id: id.toString(),
    userId: userId,
    customerId: customerId.toString(),
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,
    // === generated_start:serverpodToModelParams ===
  title: title
// === generated_end:serverpodToModelParams ===
  );
}

extension ServerpodCategoryListToModelListExtension
    on List<serverpod.Category> {
  List<CategoryModel> toModels() =>
      map((serverpodModel) => serverpodModel.toModel()).toList();
}
