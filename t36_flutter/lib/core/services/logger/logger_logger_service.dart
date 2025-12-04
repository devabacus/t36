// manifest: startProject
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'logger_service.dart';

class LoggerLoggerService implements LoggerService {
  final Logger logger;

  LoggerLoggerService(this.logger);

  @override
  void debug(dynamic msg) => logger.d(msg);

  @override
  void error(dynamic msg, [Object? exception, StackTrace? stackTrace]) {
    logger.e(msg, error: exception, stackTrace: stackTrace);
  }

  @override
  void info(dynamic msg) => logger.i(msg);

  @override
  void warning(dynamic msg) => logger.w(msg);

  @override
  void critical(dynamic msg, [Object? exception, StackTrace? stackTrace]) {
    logger.f(msg, error: exception, stackTrace: stackTrace);
  }

  @override
  void showLogs(BuildContext context) {
    // Пакет 'logger' не имеет встроенного UI для отображения логов,
    // в отличие от 'talker_flutter'.
    // Эту функцию нужно реализовывать самостоятельно, если она необходима.
    debugPrint('UI для логов не реализован для LoggerLoggerService');
  }
}
