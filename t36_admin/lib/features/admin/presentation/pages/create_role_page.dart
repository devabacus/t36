// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../base/base_create_page.dart';
import '../providers/roles_providers.dart';

class CreateRolePage extends BaseCreatePage {
  const CreateRolePage({super.key});

  @override
  ConsumerState<CreateRolePage> createState() => _CreateRolePageState();
}

class _CreateRolePageState extends BaseCreatePageState<CreateRolePage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  final Set<String> _selectedPermissions = <String>{};

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  String get pageTitle => 'Добавить роль';
  
  @override
  Color get themeColor => Colors.green;

  @override
  IconData get headerIcon => Icons.security;
  
  @override
  String get buttonText => 'Создать роль';

  @override
  String get successMessage => 'Роль успешно создана';
  
  @override
  Future<void> createItem() async {
    if (_selectedPermissions.isEmpty) {
      // Выбрасываем исключение, которое будет поймано в базовом классе
      throw Exception('Выберите организацию и хотя бы одно разрешение.');
    }

    await ref.read(createRoleProvider(
      roleName: _nameController.text,
      roleDescription: _descriptionController.text.isEmpty
          ? null
          : _descriptionController.text,
      permissionIds: _selectedPermissions.toList(),
    ).future);
  }

  @override
  List<Widget> buildFormFields(BuildContext context) {
    final permissionsState = ref.watch(permissionsListProvider);

    return [
      TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(
          labelText: 'Название роли',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.badge),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Введите название роли';
          }
          return null;
        },
      ),
      const SizedBox(height: 16),
      TextFormField(
        controller: _descriptionController,
        decoration: const InputDecoration(
          labelText: 'Описание (необязательно)',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.description),
        ),
        maxLines: 3,
      ),
      const SizedBox(height: 16),      
      const Text('Разрешения:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      const SizedBox(height: 8),
      permissionsState.when(
        data: (permissions) => ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200), // Ограничиваем высоту списка
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: permissions.length,
            itemBuilder: (context, index) {
              final permission = permissions[index];
              return CheckboxListTile(
                title: Text(permission.key),
                subtitle: permission.description != null ? Text(permission.description!) : null,
                value: _selectedPermissions.contains(permission.id.toString()),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      _selectedPermissions.add(permission.id.toString());
                    } else {
                      _selectedPermissions.remove(permission.id.toString());
                    }
                  });
                },
              );
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Text('Ошибка загрузки разрешений: $e'),
      ),
    ];
  }
}