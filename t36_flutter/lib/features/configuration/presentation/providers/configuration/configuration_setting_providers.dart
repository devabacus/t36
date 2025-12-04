// manifest: startProject
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/configuration/configuration_entity.dart';
import '../../../domain/providers/configuration/configuration_usecase_providers.dart';

part 'configuration_setting_providers.g.dart';

@riverpod
Future<ConfigurationEntity?> themeModeSetting(Ref ref) {
    final useCase = ref.watch(getConfigurationByGroupAndKeyUseCaseProvider);
    if (useCase == null) return Future.value(null);
    return useCase('UI', 'themeMode');
}