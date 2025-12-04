// manifest: startProject
import 'package:logger/logger.dart' as logger_lib;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'logger_service.dart';
import 'talker_logger_service.dart';
import 'logger_logger_service.dart';
import 'logging_logger_service.dart';

part 'logger_provider.g.dart';

/// Провайдер для экземпляра Talker.
/// Он нужен, чтобы TalkerScreen мог получить к нему доступ.
@riverpod
Talker talker(Ref ref) {
  ref.keepAlive();

  // 1. Создаем кастомный логгер с настройками для консоли Talker
  final logger = TalkerLogger(
    settings: TalkerLoggerSettings(
      // Убираем разделительную линию между логами
      lineSymbol: '',
    ),
  );

  // 2. Инициализируем Talker с нашим кастомным логгером
  return TalkerFlutter.init(logger: logger);
}

/// Провайдер для нашего абстрактного сервиса логирования.
@riverpod
LoggerService loggerService(Ref ref) {
  // Используем переменную из .env файла для выбора реализации логгера.
  // В .env файле можно указать LOGGER=talker, LOGGER=logger или LOGGER=logging
  final loggerType = dotenv.env['LOGGER']?.toLowerCase() ?? 'talker';

  ref.keepAlive();

  if (loggerType == 'logger') {
    // Используем реализацию на базе пакета 'logger'
    final logger = logger_lib.Logger(
      printer: logger_lib.PrettyPrinter(methodCount: 1, lineLength: 100),
    );
    return LoggerLoggerService(logger);
  } else if (loggerType == 'logging') {
    // Используем реализацию на базе пакета 'logging'
    return LoggingLoggerService('App');
  } else {
    // Используем реализацию на базе 'talker' по умолчанию
    final talkerInstance = ref.watch(talkerProvider);
    return TalkerLoggerService(talkerInstance);
  }
}
