// manifest: startProject
// === generated_start:base ===
import '../repositories/configuration_repository.dart';
import '../entities/configuration/configuration_entity.dart';

class CreateConfigurationUseCase {
  final IConfigurationRepository _repository;
  
  CreateConfigurationUseCase(this._repository);
  
  Future<String> call(ConfigurationEntity configuration) {
    return _repository.createConfiguration(configuration);
  }
}

class UpdateConfigurationUseCase {
  final IConfigurationRepository _repository;

  UpdateConfigurationUseCase(this._repository);

  Future<bool> call(ConfigurationEntity configuration) async {
    return _repository.updateConfiguration(configuration);
  }
}

class DeleteConfigurationUseCase {
  final IConfigurationRepository _repository;

  DeleteConfigurationUseCase(this._repository);

  Future<bool> call(String id) async {
    return _repository.deleteConfiguration(id);
  }
}

class GetConfigurationsUseCase {
  final IConfigurationRepository _repository;

  GetConfigurationsUseCase(this._repository);

  Future<List<ConfigurationEntity>> call() {
    return _repository.getConfigurations();
  }
}

class GetConfigurationByIdUseCase {
  final IConfigurationRepository _repository;

  GetConfigurationByIdUseCase(this._repository);

  Future<ConfigurationEntity?> call(String id) {
    return _repository.getConfigurationById(id);
  }
}

class WatchConfigurationsUseCase {
  final IConfigurationRepository _repository;

  WatchConfigurationsUseCase(this._repository);

  Stream<List<ConfigurationEntity>> call() {
    return _repository.watchConfigurations();
  }
}

// === generated_end:base ===
class GetConfigurationByGroupAndKeyUseCase {
  final IConfigurationRepository _repository;

  GetConfigurationByGroupAndKeyUseCase(this._repository);

  Future<ConfigurationEntity?> call(String group, String key) {
    return _repository.getConfigurationByGroupAndKey(group, key);
  }
}

