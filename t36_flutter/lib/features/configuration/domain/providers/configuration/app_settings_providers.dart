// manifest: startProject
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'configuration_service_provider.dart';

part 'app_settings_providers.g.dart';

/// Следит за изменением темы приложения.
/// Возвращает 'system', 'light' или 'dark'.
@riverpod
Stream<String> themeMode(Ref ref) {
  // Защищаемся от случая, когда сервис недоступен (пользователь не вошел)
  try {
    return ref.watch(configurationServiceProvider).watchValue<String>('themeMode', 'system');
  } catch (e) {
    return Stream.value('system'); // Возвращаем дефолтное значение
  }
}

/// Следит за настройкой анимаций.
@riverpod
Stream<bool> enableAnimations(Ref ref) {
  try {
    return ref.watch(configurationServiceProvider).watchValue<bool>('enableAnimations', true);
  } catch (e) {
    return Stream.value(true);
  }
}

/// Следит за настройкой количества элементов на странице.
@riverpod
Stream<int> itemsPerPage(Ref ref) {
  try {
    return ref.watch(configurationServiceProvider).watchValue<int>('itemsPerPage', 20);
  } catch (e) {
    return Stream.value(20);
  }
}

/// Следит за настройкой громкости эффектов.
@riverpod
Stream<double> effectVolume(Ref ref) {
  try {
    return ref.watch(configurationServiceProvider).watchValue<double>('effectVolume', 75.0);
  } catch (e) {
    return Stream.value(75.0);
  }
}