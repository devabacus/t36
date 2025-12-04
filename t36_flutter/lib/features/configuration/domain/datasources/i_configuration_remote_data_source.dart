// manifest: startProject

import '../entities/configuration/configuration_entity.dart';

/// Абстрактный контракт, который должен реализовать внешний мир (основное приложение),
/// чтобы предоставить модулю `configuration` возможность получать и отправлять данные.
///
/// Этот интерфейс работает только с чистыми сущностями (`ConfigurationEntity`),
/// а не с моделями из Serverpod или любой другой технологии.
abstract class IConfigurationRemoteDataSource {
  /// Получить изменения с сервера с определенного момента времени.
  Future<List<ConfigurationEntity>> getConfigurationsSince(DateTime? since);

  /// Отправить созданную сущность на сервер и вернуть ее синхронизированную версию.
  Future<ConfigurationEntity> createConfiguration(ConfigurationEntity configuration);

  /// Отправить обновленную сущность на сервер.
  Future<void> updateConfiguration(ConfigurationEntity configuration);

  /// Подписаться на real-time события с сервера.
  /// Модуль не знает, что это за `dynamic event`, но он передаст его дальше
  /// в `handleSyncEvent` репозитория. Приложение-обертка будет знать реальный тип.
  Stream<dynamic> watchEvents();
}