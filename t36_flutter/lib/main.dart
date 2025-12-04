// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:t36/features/configuration/domain/providers/configuration/configuration_dependencies_provider.dart';
import 'package:t36/features/configuration/presentation/user_settings/groups/groups_list.dart';
import 'package:t36/core/dependencies/configuration_dependencies_impl.dart';
import 'package:t36/features/settings_definitions/app_groups_list.dart';

import './app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Временный контейнер для чтения провайдера до запуска приложения
  final container = ProviderContainer();
  final appGroups = container.read(appSettingGroupsProvider);
  // Уничтожаем временный контейнер
  container.dispose();

  runApp(
    ProviderScope(
      overrides: [
        // 1. Внедряем реализацию зависимостей (БД, Serverpod)
        configurationDependenciesProvider.overrideWith(
          (ref) => ConfigurationDependenciesImpl(ref),
        ),
        // 2. Внедряем конкретный список групп настроек
        settingGroupsProvider.overrideWithValue(appGroups),
      ],
      child: App(),
    ),
  );
}