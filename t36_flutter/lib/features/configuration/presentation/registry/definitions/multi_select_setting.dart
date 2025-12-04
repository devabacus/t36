// manifest: startProject
import '../../../domain/entities/configuration/configuration_entity.dart';
import '../../models/setting_view_model.dart';
import '../setting_definition.dart';

/// "Чертёж" для настройки с выбором нескольких значений.
class MultiSelectSettingDefinition extends SettingDefinition {
  final String optionsKey; // Ключ, где хранятся все возможные варианты
  final List<String> defaultOptions;

  MultiSelectSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required super.defaultValue, // Значения по умолчанию через ";"
    required this.optionsKey,
    this.defaultOptions = const [],
  });

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    final optionsConfig = allConfigs[optionsKey];
    final currentValue = config?.value ?? defaultValue;

    return MultiSelectSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      // Преобразуем строку "a;b;c" в список
      currentValues: currentValue.isEmpty ? {} : currentValue.split(';').toSet(),
      // Получаем все возможные варианты
      options: optionsConfig?.value.split(';') ?? defaultOptions,
    );
  }
}