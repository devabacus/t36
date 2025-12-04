// manifest: startProject
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:t36_admin/core/services/logger/logger_provider.dart';
import 'package:t36_client/t36_client.dart';


import '../config/config.dart';

part 'serverpod_client_provider.g.dart';

// конфигурация серверпод пока только url, и разрешение логирования
class ServerpodConfig {
  final String serverUrl;
  final bool enableLogging;

  const ServerpodConfig({
    required this.serverUrl,
    this.enableLogging = true,
  });
}


@riverpod // провайдер серверпод конфигурации
ServerpodConfig serverpodConfig(Ref ref) {
  return ServerpodConfig(
    serverUrl: AppConfig.baseUrl,
    enableLogging: true,
  );
}

@riverpod // cоздаем serverpod клента
Client serverpodClient(Ref ref) {
  ref.keepAlive();
  final config = ref.watch(serverpodConfigProvider);
  final logger = ref.watch(loggerServiceProvider);

  
  final client = Client(
    config.serverUrl,
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  );

  if (config.enableLogging) {
    logger.info('Serverpod client создан для ${config.serverUrl}');
  }

  ref.onDispose(() {
    if (config.enableLogging) {
      logger.info('Serverpod client dispose');
    }
  });

  return client;
}

@riverpod
Future<bool> serverpodConnectionCheck(Ref ref) async {
  final client = ref.watch(serverpodClientProvider);
  final logger = ref.watch(loggerServiceProvider);
  
  try {
    // тупо запрашиваем инфо пользователя для проверки подключения
    await client.modules.auth.status.getUserInfo();
    return true;
  } catch (e) {
    logger.error('Ошибка подключения к серверу: $e');
    return false;
  }
}

enum ConnectionStatus {
  unknown,
  connected,
  disconnected,
}

extension ConnectionStatusExtension on ConnectionStatus {
  bool get isConnected => this == ConnectionStatus.connected;
  bool get isDisconnected => this == ConnectionStatus.disconnected;
  bool get isUnknown => this == ConnectionStatus.unknown;

  String get displayName {
    switch (this) {
      case ConnectionStatus.connected:
        return 'Подключен';
      case ConnectionStatus.disconnected:
        return 'Отключен';
      case ConnectionStatus.unknown:
        return 'Неизвестно';
    }
  }

  String get colorName {
    switch (this) {
      case ConnectionStatus.connected:
        return 'green';
      case ConnectionStatus.disconnected:
        return 'red';
      case ConnectionStatus.unknown:
        return 'grey';
    }
  }
}
