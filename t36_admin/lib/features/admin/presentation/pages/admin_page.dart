// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Добавляем необходимые импорты
import '../../../auth/domain/providers/auth_usecase_providers.dart';
import '../../../auth/presentation/providers/auth_state_providers.dart';
import '../widgets/dashboard/dashboard_widgets.dart';

class AdminPage extends ConsumerWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. Получаем состояние аутентификации
    final authState = ref.watch(authStateChangesProvider);
    final userInfo = authState.value;

    // 3. Проверяем, является ли пользователь суперадмином.
    // На сервере ID суперадмина жестко задан как 1.
    final bool isSuperAdmin = userInfo?.id == 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Панель управления'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Выход',
            onPressed: () async {
              await ref.read(signOutUseCaseProvider)();
            },
          ),
        ],
      ),
      // 4. Отображаем нужный виджет в зависимости от статуса пользователя
      body:
          isSuperAdmin
              ? const DashboardView() // Полный дашборд для суперадмина
              : const LimitedDashboardView(), // Ограниченный вид для остальных
    );
  }
}
