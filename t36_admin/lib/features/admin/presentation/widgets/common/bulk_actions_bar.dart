// manifest: startProject

import 'package:flutter/material.dart';

class BulkActionsBar extends StatelessWidget {
  final int selectedCount;
  final Color themeColor;
  final List<Widget> additionalActions;
  final VoidCallback? onDelete; // Может быть null, если нет прав
  final VoidCallback onCancel;
  final bool canDelete; // Новый параметр для проверки прав

  const BulkActionsBar({
    super.key,
    required this.selectedCount,
    required this.themeColor,
    required this.additionalActions,
    required this.onDelete,
    required this.onCancel,
    this.canDelete = true, // По умолчанию true для обратной совместимости
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: themeColor.withOpacity(0.1),
      child: Row(
        children: [
          Text(
            'Выбрано: $selectedCount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: themeColor,
            ),
          ),
          const Spacer(),
          ...additionalActions,
          // ИСПРАВЛЕНИЕ: Показываем кнопку удаления только если есть права
          if (canDelete && onDelete != null)
            TextButton.icon(
              onPressed: onDelete,
              icon: const Icon(Icons.delete, color: Colors.red),
              label: const Text(
                'Удалить выбранные',
                style: TextStyle(color: Colors.red),
              ),
            ),
          TextButton(
            onPressed: onCancel,
            child: const Text('Отменить'),
          ),
        ],
      ),
    );
  }
}