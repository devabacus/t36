// manifest: entity
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/tag/tag_entity.dart';
import '../../../domain/providers/tag/tag_usecase_providers.dart';

part 'tag_state_providers.g.dart';

@riverpod
class Tags extends _$Tags {
  @override
  Future<List<TagEntity>> build() {
    return ref.read(getTagsUseCaseProvider)!();
  }

  Future<void> addTag(TagEntity tag) async {
    state = await AsyncValue.guard(() async {
      await ref.read(createTagUseCaseProvider)!(tag);
      return ref.read(getTagsUseCaseProvider)!();
    });
  }

  Future<void> updateTag(TagEntity tag) async {
    state = await AsyncValue.guard(() async {
      await ref.read(updateTagUseCaseProvider)!(tag);
      return ref.read(getTagsUseCaseProvider)!();
    });
  }

  Future<void> deleteTag(String id) async {
    state = await AsyncValue.guard(() async {
      await ref.read(deleteTagUseCaseProvider)!(id);
      return ref.read(getTagsUseCaseProvider)!();
    });
  }
}

@riverpod
Stream<List<TagEntity>> tagsStream(Ref ref) {
  final watchUseCase = ref.watch(watchTagsUseCaseProvider);

  if (watchUseCase == null) {
    return Stream.value(<TagEntity>[]);
  }

  return watchUseCase();
}
