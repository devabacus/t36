// manifest: entity

// === generated_start:base ===
import 'package:drift/drift.dart';
import '../../../../../../../core/data/datasources/local/database.dart';
import '../../../../../../../core/data/datasources/local/interfaces/i_database_service.dart';
import '../../tables/tag_table.dart';

part 'tag_dao.g.dart';

@DriftAccessor(tables: [TagTable])
class TagDao extends DatabaseAccessor<AppDatabase>
    with _$TagDaoMixin {
  TagDao(IDatabaseService databaseService)
    : super(databaseService.database);

  AppDatabase get db => attachedDatabase;

  Future<List<TagTableData>> getTags({
    required int userId,
    required String customerId,
  }) =>
      (select(tagTable)
            ..where((t) => t.isDeleted.equals(false))
            ..where(
              (t) => t.userId.equals(userId) & t.customerId.equals(customerId),
            ))
          .get();

  Stream<List<TagTableData>> watchTags({
    required int userId,
    required String customerId,
  }) =>
      (select(tagTable)
            ..where((t) => t.isDeleted.equals(false))
            ..where(
              (t) => t.userId.equals(userId) & t.customerId.equals(customerId),
            ))
          .watch();

  Future<TagTableData?> getTagById(
    String id, {
    required int userId,
    required String customerId,
  }) =>
      (select(tagTable)..where(
            (t) =>
                t.id.equals(id) &
                t.userId.equals(userId) &
                t.customerId.equals(customerId),
          ))
          .getSingleOrNull();

  Future<List<TagTableData>> getTagsByIds(
    List<String> ids, {
    required int userId,
    required String customerId,
  }) {
    if (ids.isEmpty) {
      return Future.value([]);
    }
    return (select(tagTable)..where(
          (t) =>
              t.id.isIn(ids) &
              t.userId.equals(userId) &
              t.customerId.equals(customerId) &
              t.isDeleted.equals(false),
        ))
        .get();
  }

  Future<String> createTag(TagTableCompanion companion) async {
    final id = companion.id.value;
    try {
      final existingTag =
          await (select(tagTable)..where(
                (t) =>
                    t.id.equals(id) &
                    t.userId.equals(companion.userId.value) &
                    t.customerId.equals(companion.customerId.value),
              ))
              .getSingleOrNull();

      if (existingTag != null) {
        throw StateError('tag with ID $id exists');
      }

      await into(tagTable).insert(companion);
      return id;
    } catch (e) {
      print('fail of creating tag: $e');
      rethrow;
    }
  }

  Future<bool> updateTagById(
    String id,
    TagTableCompanion companion, {
    required int userId,
    required String customerId,
  }) async {
    // final idToUpdate = companion.id.value;
    final updatedRows =
        await (update(tagTable)..where(
              (t) =>
                  t.id.equals(id) &
                  t.userId.equals(userId) &
                  t.customerId.equals(customerId),
            ))
            .write(companion);
    return updatedRows > 0;
  }

  Future<int> physicallyDeleteTag(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    return (delete(tagTable)..where(
          (t) =>
              t.id.equals(id) &
              t.userId.equals(userId) &
              t.customerId.equals(customerId),
        ))
        .go();
  }

  Future<bool> tagExists(
    String id, {
    required int userId,
    required String customerId,
  }) async {
    if (id.isEmpty) return false;

    final tag =
        await (select(tagTable)..where(
              (t) =>
                  t.id.equals(id) &
                  t.userId.equals(userId) &
                  t.customerId.equals(customerId),
            ))
            .getSingleOrNull();

    return tag != null;
  }

  Future<int> getTagsCount({
    required int userId,
    required String customerId,
  }) async {
    final countQuery = selectOnly(tagTable)
      ..addColumns([tagTable.id.count()])
      ..where(
        tagTable.userId.equals(userId) &
            tagTable.customerId.equals(customerId),
      );

    final result = await countQuery.getSingle();
    return result.read(tagTable.id.count()) ?? 0;
  }

  Future<void> insertTags(List<TagTableCompanion> companions) async {
    await batch((batch) {
      batch.insertAll(tagTable, companions);
    });
  }

  Future<int> deleteAllTags({
    required int userId,
    required String customerId,
  }) {
    return (delete(tagTable)..where(
          (t) => t.userId.equals(userId) & t.customerId.equals(customerId),
        ))
        .go();
  }

  // === generated_end:base ===
}
