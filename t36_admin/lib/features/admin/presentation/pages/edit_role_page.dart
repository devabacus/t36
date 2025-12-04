// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t36_client/t36_client.dart';

import '../base/base_edit_page.dart';
import '../providers/roles_providers.dart';

class EditRolePage extends BaseEditPage<RoleDetails> {
  const EditRolePage({super.key, required super.itemId});

  @override
  ConsumerState<EditRolePage> createState() => _EditRolePageState();
}

class _EditRolePageState extends BaseEditPageState<RoleDetails, EditRolePage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  late Role _originalRole;
  final Set<String> _selectedPermissions = <String>{};

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  ProviderListenable<AsyncValue<RoleDetails?>> get itemDetailsProvider =>
      roleDetailsProvider(widget.itemId);
      
  @override
  String get pageTitle => 'Редактировать роль';
  
  @override
  Color get themeColor => Colors.green;

  @override
  IconData get headerIcon => Icons.edit;

  @override
  void initializeForm(RoleDetails item) {
    _originalRole = item.role;
    _nameController.text = item.role.name;
    _descriptionController.text = item.role.description ?? '';
    _selectedPermissions.clear();
    _selectedPermissions.addAll(item.permissionIds.map((id) => id.toString()));
  }

  @override
  Future<void> updateItem() async {
    final updatedRole = _originalRole.copyWith(
      name: _nameController.text,
      description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
    );

    await ref.read(updateRoleProvider(
      role: updatedRole,
      permissionIds: _selectedPermissions.toList(),
    ).future);
  }
   
  @override
  List<Widget> buildFormFields(BuildContext context, RoleDetails item) {
    final permissionsState = ref.watch(permissionsListProvider);

    return [
      TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(labelText: 'Название роли', border: OutlineInputBorder(), prefixIcon: Icon(Icons.badge)),
        validator: (v) => (v == null || v.trim().isEmpty) ? 'Введите название' : null,
      ),
      const SizedBox(height: 16),
      TextFormField(
        controller: _descriptionController,
        decoration: const InputDecoration(labelText: 'Описание (необязательно)', border: OutlineInputBorder(), prefixIcon: Icon(Icons.description)),
        maxLines: 3,
      ),
      const SizedBox(height: 16),
      
      const SizedBox(height: 16),
      const Text('Разрешения:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      const SizedBox(height: 8),
      permissionsState.when(
        data: (permissions) => ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: ListView(
            children: permissions.map((p) => CheckboxListTile(
              title: Text(p.key),
              value: _selectedPermissions.contains(p.id.toString()),
              onChanged: (selected) {
                setState(() {
                  final pId = p.id.toString();
                  if (selected == true) {
                    _selectedPermissions.add(pId);
                  } else {
                    _selectedPermissions.remove(pId);
                  }
                });
              },
            )).toList(),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Text('Ошибка загрузки разрешений: $e'),
      ),
    ];
  }
}