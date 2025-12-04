// manifest: startProject
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logger_provider.dart';

/// Расширение для Riverpod's `Ref`, добавляющее удобные методы для логирования.
///
/// Позволяет вызывать логгер напрямую из `ref`, например: `ref.logInfo('Сообщение')`.
extension LoggerRefExtensions on Ref {
  /// Вызов информационного лога.
  void logInfo(String msg) => read(loggerServiceProvider).info(msg);

  /// Вызов лога с предупреждением.
  void logWarning(String msg) => read(loggerServiceProvider).warning(msg);

  /// Вызов лога с ошибкой.
  void logError(String msg, [Object? e, StackTrace? st]) =>
      read(loggerServiceProvider).error(msg, e, st);

  /// Вызов отладочного лога.
  void logDebug(String msg) => read(loggerServiceProvider).debug(msg);
}
