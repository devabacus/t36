// manifest: startProject

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../user_settings/groups/groups_list.dart';
import 'setting_definition.dart';

part 'settings_registry.g.dart';

class SettingsRegistry {
  final Map<String, SettingDefinition> _definitions = {};

  // Конструктор теперь принимает готовый список групп
  SettingsRegistry(List<SettingGroup> groups) {
    for (final group in groups) {
      registerAll(group.definitions());
    }
  }
  
  void register(SettingDefinition definition) {
    if (_definitions.containsKey(definition.key)) {
      return;
    }
    _definitions[definition.key] = definition;
  }
  
  void registerAll(List<SettingDefinition> definitions) {
    for (final def in definitions) {
      register(def);
    }
  }

  SettingDefinition? find(String key) => _definitions[key];
  List<SettingDefinition> getAll() => _definitions.values.toList();
}

@Riverpod(keepAlive: true)
SettingsRegistry settingsRegistry(Ref ref) {
  // Получаем группы из провайдера, который будет переопределен приложением
  final groups = ref.watch(settingGroupsProvider);
  return SettingsRegistry(groups);
}