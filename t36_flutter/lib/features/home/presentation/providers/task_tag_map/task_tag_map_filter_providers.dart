// manifest: manyToMany
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/tag/tag_entity.dart';
import '../tag/tag_state_providers.dart';
import './task_tag_map_state_providers.dart';

part 'task_tag_map_filter_providers.g.dart';

@riverpod
Future<List<TagEntity>> unassignedTagsForTaskProvider(Ref ref, {required String taskId}) async {
  final allTargets = await ref.watch(tagsProvider.future);
  
  final assignedTargets = await ref.watch(relatedTagsForTaskProvider(taskId).future);
  
  final assignedIds = assignedTargets.map((e) => e.id).toSet();
  
  return allTargets.where((target) => !assignedIds.contains(target.id)).toList();
}

