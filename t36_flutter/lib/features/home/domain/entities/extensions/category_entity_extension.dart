// manifest: entity
import '../../entities/category/category_entity.dart';
import '../../../data/models/category/category_model.dart';
import 'package:t36_client/t36_client.dart' as serverpod;

extension CategoryEntityExtension on CategoryEntity {
  CategoryModel toModel() => CategoryModel(
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
}

extension CategoryEntityListExtension on List<CategoryEntity> {
  List<CategoryModel> toModels() => map((entity) => entity.toModel()).toList();
}

extension ServerpodCategoryEntityExtensions on CategoryEntity {
  serverpod.Category toServerpodCategory() => serverpod.Category(
    id: serverpod.UuidValue.fromString(id),
    userId: userId,
    customerId: serverpod.UuidValue.fromString(customerId),
    createdAt: createdAt,
    lastModified: lastModified,
    isDeleted: isDeleted,
    // === generated_start:entityToServerpodParams ===
  title: title
// === generated_end:entityToServerpodParams ===
  );
}
