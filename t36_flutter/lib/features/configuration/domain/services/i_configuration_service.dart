// manifest: startProject

/// Абстрактный интерфейс для сервиса конфигурации.
/// Определяет контракт для доступа к настройкам приложения.
abstract class IConfigurationService {
  /// Асинхронно получает текущее значение настройки по ключу.
  ///
  /// Возвращает [defaultValue], если настройка не найдена или произошла ошибка парсинга.
  Future<T> getValue<T>(String key, T defaultValue);

  /// Возвращает [Stream], который эмитит новые значения при изменении настройки.
  ///
  /// Начинает с текущего значения или [defaultValue].
  Stream<T> watchValue<T>(String key, T defaultValue);

  /// Устанавливает или обновляет значение настройки по ключу.
  Future<void> setValue<T>(String key, T value);
}

