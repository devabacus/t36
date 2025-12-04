// manifest: startProject
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t36_client/t36_client.dart';

import '../base/base_edit_page.dart';
import '../providers/organizations_providers.dart';

class EditOrganizationPage extends BaseEditPage<Customer> {
  const EditOrganizationPage({super.key, required super.itemId});

  @override
  ConsumerState<EditOrganizationPage> createState() => _EditOrganizationPageState();
}

class _EditOrganizationPageState extends BaseEditPageState<Customer, EditOrganizationPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _infoController = TextEditingController();
  
  late Customer _originalCustomer;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _infoController.dispose();
    super.dispose();
  }

  @override
  ProviderListenable<AsyncValue<Customer?>> get itemDetailsProvider =>
      organizationDetailsProvider(widget.itemId);
  
  @override
  String get pageTitle => 'Редактировать организацию';
  
  @override
  Color get themeColor => Colors.orange;

  @override
  IconData get headerIcon => Icons.edit;

  @override
  void initializeForm(Customer item) {
    _originalCustomer = item;
    _nameController.text = item.name;
    _emailController.text = item.email ?? '';
    _infoController.text = item.info ?? '';
  }

  @override
  Future<void> updateItem() async {
    final updatedCustomer = _originalCustomer.copyWith(
      name: _nameController.text,
      email: _emailController.text.isEmpty ? null : _emailController.text,
      info: _infoController.text.isEmpty ? null : _infoController.text,
      lastModified: DateTime.now(),
    );

    // Вызываем новый провайдер для обновления
    await ref.read(updateOrganizationProvider(customer: updatedCustomer).future);
  }

  @override
  List<Widget> buildFormFields(BuildContext context, Customer item) {
    return [
      TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(
          labelText: 'Название организации',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.business),
        ),
        validator: (value) => (value == null || value.trim().isEmpty) ? 'Введите название' : null,
      ),
      const SizedBox(height: 16),
      TextFormField(
        controller: _emailController,
        decoration: const InputDecoration(labelText: 'Email (необязательно)', border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value != null && value.isNotEmpty && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Введите корректный email';
          }
          return null;
        },
      ),
      const SizedBox(height: 16),
      TextFormField(
        controller: _infoController,
        decoration: const InputDecoration(labelText: 'Описание (необязательно)', border: OutlineInputBorder(), prefixIcon: Icon(Icons.info)),
        maxLines: 3,
      ),
    ];
  }
}