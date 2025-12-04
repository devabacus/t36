// manifest: startProject

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/configuration/configuration_entity.dart';
import '../../../domain/providers/configuration/configuration_usecase_providers.dart';

part 'configuration_state_providers.g.dart';

@riverpod
Stream<List<ConfigurationEntity>> configurationsStream(Ref ref) {
  final watchUseCase = ref.watch(watchConfigurationsUseCaseProvider);
  
  if (watchUseCase == null) {
    return Stream.value(<ConfigurationEntity>[]);
  }
  
  return watchUseCase();
}