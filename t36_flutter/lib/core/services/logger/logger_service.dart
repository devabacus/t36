// manifest: startProject
import 'package:flutter/material.dart';

abstract class LoggerService {
  void info(dynamic msg);
  void warning(dynamic msg);
  void debug(dynamic msg);
  void error(dynamic msg, [Object? exception, StackTrace? stackTrace]);
  void critical(dynamic msg, [Object? exception, StackTrace? stackTrace]);
  void showLogs(BuildContext context);
}



