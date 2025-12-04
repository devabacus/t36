// manifest: entity
import '../../entities/tag/tag_entity.dart';
import '../../../data/models/tag/tag_model.dart';
import 'package:t36_client/t36_client.dart' as serverpod;

extension TagEntityExtension on TagEntity {
  TagModel toModel() => TagModel(
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

extension TagEntityListExtension on List<TagEntity> {
  List<TagModel> toModels() => map((entity) => entity.toModel()).toList();
}

extension ServerpodTagEntityExtensions on TagEntity {
  serverpod.Tag toServerpodTag() => serverpod.Tag(
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
