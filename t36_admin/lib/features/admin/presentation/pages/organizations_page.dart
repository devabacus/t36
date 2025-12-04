// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

import 'package:t36_client/t36_client.dart';

import '../../../../core/permissions.dart';
import '../base/base_list_page.dart';
import '../providers/organizations_providers.dart';
import '../routings/organizations_routes_constants.dart';

class OrganizationsPage extends BaseListPage<Customer> {
  const OrganizationsPage({super.key});

  @override
  ConsumerState<OrganizationsPage> createState() => _OrganizationsPageState();
}

class _OrganizationsPageState
    extends BaseListPageState<Customer, OrganizationsPage> {
  @override
  String? get permissionKeyToRead => Permissions.organizationsRead;
  @override
  String? get permissionKeyToCreate => Permissions.organizationsCreate;
  @override
  String? get permissionKeyToUpdate => Permissions.organizationsUpdate;
  @override
  String? get permissionKeyToDelete => Permissions.organizationsDelete;

  @override
  String get pageTitle => 'Управление организациями';

  @override
  String get entityNameSingular => 'Организацию';

  @override
  String get entityNamePlural => 'Организации';

  @override
  IconData get entityIcon => Icons.business;

  @override
  Color get themeColor => Colors.orange;

  @override
  ProviderListenable<AsyncValue<List<Customer>>> get listProvider =>
      organizationsListProvider;

  @override
  String getItemId(Customer item) => item.id.toString();

  @override
  String getItemDisplayName(Customer item) => item.name;

  @override
  Comparable<dynamic> getComparableValue(Customer item, int columnIndex) {
    switch (columnIndex) {
      case 0: // Название
        return item.name.toLowerCase();
      case 1: // Email
        return item.email?.toLowerCase() ?? '';
      case 3: // ID
        return item.id.toString();
      default:
        return item
            .createdAt; // По умолчанию, например, для несортируемых колонок
    }
  }

  @override
  List<DataColumn> getColumns() {
    return [
      DataColumn(label: const Text('Название'), onSort: onSort),
      DataColumn(label: const Text('Email'), onSort: onSort),
      const DataColumn(label: Text('Описание')), // Несортируемая колонка
      DataColumn(label: const Text('ID'), onSort: onSort),
    ];
  }

  @override
  DataRow buildDataRow(Customer item) {
    return DataRow(
      cells: [
        DataCell(Text(item.name)),
        DataCell(Text(item.email ?? '-')),
        DataCell(Text(item.info ?? '-')),
        DataCell(Text(item.id.toString())),
      ],
    );
  }

  @override
  void navigateToCreate() {
    context.push(OrganizationsRoutes.createOrganizationPath);
  }

  @override
  void navigateToEdit(Customer item) {
    context.push('${OrganizationsRoutes.editOrganizationPath}/${item.id}');
  }

  @override
  Future<void> deleteItem(Customer item) async {
    await ref.read(deleteOrganizationProvider(item.id.toString()).future);
    ref.invalidate(organizationsListProvider);
  }

  @override
  bool canEdit(Customer item) => true;
}
