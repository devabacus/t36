// manifest: startProject
import '../configuration/presentation/registry/definitions.dart';

/// Возвращает список всех определений настроек для группы "UI".
List<SettingDefinition> getUiSettings() {
  return [
    // Настройка темы
    OptionsSettingDefinition(
      key: 'themeMode',
      group: 'UI',
      displayName: 'Тема приложения',
      defaultValue: 'system',
      optionsKey: 'themeOptions', // Указываем, где искать опции
      defaultOptions: ['system', 'light', 'dark'],
    ),

    MultiSelectSettingDefinition(
      key: 'notificationTypes',
      group: 'UI',
      displayName: 'Типы уведомлений',
      defaultValue: 'news;updates', // Выбраны 2 из 3 по умолчанию
      optionsKey: 'notificationTypesOptions',
      defaultOptions: ['news', 'updates', 'promotions'],
    ),
    
    // Настройка анимаций
    BooleanSettingDefinition(
      key: 'enableAnimations',
      group: 'UI',
      displayName: 'Включить анимации',
      defaultValue: true,
    ),

    BooleanSettingDefinition(
      key: 'newBooleanSettings',
      group: 'UI',
      displayName: 'Новая булева настройка',
      defaultValue: false,
    ),

     NumberSettingDefinition(
      key: 'itemsPerPage',
      group: 'UI',
      displayName: 'Элементов на странице',
      defaultValue: 20,
    ),
  ];
}