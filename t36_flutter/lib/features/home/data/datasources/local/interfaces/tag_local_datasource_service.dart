// manifest: entity
import 'package:t36/core/data/datasources/local/database.dart';

import '../../../models/tag/tag_model.dart';
import '../../../../../../core/data/datasources/local/database_types.dart';

abstract class ITagLocalDataSource {
  Future<List<TagModel>> getTags({required int userId, required String customerId});
  Stream<List<TagModel>> watchTags({required int userId, required String customerId});
  Future<TagModel?> getTagById(String id, {required int userId, required String customerId});
  Future<List<TagModel>> getTagsByIds(List<String> ids, {required int userId, required String customerId});
  Future<String> createTag(TagModel tag);
  Future<bool> updateTag(TagModel tag);
  Future<bool> deleteTag(String id, {required int userId, required String customerId});
  Future<List<TagTableData>> getAllLocalChanges({required int userId, required String customerId});
  Future<List<TagTableData>> reconcileServerChanges(List<dynamic> serverChanges, {required int userId, required String customerId});
  Future<void> physicallyDeleteTag(String id, {required int userId, required String customerId});
  Future<void> insertOrUpdateFromServer(dynamic serverChange, SyncStatus status);
  Future<void> handleSyncEvent(dynamic event, {required int userId, required String customerId});
}

