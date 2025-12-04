// manifest: entity
import 'package:drift/drift.dart';
import 'package:t36_client/t36_client.dart' as serverpod;

import '../../../../../../../core/data/datasources/local/database.dart';
import '../../../../models/tag/tag_model.dart';
import '../../../../../../../core/data/datasources/local/database_types.dart';

extension TagTableDataExtensions on TagTableData {
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

extension TagTableDataListExtensions on List<TagTableData> {
  List<TagModel> toModels() => map((data) => data.toModel()).toList();
}

extension ServerpodTagTableExtensions on serverpod.Tag {
  TagTableCompanion toCompanion(SyncStatus status) =>
      TagTableCompanion(
        id: Value(id.toString()),
        userId: Value(userId),
        customerId: Value(customerId.toString()),
        createdAt: Value(createdAt),
        lastModified: Value(lastModified),
        isDeleted: Value(isDeleted),
        syncStatus: Value(status),

// === generated_start:valueWrappedFields ===
  title: Value(title)
// === generated_end:valueWrappedFields ===
      );
}
