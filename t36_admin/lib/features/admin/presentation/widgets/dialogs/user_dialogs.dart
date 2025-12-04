// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

import '../../providers/users_providers.dart';

/// Показывает диалог подтверждения для блокировки/разблокировки пользователя.
///
/// [context] - Контекст для показа `showDialog` и `ScaffoldMessenger`.
/// [ref] - `WidgetRef` для доступа к провайдерам.
/// [user] - Объект `UserInfo` пользователя, над которым выполняется действие.
/// [onSuccess] - Callback-функция, которая будет вызвана после успешного выполнения
///               действия (например, для обновления списка).
Future<void> showBlockUserDialog({
  required BuildContext context,
  required WidgetRef ref,
  required UserInfo user,
  required VoidCallback onSuccess,
}) async {
  final willBlock = !user.blocked;

  return showDialog<void>(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text(willBlock ? 'Заблокировать пользователя' : 'Разблокировать пользователя'),
        content: Text(
          willBlock
              ? 'Вы уверены, что хотите заблокировать пользователя "${user.userName}"? Он не сможет войти в систему.'
              : 'Вы уверены, что хотите разблокировать пользователя "${user.userName}"?'
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Отмена'),
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: willBlock ? Colors.orange : Colors.green,
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              // Сначала закрываем диалог
              Navigator.of(dialogContext).pop();

              try {
                // Вызываем провайдер для выполнения действия
                await ref.read(blockUserProvider(user.id!, willBlock).future);
                
                // Показываем сообщение об успехе
                if (context.mounted) {
                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Пользователь "${user.userName}" ${willBlock ? "заблокирован" : "разблокирован"}'
                      ),
                      backgroundColor: willBlock ? Colors.orange : Colors.green,
                    ),
                  );
                }
                
                // Вызываем callback для обновления списка
                onSuccess();

              } catch (e) {
                // Показываем сообщение об ошибке
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Ошибка: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: Text(willBlock ? 'Заблокировать' : 'Разблокировать'),
          ),
        ],
      );
    },
  );
}