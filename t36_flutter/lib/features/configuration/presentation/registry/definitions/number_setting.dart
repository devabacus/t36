// manifest: startProject
import '../../../domain/entities/configuration/configuration_entity.dart';
import '../../models/setting_view_model.dart';
import '../setting_definition.dart';

class NumberSettingDefinition extends SettingDefinition {
  NumberSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required num defaultValue,
  }) : super(defaultValue: defaultValue.toString());

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    final value = num.tryParse(config?.value ?? defaultValue);
    if (value == null) return null; // Валидация

    return NumberSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      value: value,
    );
  }
}