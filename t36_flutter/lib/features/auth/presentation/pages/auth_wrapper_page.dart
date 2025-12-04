// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../home/presentation/pages/home_page.dart';
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
          return const HomePage();   
        } else {
          return const LoginPage();
        }
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(
          child: Text('Ошибка аутентификации: $error'),
        ),
      ),
    );
  }
}