// manifest: startProject
import 'package:t36/features/configuration/domain/entities/configuration/configuration_entity.dart';
import 'package:t36/features/configuration/presentation/models/setting_view_model.dart';

// Функция-маппер, которая преобразует сырые данные в ViewModel
typedef SettingViewModelMapper = SettingViewModel? Function(
  SettingDefinition definition,
  ConfigurationEntity? config,
  Map<String, ConfigurationEntity> allConfigs,
);

/// Абстрактный базовый класс для всех "чертежей" настроек.
abstract class SettingDefinition {
  final String key;
  final String group;
  final String displayName;
  final String defaultValue;

  SettingDefinition({
    required this.key,
    required this.group,
    required this.displayName,
    required this.defaultValue,
  });

  /// Главный метод, который создает ViewModel.
  /// Логика его реализации будет уникальной для каждого типа настройки.
  SettingViewModel? buildViewModel(
    ConfigurationEntity? config,
    Map<String, ConfigurationEntity> allConfigs,
  );
}

