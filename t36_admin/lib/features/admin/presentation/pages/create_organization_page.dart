// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../base/base_create_page.dart';
import '../providers/organizations_providers.dart';

class CreateOrganizationPage extends BaseCreatePage {
  const CreateOrganizationPage({super.key});

  @override
  ConsumerState<CreateOrganizationPage> createState() =>
      _CreateOrganizationPageState();
}

class _CreateOrganizationPageState
    extends BaseCreatePageState<CreateOrganizationPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _infoController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _infoController.dispose();
    super.dispose();
  }

  @override
  String get pageTitle => 'Добавить организацию';
  
  @override
  Color get themeColor => Colors.orange;

  @override
  IconData get headerIcon => Icons.business;
  
  @override
  String get buttonText => 'Создать организацию';

  @override
  String get successMessage => 'Организация успешно создана';

  @override
  Future<void> createItem() async {
    await ref.read(createOrganizationProvider(
      organizationName: _nameController.text,
      organizationEmail:
          _emailController.text.isEmpty ? null : _emailController.text,
      organizationInfo:
          _infoController.text.isEmpty ? null : _infoController.text,
    ).future);
  }

  @override
  List<Widget> buildFormFields(BuildContext context) {
    return [
      TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(
          labelText: 'Название организации',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.business),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Введите название организации';
          }
          return null;
        },
      ),
      const SizedBox(height: 16),
      TextFormField(
        controller: _emailController,
        decoration: const InputDecoration(
          labelText: 'Email (необязательно)',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.email),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value != null && value.isNotEmpty) {
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Введите корректный email';
            }
          }
          return null;
        },
      ),
      const SizedBox(height: 16),
      TextFormField(
        controller: _infoController,
        decoration: const InputDecoration(
          labelText: 'Описание (необязательно)',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.info),
        ),
        maxLines: 3,
      ),
    ];
  }
}