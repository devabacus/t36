// manifest: startProject

import 'package:uuid/uuid.dart';

import '../../domain/entities/configuration/configuration_entity.dart';
import '../../domain/repositories/configuration_repository.dart';
import '../../domain/services/i_configuration_service.dart';
import '../../presentation/registry/settings_registry.dart';
import 'package:collection/collection.dart';

/// Конкретная реализация сервиса конфигурации.
class ConfigurationServiceImpl implements IConfigurationService {
  final IConfigurationRepository _repository;
  final SettingsRegistry _registry;

  ConfigurationServiceImpl({
    required IConfigurationRepository repository,
    required SettingsRegistry registry,
  }) : _repository = repository,
       _registry = registry;

  @override
  Future<T> getValue<T>(String key, T defaultValue) async {
    final definition = _registry.find(key);
    if (definition == null) return defaultValue;

    final config = await _repository.getConfigurationByGroupAndKey(
      definition.group,
      key,
    );
    return _parseValue(config?.value, defaultValue);
  }

  @override
  Stream<T> watchValue<T>(String key, T defaultValue) {
    return _repository.watchConfigurations().map((configs) {
      final config = configs.firstWhereOrNull((c) => c.key == key);

      return _parseValue(config?.value, defaultValue);
    });
  }

  @override
  Future<void> setValue<T>(String key, T value) async {
    final definition = _registry.find(key);
    if (definition == null) {
      print(
        '⚠️ Попытка обновить настройку "$key", которая не зарегистрирована в реестре.',
      );
      return;
    }

    final existingConfig = await _repository.getConfigurationByGroupAndKey(
      definition.group,
      key,
    );

    if (existingConfig != null) {
      // Обновляем существующую
      final updatedConfig = existingConfig.copyWith(
        value: value.toString(),
        lastModified: DateTime.now().toUtc(),
      );
      await _repository.updateConfiguration(updatedConfig);
    } else {
      // Создаем новую
      // Примечание: для этого методу нужны userId и customerId.
      // В идеальной архитектуре их нужно передавать в метод `setValue`
      // или получать из репозитория, если он имеет к ним доступ.
      // В данном примере мы предполагаем, что репозиторий уже создан для конкретного пользователя.
      final newConfig = ConfigurationEntity(
        id: const Uuid().v7(),
        // Эти значения должны быть корректно установлены!
        // Репозиторий должен быть создан для конкретного пользователя,
        // и он подставит правильные значения при создании.
        userId: 0, // Placeholder
        customerId: '', // Placeholder
        createdAt: DateTime.now().toUtc(),
        lastModified: DateTime.now().toUtc(),
        group: definition.group,
        key: definition.key,
        value: value.toString(),
      );
      await _repository.createConfiguration(newConfig);
    }
  }

  /// Внутренний хелпер для безопасного парсинга строковых значений из базы данных
  /// в нужный тип.
  T _parseValue<T>(String? storedValue, T defaultValue) {
    if (storedValue == null) {
      return defaultValue;
    }

    try {
      if (T == bool) {
        return (storedValue.toLowerCase() == 'true') as T;
      }
      if (T == int) {
        return (int.tryParse(storedValue) ?? defaultValue) as T;
      }
      if (T == double) {
        return (double.tryParse(storedValue) ?? defaultValue) as T;
      }
      if (T == String) {
        return storedValue as T;
      }
      // Для Set<String> (используется в MultiSelect)
      if (defaultValue is Set<String>) {
        return (storedValue.isEmpty
                ? <String>{}
                : storedValue.split(';').toSet())
            as T;
      }
    } catch (e) {
      print('❌ Ошибка парсинга значения "$storedValue" в тип $T: $e');
      return defaultValue;
    }

    return defaultValue;
  }
}
