// manifest: startProject
import '../../../domain/entities/configuration/configuration_entity.dart';
import '../../models/setting_view_model.dart';
import '../setting_definition.dart';

/// "Чертёж" для настройки с выбором из списка.
class OptionsSettingDefinition extends SettingDefinition {
  final String optionsKey; // Ключ, по которому хранятся сами опции
  final List<String> defaultOptions;

  OptionsSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required super.defaultValue,
    required this.optionsKey,
    this.defaultOptions = const [],
  });

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    final optionsConfig = allConfigs[optionsKey];
    return OptionsSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      currentValue: config?.value ?? defaultValue,
      options: optionsConfig?.value.split(';') ?? defaultOptions,
    );
  }
}