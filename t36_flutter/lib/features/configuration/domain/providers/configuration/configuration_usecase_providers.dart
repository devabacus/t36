// manifest: startProject
// === generated_start:base ===
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../usecases/configuration_usecases.dart';
import '../../../data/providers/configuration/configuration_data_providers.dart';

part 'configuration_usecase_providers.g.dart';

@riverpod
GetConfigurationsUseCase? getConfigurationsUseCase(Ref ref) {
  final repository = ref.watch(currentUserConfigurationRepositoryProvider);
  if (repository == null) {
    // пользователь не авторизован
    return null;
  }
  return GetConfigurationsUseCase(repository);
}   

@riverpod
WatchConfigurationsUseCase? watchConfigurationsUseCase(Ref ref) {
  final repository = ref.watch(currentUserConfigurationRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return WatchConfigurationsUseCase(repository);
}

@riverpod
CreateConfigurationUseCase? createConfigurationUseCase(Ref ref) {
  final repository = ref.watch(currentUserConfigurationRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return CreateConfigurationUseCase(repository);
}

@riverpod
DeleteConfigurationUseCase? deleteConfigurationUseCase(Ref ref) {
  final repository = ref.watch(currentUserConfigurationRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return DeleteConfigurationUseCase(repository);
}

@riverpod
UpdateConfigurationUseCase? updateConfigurationUseCase(Ref ref) {
  final repository = ref.watch(currentUserConfigurationRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return UpdateConfigurationUseCase(repository);
}

@riverpod
GetConfigurationByIdUseCase? getConfigurationByIdUseCase(Ref ref) {
  final repository = ref.watch(currentUserConfigurationRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return GetConfigurationByIdUseCase(repository);
}

  // === generated_end:base ===
@riverpod
GetConfigurationByGroupAndKeyUseCase? getConfigurationByGroupAndKeyUseCase(Ref ref) {
  final repository = ref.watch(currentUserConfigurationRepositoryProvider);
  if (repository == null) {
    return null;
  }
  return GetConfigurationByGroupAndKeyUseCase(repository);
}  
    