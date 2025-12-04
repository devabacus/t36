// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

abstract class BaseCreatePage extends ConsumerStatefulWidget {
  const BaseCreatePage({super.key});
}

abstract class BaseCreatePageState<W extends BaseCreatePage>
    extends ConsumerState<W> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // --- Абстрактные методы для реализации в дочерних классах ---

  /// Заголовок, отображаемый в AppBar.
  String get pageTitle;

  /// Основной цвет для темы страницы (AppBar, кнопка и т.д.).
  Color get themeColor;

  /// Иконка, отображаемая над формой.
  IconData get headerIcon;

  /// Текст для кнопки отправки формы.
  String get buttonText;
  
  /// Сообщение для SnackBar при успешном создании.
  String get successMessage;

  /// Строит список полей формы (TextFormField, DropdownButton, и т.д.).
  List<Widget> buildFormFields(BuildContext context);

  /// Содержит логику вызова провайдера для создания сущности.
  /// В случае неудачи должен выбрасывать исключение.
  Future<void> createItem();

  // --- Основная логика ---

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      await createItem();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(successMessage),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка при создании: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        backgroundColor: themeColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  headerIcon,
                  size: 64,
                  color: themeColor,
                ),
                const SizedBox(height: 24),
                ...buildFormFields(context),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(buttonText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}