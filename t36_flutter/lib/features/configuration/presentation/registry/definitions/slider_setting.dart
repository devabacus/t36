// manifest: startProject

import '../../../domain/entities/configuration/configuration_entity.dart';
import '../../models/setting_view_model.dart';
import '../setting_definition.dart';

class SliderSettingDefinition extends SettingDefinition {
  final double min;
  final double max;
  final int? divisions; // Количество шагов на слайдере

  SliderSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required double defaultValue,
    this.min = 0.0,
    this.max = 100.0,
    this.divisions,
  }) : super(defaultValue: defaultValue.toString());

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    final value = double.tryParse(config?.value ?? defaultValue);
    if (value == null) return null; // Валидация

    return SliderSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      value: value,
      min: min,
      max: max,
      divisions: divisions,
    );
  }
}