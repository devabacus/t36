// manifest: entity
import '../repositories/tag_repository.dart';
import '../entities/tag/tag_entity.dart';

class CreateTagUseCase {
  final ITagRepository _repository;
  
  CreateTagUseCase(this._repository);
  
  Future<String> call(TagEntity tag) {
    return _repository.createTag(tag);
  }
}

class UpdateTagUseCase {
  final ITagRepository _repository;

  UpdateTagUseCase(this._repository);

  Future<bool> call(TagEntity tag) async {
    return _repository.updateTag(tag);
  }
}

class DeleteTagUseCase {
  final ITagRepository _repository;

  DeleteTagUseCase(this._repository);

  Future<bool> call(String id) async {
    return _repository.deleteTag(id);
  }
}

class GetTagsUseCase {
  final ITagRepository _repository;

  GetTagsUseCase(this._repository);

  Future<List<TagEntity>> call() {
    return _repository.getTags();
  }
}

class GetTagByIdUseCase {
  final ITagRepository _repository;

  GetTagByIdUseCase(this._repository);

  Future<TagEntity?> call(String id) {
    return _repository.getTagById(id);
  }
}

class WatchTagsUseCase {
  final ITagRepository _repository;

  WatchTagsUseCase(this._repository);

  Stream<List<TagEntity>> call() {
    return _repository.watchTags();
  }
}
