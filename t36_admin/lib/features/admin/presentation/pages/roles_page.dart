// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

import 'package:t36_client/t36_client.dart';

import '../../../../core/permissions.dart';
import '../base/base_list_page.dart';
import '../providers/roles_providers.dart';
import '../routings/roles_routes_constants.dart';

class RolesPage extends BaseListPage<Role> {
  const RolesPage({super.key});

  @override
  ConsumerState<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends BaseListPageState<Role, RolesPage> {
  @override
  String? get permissionKeyToRead => Permissions.rolesRead;
  @override
  String? get permissionKeyToCreate => Permissions.rolesCreate;
  @override
  String? get permissionKeyToUpdate => Permissions.rolesUpdate;
  @override
  String? get permissionKeyToDelete => Permissions.rolesDelete;

  @override
  String get pageTitle => 'Управление ролями';

  @override
  String get entityNameSingular => 'Роль';

  @override
  String get entityNamePlural => 'Роли';

  @override
  IconData get entityIcon => Icons.security;

  @override
  Color get themeColor => Colors.green;

  @override
  ProviderListenable<AsyncValue<List<Role>>> get listProvider =>
      rolesListProvider;

  @override
  String getItemId(Role item) => item.id.toString();

  @override
  String getItemDisplayName(Role item) => item.name;

  @override
  Comparable<dynamic> getComparableValue(Role item, int columnIndex) {
    switch (columnIndex) {
      case 0: // Название
        return item.name.toLowerCase();
      // Организацию сложно сортировать на клиенте, так как это асинхронный запрос.
      // Лучше всего делать это на сервере. Пока мы ее не сортируем.
      case 3: // ID
        return item.id.toString();
      default:
        return item.createdAt ?? DateTime(1970);
    }
  }

  @override
  List<DataColumn> getColumns() {
    return [
      DataColumn(label: const Text('Название'), onSort: onSort),
      const DataColumn(label: Text('Описание')),
      DataColumn(label: const Text('ID'), onSort: onSort),
    ];
  }

  @override
  DataRow buildDataRow(Role role) {
    return DataRow(
      cells: [
        DataCell(Text(role.name)),
        DataCell(Text(role.description ?? '-')),
        DataCell(Text(role.id.toString())),
      ],
    );
  }

  @override
  void navigateToCreate() {
    context.push(RolesRoutes.createRolePath);
  }

  @override
  void navigateToEdit(Role item) {
    context.push('${RolesRoutes.editRolePath}/${item.id}');
  }

  @override
  Future<void> deleteItem(Role item) async {
    await ref.read(deleteRoleProvider(item.id.toString()).future);
    ref.invalidate(rolesListProvider);
  }
}
