// manifest: startProject
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/logger/logger_provider.dart';
import '../services/logger/logger_service.dart';

part 'sync_registry.g.dart';

/// Абстракция для любого репозитория, который может быть синхронизирован.
/// Любой репозиторий, реализующий этот интерфейс, может быть добавлен в SyncRegistry.
abstract class ISyncableRepository {
  /// Запускает полный цикл синхронизации (pull, reconcile, push).
  Future<void> syncWithServer();

  /// Инициализирует подписку на real-time события с сервера.
  void initEventBasedSync();

  /// Освобождает ресурсы (например, отписывается от стримов).
  void dispose();

  /// Возвращает имя сущности для логирования.
  String get entityTypeName;
}

/// Центральный реестр для управления всеми синхронизируемыми репозиториями.
class SyncRegistry {
  final LoggerService _logger;
  final Map<String, ISyncableRepository> _repositories = {};

  SyncRegistry(this._logger);

  /// Регистрирует новый репозиторий в реестре.
  void registerRepository(String key, ISyncableRepository repository) {
    _logger.info('Реестр: Зарегистрирован репозиторий с ключом "$key"');
    _repositories[key] = repository;
  }

  /// Удаляет репозиторий из реестра.
  /// Обычно вызывается при уничтожении провайдера репозитория.
  void unregisterRepository(String key) {
    _logger.info('Реестр: Регистрация для ключа "$key" снята');
    _repositories.remove(key);
  }

  /// Запускает синхронизацию для всех зарегистрированных репозиториев.
  Future<void> syncAll() async {
    _logger.info(
      'Реестр: Запуск синхронизации для всех ${_repositories.length} репозиториев...',
    );
    for (final repository in _repositories.values) {
      try {
        await repository.syncWithServer();
      } catch (e, stackTrace) {
        _logger.error(
          'Реестр: Ошибка синхронизации для "${repository.entityTypeName}"',
          e,
          stackTrace,
        );
      }
    }
  }

  /// Возвращает список всех зарегистрированных репозиториев.
  List<ISyncableRepository> get repositories => _repositories.values.toList();
}

/// Провайдер для единственного экземпляра реестра на все приложение.
@Riverpod(keepAlive: true)
SyncRegistry syncRegistry(Ref ref) {
  // Получаем сервис логгера и передаем его в конструктор
  final logger = ref.watch(loggerServiceProvider);
  return SyncRegistry(logger);
}
