// manifest: entity
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../usecases/tag_usecases.dart';
import '../../../data/providers/tag/tag_data_providers.dart';

part 'tag_usecase_providers.g.dart';

@riverpod
GetTagsUseCase? getTagsUseCase(Ref ref) {
  final repository = ref.watch(currentUserTagRepositoryProvider);
  if (repository == null) {
    // пользователь не авторизован
    return null;
  }
  return GetTagsUseCase(repository);
}   

@riverpod
WatchTagsUseCase? watchTagsUseCase(Ref ref) {
  final repository = ref.watch(currentUserTagRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return WatchTagsUseCase(repository);
}

@riverpod
CreateTagUseCase? createTagUseCase(Ref ref) {
  final repository = ref.watch(currentUserTagRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return CreateTagUseCase(repository);
}

@riverpod
DeleteTagUseCase? deleteTagUseCase(Ref ref) {
  final repository = ref.watch(currentUserTagRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return DeleteTagUseCase(repository);
}

@riverpod
UpdateTagUseCase? updateTagUseCase(Ref ref) {
  final repository = ref.watch(currentUserTagRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return UpdateTagUseCase(repository);
}

@riverpod
GetTagByIdUseCase? getTagByIdUseCase(Ref ref) {
  final repository = ref.watch(currentUserTagRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return GetTagByIdUseCase(repository);
}
  
    