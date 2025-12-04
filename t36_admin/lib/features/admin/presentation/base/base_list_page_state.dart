// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/permission/permission_service.dart';
import '../widgets/common/list_toolbar.dart';
import '../widgets/common/bulk_actions_bar.dart';
import '../widgets/common/empty_state.dart';
import '../widgets/common/error_widget.dart';
import '../widgets/tables/base_data_table.dart';

abstract class BaseListPageStateCore<T, W extends ConsumerStatefulWidget>
    extends ConsumerState<W> {
  // Поиск и фильтрация
  String searchQuery = '';
  final TextEditingController searchController = TextEditingController();

  // Состояние сортировки
  int? sortColumnIndex;
  bool sortAscending = true;

  // Выбор элементов
  final Set<T> selectedItems = {};
  bool isSelectAll = false;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // Абстрактные методы для реализации в наследниках
  String? get permissionKeyToRead;
  String? get permissionKeyToCreate;
  String? get permissionKeyToUpdate;
  String? get permissionKeyToDelete;

  String get pageTitle;
  String get entityNameSingular;
  String get entityNamePlural;
  IconData get entityIcon;
  Color get themeColor => Colors.blue;

  ProviderListenable<AsyncValue<List<T>>> get listProvider;

  // Переопределяем canDelete и canEdit, чтобы они проверяли права
  bool canDelete(T item) =>
      permissionKeyToDelete == null ||
      ref.hasPermission(permissionKeyToDelete!);
  bool canEdit(T item) =>
      permissionKeyToUpdate == null ||
      ref.hasPermission(permissionKeyToUpdate!);

  List<DataColumn> getColumns();
  DataRow buildDataRow(T item);
  String getItemId(T item);
  String getItemDisplayName(T item);

  /// Возвращает значение для сравнения при сортировке.
  /// Должен быть реализован в каждой конкретной странице.
  Comparable<dynamic> getComparableValue(T item, int columnIndex);

  void navigateToCreate();
  void navigateToEdit(T item);
  Future<void> deleteItem(T item);

  List<Widget> getAdditionalActions(T item) => [];
  List<Widget> getAdditionalBulkActions() => [];

  /// Обрабатывает клик по заголовку столбца для сортировки.
  void onSort(int columnIndex, bool ascending) {
    setState(() {
      sortColumnIndex = columnIndex;
      sortAscending = ascending;
    });
  }

  bool matchesSearchQuery(T item) {
    if (searchQuery.isEmpty) return true;
    return getItemDisplayName(
      item,
    ).toLowerCase().contains(searchQuery.toLowerCase());
  }

  void refreshList() {
    ref.invalidate(listProvider as dynamic);
  }

  void onSearchChanged(String value) {
    setState(() {
      searchQuery = value;
    });
  }

  void selectAll(List<T> items) {
    setState(() {
      isSelectAll = true;
      selectedItems.addAll(items);
    });
  }

  void clearSelection() {
    setState(() {
      selectedItems.clear();
      isSelectAll = false;
    });
  }

  void toggleItemSelection(T item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
        isSelectAll = false;
      } else {
        selectedItems.add(item);
      }
    });
  }

  // Построение UI компонентов
  Widget buildToolbar() {
    return ListToolbar(
      searchController: searchController,
      entityNamePlural: entityNamePlural,
      onSearchChanged: onSearchChanged,
    );
  }

  Widget buildBulkActionsBar() {
    // ИСПРАВЛЕНИЕ: Проверяем права на удаление перед показом панели массовых действий
    final canBulkDelete =
        permissionKeyToDelete == null ||
        ref.hasPermission(permissionKeyToDelete!);

    return BulkActionsBar(
      selectedCount: selectedItems.length,
      themeColor: themeColor,
      additionalActions: getAdditionalBulkActions(),
      onDelete:
          canBulkDelete
              ? () => deleteSelectedItems()
              : null, // null отключает кнопку
      onCancel: clearSelection,
      canDelete: canBulkDelete, // Передаем информацию о правах
    );
  }

  Widget buildDataContent(List<T> items) {
    final filteredItems = items.where(matchesSearchQuery).toList();

    // Применяем сортировку к отфильтрованным данным
    if (sortColumnIndex != null) {
      filteredItems.sort((a, b) {
        final valA = getComparableValue(a, sortColumnIndex!);
        final valB = getComparableValue(b, sortColumnIndex!);
        return sortAscending ? valA.compareTo(valB) : valB.compareTo(valA);
      });
    }

    if (filteredItems.isEmpty) {
      return EmptyStateWidget(
        icon: entityIcon,
        title:
            searchQuery.isNotEmpty
                ? 'Не найдено ${entityNamePlural.toLowerCase()}'
                : 'Нет ${entityNamePlural.toLowerCase()}',
        subtitle:
            searchQuery.isNotEmpty
                ? 'Попробуйте изменить параметры поиска'
                : 'Нажмите кнопку "+" чтобы добавить',
      );
    }

    // ИСПРАВЛЕНИЕ: Показываем checkbox только если есть права на удаление
    final canBulkDelete =
        permissionKeyToDelete == null ||
        ref.hasPermission(permissionKeyToDelete!);

    return BaseDataTable<T>(
      items: filteredItems,
      columns: getColumns(),
      selectedItems: selectedItems,
      isSelectAll: isSelectAll,
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
      onSelectAll: () => selectAll(filteredItems),
      onClearSelection: clearSelection,
      onToggleItem: toggleItemSelection,
      buildDataRow: buildDataRow,
      canEdit: canEdit,
      canDelete: canDelete,
      onEdit: navigateToEdit,
      onDelete: showDeleteConfirmation,
      additionalActions: getAdditionalActions,
      showCheckboxes: canBulkDelete, // Передаем информацию о правах
    );
  }

  Widget buildErrorWidget(Object error) {
    return CustomErrorWidget(error: error, onRetry: refreshList);
  }

  // Диалоги
  Future<void> showDeleteConfirmation(T item) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Подтверждение'),
            content: Text(
              'Удалить $entityNameSingular "${getItemDisplayName(item)}"?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Отмена'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Удалить'),
              ),
            ],
          ),
    );

    if (confirmed ?? false) {
      try {
        await deleteItem(item);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$entityNameSingular удален'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ошибка: $e'), backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  Future<void> deleteSelectedItems() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Подтверждение'),
            content: Text('Удалить ${selectedItems.length} элементов?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Отмена'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Удалить'),
              ),
            ],
          ),
    );

    if (confirmed ?? false) {
      try {
        // Удаляем элементы один за другим
        for (final item in selectedItems.toList()) {
          await deleteItem(item);
        }
        clearSelection();
        refreshList();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Удалено ${selectedItems.length} элементов'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ошибка при удалении: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
