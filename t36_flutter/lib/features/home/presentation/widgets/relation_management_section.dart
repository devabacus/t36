// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/providers/task_tag_map/task_tag_map_usecase_providers.dart';
import '../providers/tag/tag_state_providers.dart';
import '../providers/task/task_state_providers.dart';
import '../providers/task_tag_map/task_tag_map_state_providers.dart';

/// Виджет для управления связями "многие-ко-многим" между Задачами и Тегами.
class RelationManagementSection extends ConsumerWidget {
  final String? selectedTaskId;
  final String? selectedTagId;
  final ValueChanged<String?> onTaskChanged;
  final ValueChanged<String?> onTagChanged;

  const RelationManagementSection({
    super.key,
    required this.selectedTaskId,
    required this.selectedTagId,
    required this.onTaskChanged,
    required this.onTagChanged,
  });

  Future<void> _addTagToTask(WidgetRef ref) async {
    if (selectedTaskId == null || selectedTagId == null) return;
    final notifier = ref.read(relatedTagsForTaskProvider(selectedTaskId!).notifier);
    await notifier.addTag(tagId: selectedTagId!);
  }

  Future<void> _removeTagFromTask(WidgetRef ref) async {
    if (selectedTaskId == null || selectedTagId == null) return;
    final notifier = ref.read(relatedTagsForTaskProvider(selectedTaskId!).notifier);
    await notifier.removeTag(tagId: selectedTagId!);
  }
  
  Future<void> _removeAllTagsFromTask(WidgetRef ref) async {
    if (selectedTaskId == null) return;
    final useCase = ref.read(removeAllTagsFromTaskUseCaseProvider);
    if (useCase == null) return;
    await useCase(selectedTaskId!);
    ref.invalidate(relatedTagsForTaskProvider(selectedTaskId!));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('🔗 Управление связями Task ↔ Tag', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildTaskSelector(ref)),
                const SizedBox(width: 8),
                Expanded(child: _buildTagSelector(ref)),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: (selectedTaskId != null && selectedTagId != null) ? () => _addTagToTask(ref) : null,
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Связать'),
                ),
                ElevatedButton.icon(
                  onPressed: (selectedTaskId != null && selectedTagId != null) ? () => _removeTagFromTask(ref) : null,
                  icon: const Icon(Icons.remove, size: 16),
                  label: const Text('Разорвать'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
                ),
                 ElevatedButton.icon(
                  onPressed: selectedTaskId != null ? () => _removeAllTagsFromTask(ref) : null,
                  icon: const Icon(Icons.clear_all, size: 16),
                  label: const Text('Очистить'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[100]),
                ),
              ],
            ),
            if (selectedTaskId != null) ...[
              const SizedBox(height: 16),
              const Text('Теги выбранной задачи:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildRelatedTagsDisplay(ref, selectedTaskId!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTaskSelector(WidgetRef ref) {
    final tasksAsync = ref.watch(tasksStreamProvider);
    return tasksAsync.when(
      data: (tasks) => DropdownButtonFormField<String>(
        value: selectedTaskId,
        decoration: const InputDecoration(labelText: 'Задача', border: OutlineInputBorder()),
        items: tasks.map((task) => DropdownMenuItem(value: task.id, child: Text(task.title, overflow: TextOverflow.ellipsis))).toList(),
        onChanged: onTaskChanged,
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Text('Ошибка: $e'),
    );
  }

  Widget _buildTagSelector(WidgetRef ref) {
    final tagsAsync = ref.watch(tagsStreamProvider);
    return tagsAsync.when(
      data: (tags) => DropdownButtonFormField<String>(
        value: selectedTagId,
        decoration: const InputDecoration(labelText: 'Тег', border: OutlineInputBorder()),
        items: tags.map((tag) => DropdownMenuItem(value: tag.id, child: Text(tag.title, overflow: TextOverflow.ellipsis))).toList(),
        onChanged: onTagChanged,
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Text('Ошибка: $e'),
    );
  }
   Widget _buildRelatedTagsDisplay(WidgetRef ref, String taskId) {
    final relatedTagsAsync = ref.watch(relatedTagsForTaskProvider(taskId));
    return relatedTagsAsync.when(
      data: (tags) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(8)),
        child: tags.isEmpty
            ? const Text('Нет связанных тегов')
            : Wrap(
                spacing: 8,
                children: tags.map((tag) => Chip(
                          label: Text(tag.title),
                          backgroundColor: Colors.blue[100],
                          onDeleted: () {
                            final notifier = ref.read(relatedTagsForTaskProvider(taskId).notifier);
                            notifier.removeTag(tagId: tag.id);
                          },
                        )).toList(),
              ),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (e, s) => Text('Ошибка связей: $e'),
    );
  }
}