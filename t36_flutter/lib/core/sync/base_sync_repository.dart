// manifest: startProject
import 'dart:async';
import 'dart:math';

import '../data/datasources/local/interfaces/sync_metadata_local_datasource_service.dart';
import '../services/logger/logger_service.dart';
import 'sync_registry.dart';

abstract class BaseSyncRepository implements ISyncableRepository {
  final int userId;
  final String customerId;
  final bool syncEnabled;
  final ISyncMetadataLocalDataSource syncMetadataDataSource;
  final LoggerService logger;

  StreamSubscription? _eventStreamSubscription;
  bool _isSyncing = false;
  bool _isDisposed = false;
  int reconnectionAttempt = 0;
  int delaySeconds = 0;

  BaseSyncRepository(
    this.userId,
    this.customerId, {
    required this.syncMetadataDataSource,
    required this.logger,
    this.syncEnabled = true,
  });

  String get entityType;
  @override
  String get entityTypeName;
  Future<List<dynamic>> getChangesFromServer(DateTime? since);
  Future<List<dynamic>> reconcileChanges(List<dynamic> serverChanges);
  Future<void> pushLocalChanges(List<dynamic> localChangesToPush);
  Stream<dynamic> watchEvents();
  Future<void> handleSyncEvent(dynamic event);

  Future<DateTime?> getLastSyncTimestamp() =>
      syncMetadataDataSource.getLastSyncTimestamp(entityType, userId: userId);

  Future<void> updateLastSyncTimestamp() =>
      syncMetadataDataSource.updateLastSyncTimestamp(
        entityType,
        DateTime.now().toUtc(),
        userId: userId,
      );

  @override
  Future<void> syncWithServer() async {
    if (!syncEnabled) return;

    if (_isSyncing) {
      logger.info(
        'ℹ️ Синхронизация $entityTypeName уже выполняется для пользователя $userId. Пропуск.',
      );
      return;
    }
    _isSyncing = true;
    logger.info(
      '🔄 Запуск синхронизации $entityTypeName для пользователя $userId...',
    );

    try {
      final lastSync = await getLastSyncTimestamp();

      logger.debug(
        '  [1/3] Получение изменений $entityTypeName с сервера с момента: $lastSync',
      );
      final serverChanges = await getChangesFromServer(lastSync);
      logger.debug(
        '    -> Получено ${serverChanges.length} изменений с сервера.',
      );

      logger.debug('  [2/3] Слияние данных и разрешение конфликтов...');
      final localChangesToPush = await reconcileChanges(serverChanges);
      logger.debug(
        '    -> ${localChangesToPush.length} локальных изменений готовы к отправке.',
      );

      if (localChangesToPush.isNotEmpty) {
        logger.debug('  [3/3] Отправка локальных изменений на сервер...');
        await pushLocalChanges(localChangesToPush);
      } else {
        logger.debug('  [3/3] Нет локальных изменений для отправки.');
      }

      await updateLastSyncTimestamp();
      logger.info(
        '✅ Синхронизация $entityTypeName успешно завершена для пользователя $userId',
      );
    } catch (e, st) {
      logger.error(
        '❌ Ошибка синхронизации $entityTypeName для пользователя $userId',
        e,
        st,
      );
      rethrow;
    } finally {
      _isSyncing = false;
    }
  }

  @override
  void initEventBasedSync() {
    if (_isDisposed) return;
    logger.info(
      '🌊 $entityTypeName: _initEventBasedSync для userId: $userId. Попытка #${reconnectionAttempt + 1}',
    );
    _eventStreamSubscription?.cancel();
    _subscribeToEvents();
  }

  void _subscribeToEvents() {
    if (_isDisposed) return;
    logger.debug(
      '🎧 $entityTypeName: Выполняется подписка на события для userId: $userId (попытка: $reconnectionAttempt)',
    );
    _eventStreamSubscription = watchEvents().listen(
      (event) {
        logger.debug(
          '⚡️ $entityTypeName: Получено событие с сервера (для userId: $userId)',
        );
        if (reconnectionAttempt > 0) {
          logger.info(
            '👍 Соединение с real-time сервером для $entityTypeName восстановлено!',
          );
          reconnectionAttempt = 0;
          delaySeconds = 0;
        }
        handleSyncEvent(event);
      },
      onError: (error, stackTrace) {
        logger.error(
          '❌ $entityTypeName: Ошибка стрима событий для userId: $userId. Планируем переподключение...',
          error,
          stackTrace,
        );
        _scheduleReconnection();
      },
      onDone: () {
        logger.warning(
          '🔌 $entityTypeName: Стрим событий был закрыт (onDone) для userId: $userId. Планируем переподключение...',
        );
        _scheduleReconnection();
      },
      cancelOnError: true,
    );
  }

  void _scheduleReconnection() {
    if (_isDisposed) return;
    _eventStreamSubscription?.cancel();

    delaySeconds = min(pow(2, reconnectionAttempt).toInt(), 60);
    logger.info(
      '⏱️ $entityTypeName: Следующая попытка подключения через $delaySeconds секунд.',
    );

    Future.delayed(Duration(seconds: delaySeconds), () {
      reconnectionAttempt++;
      initEventBasedSync();
    });
  }

  @override
  void dispose() {
    logger.info(
      '🛑 $entityTypeName: Уничтожается экземпляр для userId: $userId.',
    );
    _isDisposed = true;
    _eventStreamSubscription?.cancel();
  }
}
