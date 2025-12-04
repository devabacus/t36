// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../features/auth/presentation/providers/auth_state_providers.dart'; // <-- 1. Добавляем импорт
import '../base/base_create_page.dart';
import '../providers/roles_providers.dart';
import '../providers/users_providers.dart';

class CreateUserPage extends BaseCreatePage {
  const CreateUserPage({super.key});

  @override
  ConsumerState<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends BaseCreatePageState<CreateUserPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _selectedCustomerId;

  String? _selectedRoleId;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  String get pageTitle => 'Добавить пользователя';

  @override
  Color get themeColor => Colors.blue;

  @override
  IconData get headerIcon => Icons.person_add;

  @override
  String get buttonText => 'Создать пользователя';

  @override
  String get successMessage => 'Пользователь успешно создан';

  @override
  Future<void> createItem() async {
    if (_selectedCustomerId == null || _selectedRoleId == null) {
      throw Exception('Необходимо выбрать организацию и роль.');
    }

    try {
      await ref.read(
        createUserProvider(
          userName: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          customerId: _selectedCustomerId!,
          roleId: _selectedRoleId!,
        ).future,
      );
    } on Exception catch (e) {
      if (e.toString().contains('users_email_key')) {
        throw Exception('Пользователь с таким email уже существует.');
      }
      rethrow;
    }
  }

  @override
  List<Widget> buildFormFields(BuildContext context) {
    final rolesState = ref.watch(rolesListProvider);
    final customersState = ref.watch(customersListProvider);

    // 2. Определяем, является ли пользователь суперадмином
    final currentUser = ref.watch(authStateChangesProvider).value;
    final isSuperAdmin = currentUser?.id == 1;

    // 3. Создаем виджет для выбора организации в зависимости от роли
    Widget organizationWidget;

    if (isSuperAdmin) {
      // Для суперадмина - выпадающий список
      organizationWidget = customersState.when(
        data:
            (customers) => DropdownButtonFormField<String>(
              initialValue: _selectedCustomerId,
              decoration: const InputDecoration(
                labelText: 'Организация',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.business),
              ),
              items:
                  customers
                      .map(
                        (c) => DropdownMenuItem(
                          value: c.id.toString(),
                          child: Text(c.name),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCustomerId = value;
                  _selectedRoleId =
                      null; // Сбрасываем роль при смене организации
                });
              },
              validator:
                  (value) => value == null ? 'Выберите организацию' : null,
            ),
        loading: () => const LinearProgressIndicator(),
        error: (e, s) => Text('Ошибка загрузки организаций: $e'),
      );
    } else {
      // Для обычного админа - нередактируемое поле
      organizationWidget = customersState.when(
        data: (customers) {
          final adminCustomer = customers.isNotEmpty ? customers.first : null;
          // Автоматически устанавливаем ID организации для формы
          if (adminCustomer != null) {
            _selectedCustomerId = adminCustomer.id.toString();
          }
          return TextFormField(
            initialValue: adminCustomer?.name ?? 'Загрузка...',
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Организация',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.business),
              fillColor: Colors.grey[200],
              filled: true,
            ),
          );
        },
        loading: () => const LinearProgressIndicator(),
        error: (e, s) => Text('Ошибка загрузки организации: $e'),
      );
    }

    return [
      TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(
          labelText: 'Имя пользователя',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.person),
        ),
        validator:
            (value) =>
                (value == null || value.trim().isEmpty)
                    ? 'Введите имя пользователя'
                    : null,
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
        validator:
            (value) =>
                (value == null ||
                        !RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value))
                    ? 'Введите корректный email'
                    : null,
      ),
      const SizedBox(height: 16),
      TextFormField(
        controller: _passwordController,
        decoration: const InputDecoration(
          labelText: 'Пароль',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.lock),
        ),
        obscureText: true,
        validator:
            (value) =>
                (value == null || value.length < 6)
                    ? 'Пароль должен содержать минимум 6 символов'
                    : null,
      ),
      const SizedBox(height: 16),
      // 4. Вставляем созданный виджет в форму
      organizationWidget,
      const SizedBox(height: 16),
      rolesState.when(
        data: (roles) {
          final filteredRoles = roles;

          return DropdownButtonFormField<String>(
            initialValue: _selectedRoleId,
            decoration: InputDecoration(
              labelText: 'Роль',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.security),
            ),
            items:
                filteredRoles
                    .map(
                      (r) => DropdownMenuItem(
                        value: r.id.toString(),
                        child: Text(r.name),
                      ),
                    )
                    .toList(),
            onChanged:
                _selectedCustomerId != null
                    ? (value) => setState(() => _selectedRoleId = value)
                    : null,
            validator: (value) => value == null ? 'Выберите роль' : null,
          );
        },
        loading: () => const LinearProgressIndicator(),
        error: (e, s) => Text('Ошибка загрузки ролей: $e'),
      ),
    ];
  }
}
