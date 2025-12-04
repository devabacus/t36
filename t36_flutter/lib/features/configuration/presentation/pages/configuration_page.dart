// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/providers/session_manager_provider.dart';
import '../../../auth/presentation/providers/auth_state_providers.dart';
import '../../domain/entities/configuration/configuration_entity.dart';
import '../../domain/providers/configuration/configuration_usecase_providers.dart';
import '../providers/configuration/configuration_state_providers.dart';
import '../providers/settings_mapper.dart';
import '../registry/settings_registry.dart';
import '../widgets/settings_screen_widget.dart';

/// Страница-контейнер для отображения настроек.
class ConfigurationPage extends ConsumerWidget {
  final String? groupKey;

  const ConfigurationPage({super.key, this.groupKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configurationsAsync = ref.watch(configurationsStreamProvider);
    final mapper = ref.watch(settingsMapperProvider);

    return configurationsAsync.when(
      data: (configs) {
        final screenModel = mapper.mapToScreen(configs, groupKey: groupKey);

        onSettingChanged(String key, dynamic value) {
          final updateUseCase = ref.read(updateConfigurationUseCaseProvider);
          final createUseCase = ref.read(createConfigurationUseCaseProvider);
          final registry = ref.read(settingsRegistryProvider);
          
          // Ищем существующую конфигурацию (безопасно, без ошибок)
          final configToUpdate = configs.where((c) => c.key == key).firstOrNull;

          if (configToUpdate != null) {
            // --- СЦЕНАРИЙ 1: НАСТРОЙКА СУЩЕСТВУЕТ -> ОБНОВЛЯЕМ ---
            updateUseCase?.call(configToUpdate.copyWith(value: value.toString()));
          } else {
            // --- СЦЕНАРИЙ 2: НАСТРОЙКИ НЕТ -> СОЗДАЕМ ---
            final definition = registry.find(key);
            final currentUser = ref.watch(authStateChangesProvider).value;

            final customerId = ref.read(currentCustomerIdProvider);

            if (createUseCase != null && definition != null && currentUser != null && customerId != null) {
              final newConfig = ConfigurationEntity(
                id: const Uuid().v7(),
                userId: currentUser.id!,
                customerId: customerId,
                createdAt: DateTime.now(),
                lastModified: DateTime.now(),
                key: definition.key,
                group: definition.group,
                value: value.toString(), // Используем новое значение
              );
              createUseCase(newConfig);
            }
          }
        }
        // --- КОНЕЦ ИЗМЕНЕНИЙ ---

        onGroupSelected(String key) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ConfigurationPage(groupKey: key),
            ),
          );
        }

        return SettingsScreenWidget(
          screenModel: screenModel,
          onSettingChanged: onSettingChanged,
          onGroupSelected: onGroupSelected,
        );
      },
      loading: () => Scaffold(
        appBar: AppBar(title: Text(groupKey ?? 'Настройки')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (e, s) => Scaffold(
        appBar: AppBar(title: const Text('Ошибка')),
        body: Center(child: Text('Ошибка загрузки настроек: $e')),
      ),
    );
  }
}