// manifest: startProject
import 'package:flutter/material.dart';
import 'package:logging/logging.dart' as logging;

import 'logger_service.dart';

/// Реализация LoggerService на основе стандартного пакета `logging`.
class LoggingLoggerService implements LoggerService {
  final logging.Logger _logger;
  static bool _isListenerInitialized = false;

  LoggingLoggerService(String name) : _logger = logging.Logger(name) {
    // Настраиваем слушатель для вывода логов в консоль.
    // Эта настройка выполняется один раз для всего приложения.
    if (!_isListenerInitialized) {
      logging.Logger.root.level = logging.Level.ALL;
      logging.Logger.root.onRecord.listen((record) {
        // Простой формат вывода, можно настроить по желанию.
        final icon = _getIconForLevel(record.level);
        debugPrint(
          '$icon ${record.level.name}: ${record.time.toIso8601String().split('T').last.substring(0, 12)}: ${record.loggerName}: ${record.message}',
        );
        if (record.error != null) {
          debugPrint('  Error: ${record.error}');
        }
        if (record.stackTrace != null) {
          debugPrint('  StackTrace: ${record.stackTrace}');
        }
      });
      _isListenerInitialized = true;
    }
  }

  /// Возвращает иконку для соответствующего уровня лога.
  String _getIconForLevel(logging.Level level) {
    switch (level.name) {
      case 'SHOUT':
        return '🔥';
      case 'SEVERE':
        return '❌';
      case 'WARNING':
        return '⚠️';
      case 'INFO':
        return 'ℹ️';
      case 'FINE':
        return '🐛';
      default:
        return '🤔';
    }
  }

  @override
  void debug(dynamic msg) => _logger.fine(msg);

  @override
  void info(dynamic msg) => _logger.info(msg);

  @override
  void warning(dynamic msg) => _logger.warning(msg);

  @override
  void error(dynamic msg, [Object? exception, StackTrace? stackTrace]) =>
      _logger.severe(msg, exception, stackTrace);

  @override
  void critical(dynamic msg, [Object? exception, StackTrace? stackTrace]) =>
      _logger.shout(msg, exception, stackTrace);

  @override
  void showLogs(BuildContext context) {
    debugPrint('UI для логов не реализован для LoggingLoggerService');
  }
}
