// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../admin/presentation/pages/admin_page.dart';
import '../providers/auth_state_providers.dart';
import '../widgets/blocked_user_screen.dart';
import 'login_page.dart';

class AuthWrapperPage extends ConsumerWidget {
  const AuthWrapperPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          // Проверяем, не заблокирован ли пользователь
          if (user.blocked) {
            return BlockedUserScreen.admin(
              onSignOut: () async {
                // Здесь нужно добавить логику выхода из системы
                // в зависимости от вашего провайдера аутентификации
                ref.invalidate(authStateChangesProvider);
              },
            );
          }
          return const AdminPage();
        } else {
          return const LoginPage();          
        }
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Ошибка аутентификации: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(authStateChangesProvider),
                child: const Text('Попробовать снова'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}