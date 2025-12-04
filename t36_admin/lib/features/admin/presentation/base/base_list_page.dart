// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:t36_admin/core/services/permission/permission_service.dart';
import 'base_list_page_state.dart';

/// Базовый класс для страниц со списками сущностей
/// T - тип сущности (User, Role, Permission, Customer)
abstract class BaseListPage<T> extends ConsumerStatefulWidget {
  const BaseListPage({super.key});

  @override
  ConsumerState<BaseListPage<T>> createState();
}

/// Базовое состояние для страниц со списками
abstract class BaseListPageState<T, W extends BaseListPage<T>>
    extends BaseListPageStateCore<T, W> {
  
  @override
  Widget build(BuildContext context) {
    // 1. Проверяем право на чтение. Если его нет, показываем заглушку.
    if (permissionKeyToRead != null && !ref.hasPermission(permissionKeyToRead!)) {
      return Scaffold(
        appBar: buildAppBar(context),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text('Доступ запрещен', style: TextStyle(fontSize: 18)),
              Text('У вас нет прав для просмотра этого раздела.'),
            ],
          ),
        ),
      );
    }
    
    // 2. Получаем данные от провайдера.
    final asyncData = ref.watch(listProvider);
    
    // 3. Строим основной Scaffold страницы.
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          // Показываем либо панель поиска, либо панель массовых действий
          if (selectedItems.isEmpty) buildToolbar() else buildBulkActionsBar(),
          // Основной контент
          Expanded(
            child: asyncData.when(
              data: (items) => buildDataContent(items),
              loading: () => buildLoadingWidget(),
              error: (error, stack) => buildErrorWidget(error),
            ),
          ),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(),
    );
  }


  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(pageTitle),
      backgroundColor: themeColor,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: refreshList,
          tooltip: 'Обновить',
        ),
      ],
    );
  }

  Widget buildFloatingActionButton() {
    // 3. Скрываем кнопку, если нет права на создание
    final canCreate = permissionKeyToCreate == null || ref.hasPermission(permissionKeyToCreate!);
    
    if (!canCreate) {
      return const SizedBox.shrink(); // Возвращаем пустой виджет
    }
    return FloatingActionButton.extended(
      onPressed: navigateToCreate,
      backgroundColor: themeColor,
      icon: const Icon(Icons.add),
      label: Text('Добавить $entityNameSingular'),
    );
  }

  Widget buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}