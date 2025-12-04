// manifest: startProject
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter/material.dart';

import 'logger_service.dart';

class TalkerLoggerService implements LoggerService {
  final Talker talker;

  TalkerLoggerService(this.talker);

  @override
  void debug(dynamic msg) => talker.debug(msg);

  @override
  void error(dynamic msg, [Object? exception, StackTrace? stackTrace]) {
    talker.error(msg, exception, stackTrace);
  }

  @override
  void info(dynamic msg) => talker.info(msg);

  @override
  void warning(dynamic msg) => talker.warning(msg);

  @override
  void critical(dynamic msg, [Object? exception, StackTrace? stackTrace]) {
    talker.critical(msg, exception, stackTrace);
  }

  @override
  void showLogs(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TalkerScreen(talker: talker)),
    );
  }
}