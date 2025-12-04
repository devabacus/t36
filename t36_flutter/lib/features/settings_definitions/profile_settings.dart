// manifest: startProject
import '../configuration/presentation/registry/definitions.dart';

List<SettingDefinition> getProfileSettings() {
  return [
    StringSettingDefinition(
      key: 'username',
      group: 'Profile',
      displayName: 'Имя пользователя',
      defaultValue: 'Пользователь',
    ),
    StringSettingDefinition(
      key: 'nickname',
      group: 'Profile',
      displayName: 'Никнейм',
      defaultValue: 'PlayerOne',
    ),

    StringSettingDefinition(
      key: 'nickname2',
      group: 'Profile',
      displayName: 'Никнейм2',
      defaultValue: 'PlayerOne2',
    ),
  ];
}