// manifest: startProject

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t36/features/configuration/presentation/user_settings/groups/groups_list.dart';

import 'audio_settings.dart';
import 'profile_settings.dart';
import 'ui_settings.dart';

/// Конкретный провайдер для вашего приложения, который собирает все группы настроек.
final appSettingGroupsProvider = Provider<List<SettingGroup>>((ref) {
  return [
    SettingGroup(key: 'UI', displayName: 'Интерфейс', definitions: getUiSettings),
    SettingGroup(key: 'Profile', displayName: 'Профиль', definitions: getProfileSettings),
    SettingGroup(key: 'Audio', displayName: 'Аудио', definitions: getAudioSettings),
  ];
});