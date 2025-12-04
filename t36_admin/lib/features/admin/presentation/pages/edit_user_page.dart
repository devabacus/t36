// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t36_client/t36_client.dart';

import '../base/base_edit_page.dart';
import '../providers/roles_providers.dart';
import '../providers/users_providers.dart';

class EditUserPage extends BaseEditPage<SuperUserDetails> {
  const EditUserPage({super.key, required super.itemId});

  @override
  ConsumerState<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends BaseEditPageState<SuperUserDetails, EditUserPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  String? _selectedCustomerId;
  String? _selectedRoleId;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
  
  @override
  ProviderListenable<AsyncValue<SuperUserDetails?>> get itemDetailsProvider => 
      userDetailsProvider(int.parse(widget.itemId));

  @override
  String get pageTitle => 'Редактировать пользователя';
  
  @override
  Color get themeColor => Colors.blue;

  @override
  IconData get headerIcon => Icons.edit;

  @override
  void initializeForm(SuperUserDetails item) {
    _nameController.text = item.userInfo.userName ?? '';
    _emailController.text = item.userInfo.email ?? '';
    _selectedCustomerId = item.customer?.id.toString();
    _selectedRoleId = item.role?.id.toString();
  }

  @override
  Future<void> updateItem() async {
    if (_selectedCustomerId == null || _selectedRoleId == null) {
      throw Exception('Необходимо выбрать организацию и роль.');
    }
    await ref.read(updateUserProvider(
      userId: int.parse(widget.itemId),
      userName: _nameController.text,
      email: _emailController.text,
      customerId: _selectedCustomerId!,
      roleId: _selectedRoleId!,
    ).future);
  }

  @override
  List<Widget> buildFormFields(BuildContext context, SuperUserDetails item) {
    final rolesState = ref.watch(rolesListProvider);
    final customersState = ref.watch(customersListProvider);

    return [
      TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(
          labelText: 'Имя пользователя',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.person),
        ),
        validator: (value) => (value == null || value.trim().isEmpty) ? 'Введите имя' : null,
      ),
      const SizedBox(height: 16),
      TextFormField(
        controller: _emailController,
        decoration: const InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.email),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (v) => (v == null || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v)) ? 'Неверный email' : null,
      ),
      const SizedBox(height: 16),
      customersState.when(
        data: (customers) => DropdownButtonFormField<String>(
          value: _selectedCustomerId,
          decoration: const InputDecoration(labelText: 'Организация', border: OutlineInputBorder(), prefixIcon: Icon(Icons.business)),
          items: customers.map((c) => DropdownMenuItem(value: c.id.toString(), child: Text(c.name))).toList(),
          onChanged: (value) => setState(() { _selectedCustomerId = value; _selectedRoleId = null; }),
          validator: (v) => v == null ? 'Выберите организацию' : null,
        ),
        loading: () => const LinearProgressIndicator(),
        error: (e, s) => Text('Ошибка: $e'),
      ),
       const SizedBox(height: 16),
      rolesState.when(
        data: (roles) {
          final filteredRoles = roles;

          // --- ИЗМЕНЕНИЕ ЗДЕСЬ: Проверяем, существует ли выбранная роль в отфильтрованном списке ---
          final bool isRoleInList = filteredRoles.any((role) => role.id.toString() == _selectedRoleId);
          
          // Если роли нет в списке (из-за рассинхрона данных), временно сбрасываем значение дропдауна на null, чтобы избежать крэша
          final String? dropdownValue = isRoleInList ? _selectedRoleId : null;

          return DropdownButtonFormField<String>(
            value: dropdownValue, // <-- Используем безопасное значение
            decoration: const InputDecoration(labelText: 'Роль', border: OutlineInputBorder(), prefixIcon: Icon(Icons.security)),
            items: filteredRoles.map((r) => DropdownMenuItem(value: r.id.toString(), child: Text(r.name))).toList(),
            onChanged: filteredRoles.isNotEmpty ? (value) => setState(() => _selectedRoleId = value) : null,
            validator: (v) => v == null ? 'Выберите роль' : null,
          );
        },
        loading: () => const LinearProgressIndicator(),
        error: (e, s) => Text('Ошибка: $e'),
      ),
      const SizedBox(height: 24),
      Card(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: ${item.userInfo.id}', style: const TextStyle(color: Colors.grey)),
              Text('Статус: ${item.userInfo.blocked ? 'Заблокирован' : 'Активен'}',
                style: TextStyle(color: item.userInfo.blocked ? Colors.red : Colors.green),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}