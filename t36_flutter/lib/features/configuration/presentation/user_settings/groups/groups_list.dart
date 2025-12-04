// manifest: startProject

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../registry/setting_definition.dart';

part 'groups_list.g.dart';

// Этот класс-модель остается в модуле, так как он определяет структуру.
class SettingGroup {
  final String key;
  final String displayName;
  final List<SettingDefinition> Function() definitions;

  const SettingGroup({
    required this.key,
    required this.displayName,
    required this.definitions,
  });
}

// Провайдер-заглушка. Он будет переопределен основным приложением.
@riverpod
List<SettingGroup> settingGroups(Ref ref) {
  throw UnimplementedError(
    'The settingGroupsProvider must be overridden in the ProviderScope '
    'to provide the application-specific list of setting groups.'
  );
}