// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlockedUserScreen extends ConsumerWidget {
  final String title;
  final String message;
  final IconData icon;
  final VoidCallback onSignOut;
  
  const BlockedUserScreen({
    super.key,
    this.title = 'Аккаунт заблокирован',
    this.message = 'Ваш аккаунт был заблокирован администратором.\nДля получения информации о разблокировке обратитесь к администратору.',
    this.icon = Icons.block,
    required this.onSignOut,
  });

  // Конструктор для обычного приложения
  const BlockedUserScreen.app({
    super.key,
    required this.onSignOut,
  }) : title = 'Аккаунт заблокирован',
       message = 'Доступ к системе ограничен администратором.\nДля получения информации о разблокировке обратитесь к администратору.',
       icon = Icons.block;

  // Конструктор для админ панели
  const BlockedUserScreen.admin({
    super.key,
    required this.onSignOut,
  }) : title = 'Доступ к административной панели заблокирован',
       message = 'Ваш аккаунт был заблокирован администратором.\nДля получения доступа обратитесь к системному администратору.',
       icon = Icons.admin_panel_settings_outlined;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: onSignOut,
            tooltip: 'Выйти',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 100,
                color: Colors.red,
              ),
              const SizedBox(height: 32),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: onSignOut,
                icon: const Icon(Icons.logout),
                label: const Text('Выйти из системы'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}