// manifest: entity
import 'package:t36_client/t36_client.dart';

abstract class ITagRemoteDataSource {
  Stream<TagSyncEvent> watchEvents();
  Future<List<Tag>> getTags();
  Future<List<Tag>> getTagsSince(DateTime? since); 
  Future<List<Tag>> syncTags(List<Tag> localTags);
  Future<Tag?> getTagById(UuidValue id);
  Future<Tag> createTag(Tag tag);
  Future<bool> updateTag(Tag tag);
  Future<bool> checkConnection();
}

