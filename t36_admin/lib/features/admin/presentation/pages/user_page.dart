// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

import 'package:t36_admin/core/services/permission/permission_service.dart';
import 'package:t36_client/t36_client.dart';

import '../../../../core/permissions.dart';
import '../base/base_list_page.dart';
import '../providers/users_providers.dart';
import '../routings/user_routes_constants.dart';
import '../widgets/dialogs/user_dialogs.dart';

// class UserPage extends StatefulWidget {
//   const UserPage({super.key});

//   @override
//   State<UserPage> createState() => _UserPageState();
// }

// class _UserPageState extends State<UserPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class UsersPage extends BaseListPage<UserDetails> {
  const UsersPage({super.key});

  @override
  ConsumerState<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends BaseListPageState<UserDetails, UsersPage> {
  @override
  String? get permissionKeyToRead => Permissions.usersRead;
  @override
  String? get permissionKeyToCreate => Permissions.usersCreate;
  @override
  String? get permissionKeyToUpdate => Permissions.usersUpdate;
  @override
  String? get permissionKeyToDelete => Permissions.usersDelete;

  @override
  String get pageTitle => 'Управление пользователями';

  @override
  String get entityNameSingular => 'Пользователя';

  @override
  String get entityNamePlural => 'Пользователи';

  @override
  IconData get entityIcon => Icons.people;

  @override
  Color get themeColor => Colors.blue;

  @override
  ProviderListenable<AsyncValue<List<UserDetails>>> get listProvider =>
      usersListProvider;

  @override
  String getItemId(UserDetails item) => item.userInfo.id.toString();

  @override
  String getItemDisplayName(UserDetails item) =>
      item.userInfo.userName ?? 'N/A';

  @override
  Comparable<dynamic> getComparableValue(UserDetails item, int columnIndex) {
    switch (columnIndex) {
      case 0: // Имя
        return item.userInfo.userName?.toLowerCase() ?? '';
      case 1: // Email
        return item.userInfo.email?.toLowerCase() ?? '';
      case 2: // Роль
        return item.role?.name.toLowerCase() ?? '';
      case 3: // Статус
        return item.userInfo.blocked.toString(); // "true" или "false"
      default:
        return item.userInfo.id ?? 0;
    }
  }

  @override
  List<DataColumn> getColumns() {
    return [
      DataColumn(label: const Text('Имя'), onSort: onSort),
      DataColumn(label: const Text('Email'), onSort: onSort),
      DataColumn(label: const Text('Роль'), onSort: onSort),
      DataColumn(label: const Text('Статус'), onSort: onSort),
    ];
  }

  @override
  DataRow buildDataRow(UserDetails item) {
    final user = item.userInfo;
    final roleName = item.role?.name ?? 'Не назначена';

    return DataRow(
      cells: [
        DataCell(Text(user.userName ?? '')),
        DataCell(Text(user.email ?? '')),
        DataCell(Text(roleName)),
        DataCell(
          Text(
            user.blocked ? 'Заблокирован' : 'Активен',
            style: TextStyle(
              color: user.blocked ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void navigateToCreate() {
    context.push(UsersRoutes.createUserPath);
  }

  @override
  void navigateToEdit(UserDetails item) {
    context.push(UsersRoutes.editUserPathWithId(item.userInfo.id.toString()));
  }

  @override
  Future<void> deleteItem(UserDetails item) async {
    await ref.read(deleteUserProvider(item.userInfo.id!).future);
    ref.invalidate(usersListProvider);
  }

  @override
  List<Widget> getAdditionalActions(UserDetails item) {
    final user = item.userInfo;
    if (!ref.hasPermission('users.block')) {
      return [];
    }
    return [
      IconButton(
        icon: Icon(
          user.blocked ? Icons.lock_open : Icons.lock,
          color: user.blocked ? Colors.green : Colors.orange,
          size: 20,
        ),
        tooltip: user.blocked ? 'Разблокировать' : 'Заблокировать',
        mouseCursor: SystemMouseCursors.click,
        onPressed: () {
          showBlockUserDialog(
            context: context,
            ref: ref,
            user: user,
            onSuccess: refreshList,
          );
        },
      ),
    ];
  }
}
