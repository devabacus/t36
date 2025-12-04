// manifest: startProject
import '../../../domain/entities/configuration/configuration_entity.dart';
import '../../models/setting_view_model.dart';
import '../setting_definition.dart';

class BooleanSettingDefinition extends SettingDefinition {
  BooleanSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required bool defaultValue,
  }) : super(defaultValue: defaultValue.toString());

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    final value = config?.value ?? defaultValue;
    return BooleanSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      value: value == 'true',
    );
  }
}