// manifest: manyToMany
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_tag_map_entity.freezed.dart';
part 'task_tag_map_entity.g.dart';

@freezed
abstract class TaskTagMapEntity with _$TaskTagMapEntity {
  const factory TaskTagMapEntity({
    required String id,
    required int userId,
    required String customerId,
    required DateTime createdAt,
    required DateTime lastModified,
    @Default(false) bool isDeleted,
    required String taskId,
    required String tagId,
  }) = _TaskTagMapEntity;

  factory TaskTagMapEntity.fromJson(Map<String, dynamic> json) => _$TaskTagMapEntityFromJson(json);
}
