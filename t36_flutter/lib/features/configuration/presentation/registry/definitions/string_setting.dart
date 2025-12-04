// manifest: startProject

import '../../../domain/entities/configuration/configuration_entity.dart';
import '../../models/setting_view_model.dart';
import '../setting_definition.dart';


class StringSettingDefinition extends SettingDefinition {
  StringSettingDefinition({
    required super.key,
    required super.group,
    required super.displayName,
    required super.defaultValue,
  });

  @override
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  ) {
    return StringSettingViewModel(
      key: key,
      displayName: displayName,
      group: group,
      value: config?.value ?? defaultValue,
    );
  }
}