// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t36/features/configuration/domain/providers/configuration/app_settings_providers.dart';
import 'package:t36/features/configuration/domain/providers/configuration/configuration_service_provider.dart';

/// Виджет для демонстрации доступа к глобальным настройкам приложения.
class SettingsDisplaySection extends ConsumerWidget {
  const SettingsDisplaySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Используем новые типизированные провайдеры
    final themeModeAsync = ref.watch(themeModeProvider);
    final animationsAsync = ref.watch(enableAnimationsProvider);
    final itemsPerPageAsync = ref.watch(itemsPerPageProvider);

    return Card(
      color: Colors.deepPurple.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '⚙️ Тест доступа к настройкам',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 16),
            
            // Отображение темы
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Тема приложения:', style: TextStyle(fontWeight: FontWeight.bold)),
                themeModeAsync.when(
                  data: (theme) => Text(theme, style: const TextStyle(fontFamily: 'monospace')),
                  loading: () => const SizedBox(width: 20, height: 20, child: CircularProgressIndicator()),
                  error: (e, s) => const Icon(Icons.error, color: Colors.red),
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(onPressed: () => ref.read(configurationServiceProvider).setValue('themeMode', 'light'), child: const Text('Light')),
                ElevatedButton(onPressed: () => ref.read(configurationServiceProvider).setValue('themeMode', 'dark'), child: const Text('Dark')),
                ElevatedButton(onPressed: () => ref.read(configurationServiceProvider).setValue('themeMode', 'system'), child: const Text('System')),
              ],
            ),
            const Divider(height: 24),

            // Отображение анимаций
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Анимации:', style: TextStyle(fontWeight: FontWeight.bold)),
                animationsAsync.when(
                  data: (enabled) => Switch(
                    value: enabled, 
                    onChanged: (newValue) => ref.read(configurationServiceProvider).setValue('enableAnimations', newValue),
                  ),
                  loading: () => const SizedBox(width: 20, height: 20, child: CircularProgressIndicator()),
                  error: (e, s) => const Icon(Icons.error, color: Colors.red),
                ),
              ],
            ),
            const Divider(height: 24),
            
            // Отображение элементов на странице
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Элементов на странице:', style: TextStyle(fontWeight: FontWeight.bold)),
                 itemsPerPageAsync.when(
                  data: (count) => Text('$count', style: const TextStyle(fontFamily: 'monospace', fontSize: 16)),
                  loading: () => const SizedBox(width: 20, height: 20, child: CircularProgressIndicator()),
                  error: (e, s) => const Icon(Icons.error, color: Colors.red),
                ),
              ],
            ),
             Wrap(
              spacing: 8,
              children: [
                ElevatedButton(onPressed: () => ref.read(configurationServiceProvider).setValue('itemsPerPage', 10), child: const Text('10')),
                ElevatedButton(onPressed: () => ref.read(configurationServiceProvider).setValue('itemsPerPage', 20), child: const Text('20')),
                ElevatedButton(onPressed: () => ref.read(configurationServiceProvider).setValue('itemsPerPage', 50), child: const Text('50')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}