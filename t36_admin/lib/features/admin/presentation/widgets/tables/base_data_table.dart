// manifest: startProject

import 'package:flutter/material.dart';

class BaseDataTable<T> extends StatelessWidget {
  final List<T> items;
  final List<DataColumn> columns;
  final Set<T> selectedItems;
  final bool isSelectAll;
  final int? sortColumnIndex;
  final bool sortAscending;
  final VoidCallback onSelectAll;
  final VoidCallback onClearSelection;
  final Function(T) onToggleItem;
  final DataRow Function(T) buildDataRow;
  final bool Function(T) canEdit;
  final bool Function(T) canDelete;
  final Function(T) onEdit;
  final Function(T) onDelete;
  final List<Widget> Function(T) additionalActions;
  final bool showCheckboxes; // Новый параметр для контроля отображения checkbox

  const BaseDataTable({
    super.key,
    required this.items,
    required this.columns,
    required this.selectedItems,
    required this.isSelectAll,
    this.sortColumnIndex,
    required this.sortAscending,
    required this.onSelectAll,
    required this.onClearSelection,
    required this.onToggleItem,
    required this.buildDataRow,
    required this.canEdit,
    required this.canDelete,
    required this.onEdit,
    required this.onDelete,
    required this.additionalActions,
    this.showCheckboxes = true, // По умолчанию показываем checkbox
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          // ИСПРАВЛЕНИЕ 1: Отключаем встроенные checkbox у DataTable, используем кастомные
          showCheckboxColumn: false,
          sortColumnIndex: sortColumnIndex,
          sortAscending: sortAscending,
          columns: [
            // Колонка с кастомным checkbox для "выбрать все" (только если showCheckboxes = true)
            if (showCheckboxes)
              DataColumn(
                label: Checkbox(
                  value: isSelectAll,
                  onChanged: (value) {
                    if (value ?? false) {
                      onSelectAll();
                    } else {
                      onClearSelection();
                    }
                  },
                ),
              ),
            ...columns,
            const DataColumn(label: Text('Действия')),
          ],
          rows: items.map((item) {
            final isSelected = selectedItems.contains(item);
            final dataRow = buildDataRow(item);
            
            return DataRow(
              // ИСПРАВЛЕНИЕ 2: Убираем встроенный выбор строки у DataTable
              // selected: isSelected,
              // onSelectChanged: (_) => onToggleItem(item), 
              cells: [
                // Checkbox для выбора строки (только если showCheckboxes = true)
                if (showCheckboxes)
                  DataCell(
                    Checkbox(
                      value: isSelected,
                      onChanged: (_) => onToggleItem(item),
                    ),
                  ),
                ...dataRow.cells,
                DataCell(
                  _buildActionsCell(item),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

   Widget _buildActionsCell(T item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (canEdit(item))
          IconButton(
            icon: const Icon(Icons.edit, size: 20),
            color: Colors.blue,
            onPressed: () => onEdit(item),
            tooltip: 'Редактировать',
            mouseCursor: SystemMouseCursors.click,
          ),
        if (canDelete(item))
          IconButton(
            icon: const Icon(Icons.delete, size: 20),
            color: Colors.red,
            onPressed: () => onDelete(item),
            tooltip: 'Удалить',
            mouseCursor: SystemMouseCursors.click,
          ),
        ...additionalActions(item),
      ],
    );
  }
}