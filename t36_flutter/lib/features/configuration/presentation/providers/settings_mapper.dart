// manifest: startProject
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t36/features/configuration/domain/entities/configuration/configuration_entity.dart';
import 'package:t36/features/configuration/presentation/user_settings/groups/groups_list.dart';
import 'package:t36/features/configuration/presentation/registry/settings_registry.dart';
import '../models/setting_view_model.dart';
import '../models/settings_screen_model.dart';

part 'settings_mapper.g.dart';

/// Класс, отвечающий за преобразование "сырых" данных о конфигурации
/// в готовые модели представления (ViewModel) для UI.
/// Он использует [SettingsRegistry] для получения определений настроек
/// и [SettingGroup] для получения информации о группах.
class SettingsMapper {
  final SettingsRegistry _registry;
  final List<SettingGroup> _groups;

  SettingsMapper(this._registry, this._groups);

  /// Главный метод-фабрика для создания модели экрана.
  /// Принимает список всех конфигураций и необязательный ключ группы.
  /// Если [groupKey] не указан, создает корневой экран со списком групп.
  /// Если [groupKey] указан, создает экран с настройками для этой группы.
  SettingsScreenModel mapToScreen(List<ConfigurationEntity> configs, {String? groupKey}) {
    if (groupKey == null) {
      return _mapToRootScreen();
    } else {
      return _mapToGroupScreen(configs, groupKey);
    }
  }

  /// Создает модель для корневого экрана настроек (список групп).
  SettingsScreenModel _mapToRootScreen() {
    // Создаем ViewModel для каждой группы из централизованного списка
    final groupViewModels = _groups.map((group) {
      return SettingViewModel.group(
        key: group.key,
        displayName: group.displayName,
        group: 'root',
      );
    }).toList();
    
    return SettingsScreenModel(
      title: 'Настройки',
      sections: [
        SettingsSectionModel(title: 'Категории', settings: groupViewModels),
      ],
    );
  }

  /// Создает модель для экрана конкретной группы настроек.
  SettingsScreenModel _mapToGroupScreen(List<ConfigurationEntity> configs, String groupKey) {
    final configMap = {for (var c in configs) c.key: c};
    final definitionsInGroup = _registry.getAll().where((def) => def.group == groupKey);
    
    final viewModels = definitionsInGroup
        .map((definition) {
          final config = configMap[definition.key];
          // Делегируем создание ViewModel самому "чертежу" настройки
          return definition.buildViewModel(config, configMap);
        })
        .whereType<SettingViewModel>() // Отфильтровываем null (если buildViewModel вернул null)
        .toList();
    
    return SettingsScreenModel(
      title: _getGroupDisplayName(groupKey),
      sections: [
        SettingsSectionModel(title: 'Параметры', settings: viewModels),
      ],
    );
  }
  
  /// Вспомогательный метод для получения человеко-читаемых названий групп
  /// из централизованного списка.
  String _getGroupDisplayName(String groupKey) {
    try {
      // Ищем группу в списке по ключу и возвращаем ее displayName
      return _groups.firstWhere((g) => g.key == groupKey).displayName;
    } catch (e) {
      // Если по какой-то причине группа не найдена, возвращаем сам ключ,
      // чтобы избежать падения приложения.
      return groupKey;
    }
  }
}

/// Провайдер Riverpod для доступа к экземпляру SettingsMapper.
/// Он автоматически получает зависимости (реестр настроек и список групп)
/// от других провайдеров.
@riverpod
SettingsMapper settingsMapper(Ref ref) {
  final registry = ref.watch(settingsRegistryProvider);
  final groups = ref.watch(settingGroupsProvider);
  return SettingsMapper(registry, groups);
}