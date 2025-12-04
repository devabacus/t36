// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/providers/session_manager_provider.dart';
import '../../../auth/presentation/providers/auth_state_providers.dart';
import '../../domain/entities/category/category_entity.dart';
import '../../domain/entities/tag/tag_entity.dart';
import '../../domain/entities/task/task_entity.dart';
import '../providers/category/category_state_providers.dart';
import '../providers/tag/tag_state_providers.dart';
import '../providers/task/task_state_providers.dart';

/// Виджет, содержащий UI для создания новых Категорий, Задач и Тегов.
class CreationSection extends ConsumerStatefulWidget {
  final String? selectedCategoryId;
  final ValueChanged<String?> onCategoryChanged;

  const CreationSection({
    super.key,
    required this.selectedCategoryId,
    required this.onCategoryChanged,
  });

  @override
  ConsumerState<CreationSection> createState() => _CreationSectionState();
}

class _CreationSectionState extends ConsumerState<CreationSection> {
  late final TextEditingController _categoryController;
  late final TextEditingController _taskController;
  late final TextEditingController _tagController;

  @override
  void initState() {
    super.initState();
    _categoryController = TextEditingController();
    _taskController = TextEditingController();
    _tagController = TextEditingController();
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _taskController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  Future<void> _createCategory() async {
    if (_categoryController.text.trim().isEmpty) return;
    final currentUser = ref.watch(authStateChangesProvider).value;

    final customerId = ref.read(currentCustomerIdProvider);
    if (currentUser?.id == null || customerId == null) return;

    final newCategory = CategoryEntity(
      id: const Uuid().v7(),
      userId: currentUser!.id!,
      customerId: customerId,
      createdAt: DateTime.now(),
      lastModified: DateTime.now(),
      title: _categoryController.text.trim(),
    );

    await ref.read(categoriesProvider.notifier).addCategory(newCategory);

    _categoryController.clear();
  }

  Future<void> _createTask() async {
    if (_taskController.text.trim().isEmpty) return;
    final currentUser = ref.watch(authStateChangesProvider).value;

    final customerId = ref.read(currentCustomerIdProvider);
    if (currentUser?.id == null || customerId == null) return;

    final newTask = TaskEntity(
      id: const Uuid().v7(),
      userId: currentUser!.id!,
      customerId: customerId,
      createdAt: DateTime.now(),
      lastModified: DateTime.now(),
      title: _taskController.text.trim(),
      categoryId: widget.selectedCategoryId,
    );
    await ref.read(tasksProvider.notifier).addTask(newTask);

    _taskController.clear();
  }

  Future<void> _createTag() async {
    if (_tagController.text.trim().isEmpty) return;
    final currentUser = ref.watch(authStateChangesProvider).value;

    final customerId = ref.read(currentCustomerIdProvider);
    if (currentUser?.id == null || customerId == null) return;

    final newTag = TagEntity(
      id: const Uuid().v7(),
      userId: currentUser!.id!,
      customerId: customerId,
      createdAt: DateTime.now(),
      lastModified: DateTime.now(),
      title: _tagController.text.trim(),
    );
    await ref.read(tagsProvider.notifier).addTag(newTag);
    _tagController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🔧 Создание данных',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _categoryController,
                    decoration: const InputDecoration(
                      labelText: 'Название категории',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _createCategory,
                  child: const Text('+ Категория'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelText: 'Название задачи',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(flex: 1, child: _buildCategorySelector()),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _createTask,
                  child: const Text('+ Задача'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _tagController,
                    decoration: const InputDecoration(
                      labelText: 'Название тега',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _createTag,
                  child: const Text('+ Тег'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySelector() {
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    return categoriesAsync.when(
      data:
          (categories) => DropdownButtonFormField<String>(
            value: widget.selectedCategoryId,
            decoration: const InputDecoration(
              labelText: 'Категория',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              labelStyle: TextStyle(fontSize: 12),
            ),
            isExpanded: true,
            items: [
              const DropdownMenuItem(value: null, child: Text('Без категории')),
              ...categories.map(
                (category) => DropdownMenuItem(
                  value: category.id,
                  child: Text(category.title, overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
            onChanged: widget.onCategoryChanged,
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Text('Ошибка: $e'),
    );
  }
}
