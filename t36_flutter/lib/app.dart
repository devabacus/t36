// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/routing/router_config.dart'; // <-- Импортируем провайдер роутера
import 'core/sync/sync_controller_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Инициализируем контроллер синхронизации
    ref.watch(syncControllerProvider);
    
    // Получаем конфигурацию роутера из провайдера
    final router = ref.watch(appRouterProvider);

    // Используем MaterialApp.router
    return MaterialApp.router(
      title: 'Шалон проект',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Указываем GoRouter как обработчик всех маршрутов в приложении
      routerConfig: router,
    );
  }
}