// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/providers/category/category_usecase_providers.dart';
import '../../domain/providers/tag/tag_usecase_providers.dart';
import '../../domain/providers/task/task_usecase_providers.dart';
import '../providers/category/category_state_providers.dart';
import '../providers/tag/tag_state_providers.dart';
import '../providers/task/task_state_providers.dart';

/// Виджет, отображающий списки всех основных сущностей (Категории, Задачи, Теги).
class DataDisplaySection extends ConsumerWidget {
  final String? selectedTaskId;
  final String? selectedTagId;

  const DataDisplaySection({
    super.key,
    this.selectedTaskId,
    this.selectedTagId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    final tasksAsync = ref.watch(tasksStreamProvider);
    final tagsAsync = ref.watch(tagsStreamProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('📊 Данные', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEntityColumn(
              ref,
              title: 'Категории',
              asyncValue: categoriesAsync,
              itemBuilder: (item) {
                final category = item;
                return ListTile(
                  title: Text(category.title),
                  dense: true,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, size: 18),
                    onPressed: () => ref.read(deleteCategoryUseCaseProvider)?.call(category.id),
                  ),
                );
              },
            ),
            _buildEntityColumn(
              ref,
              title: 'Задачи',
              asyncValue: tasksAsync,
              itemBuilder: (item) {
                final task = item;
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text('ID: ${task.id.substring(0, 8)}...', style: const TextStyle(fontSize: 10)),
                  tileColor: selectedTaskId == task.id ? Colors.blue.shade50 : null,
                  dense: true,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, size: 18),
                    onPressed: () => ref.read(deleteTaskUseCaseProvider)?.call(task.id),
                  ),
                );
              },
            ),
            _buildEntityColumn(
              ref,
              title: 'Теги',
              asyncValue: tagsAsync,
              itemBuilder: (item) {
                final tag = item;
                return ListTile(
                  title: Text(tag.title),
                  tileColor: selectedTagId == tag.id ? Colors.green.shade50 : null,
                  dense: true,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, size: 18),
                    onPressed: () => ref.read(deleteTagUseCaseProvider)?.call(tag.id),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEntityColumn<T>(
    WidgetRef ref, {
    required String title,
    required AsyncValue<List<T>> asyncValue,
    required Widget Function(T item) itemBuilder,
  }) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              asyncValue.when(
                data: (items) => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) => itemBuilder(items[index]),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => Text('Ошибка: $e'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}