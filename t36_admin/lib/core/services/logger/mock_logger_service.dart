// manifest: startProject
// Mock реализация для тестов
import 'package:flutter/material.dart';

import 'logger_service.dart';

class MockLoggerService implements LoggerService {
  final List<String> logs = [];

  @override
  void debug(dynamic msg) => logs.add('DEBUG: $msg');

  @override
  void error(dynamic msg, [Object? exception, StackTrace? stackTrace]) {
    logs.add('ERROR: $msg ${exception ?? ''}');
  }

  @override
  void info(dynamic msg) => logs.add('INFO: $msg');

  @override
  void warning(dynamic msg) => logs.add('WARNING: $msg');

  @override
  void critical(dynamic msg, [Object? exception, StackTrace? stackTrace]) {
    logs.add('CRITICAL: $msg ${exception ?? ''}');
  }

  @override
  void showLogs(BuildContext context) {
    // Ничего не делаем в тестах
  }
}
