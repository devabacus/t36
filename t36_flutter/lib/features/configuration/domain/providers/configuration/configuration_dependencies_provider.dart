// manifest: startProject

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../dependencies/configuration_dependencies.dart';

part 'configuration_dependencies_provider.g.dart';

/// Провайдер-"заглушка". Он должен быть переопределен (overridden)
/// в ProviderScope основного приложения для внедрения реальных зависимостей.
@riverpod
IConfigurationDependencies configurationDependencies(Ref ref) {
  throw UnimplementedError(
    'The configurationDependenciesProvider must be overridden in the ProviderScope'
  );
}