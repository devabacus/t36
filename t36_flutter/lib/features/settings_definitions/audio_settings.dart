// manifest: startProject
import '../configuration/presentation/registry/definitions.dart';

/// Возвращает список всех определений настроек для группы "Audio".
List<SettingDefinition> getAudioSettings() {
  return [
    SliderSettingDefinition(
      key: 'effectVolume',
      group: 'Audio',
      displayName: 'Громкость эффектов',
      defaultValue: 75.0,
      min: 0.0,
      max: 100.0,
      divisions: 100, // 100 шагов для плавности
    ),
    BooleanSettingDefinition(
      key: 'soundEnabled',
      group: 'Audio',
      displayName: 'Включить звук',
      defaultValue: true,
    ),
  ];
}