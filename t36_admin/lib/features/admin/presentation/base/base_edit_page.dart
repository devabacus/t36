// manifest: startProject

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class BaseEditPage<T> extends ConsumerStatefulWidget {
  final String itemId;
  const BaseEditPage({super.key, required this.itemId});
}

abstract class BaseEditPageState<T, W extends BaseEditPage<T>>
    extends ConsumerState<W> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isInitialized = false;

  // --- Абстрактные методы для реализации в дочерних классах ---

  /// Провайдер для получения одного элемента по ID.
  ProviderListenable<AsyncValue<T?>> get itemDetailsProvider;

  /// Заголовок, отображаемый в AppBar.
  String get pageTitle;
  
  /// Основной цвет для темы страницы.
  Color get themeColor;
  
  /// Иконка, отображаемая над формой.
  IconData get headerIcon;

  /// Строит список полей формы.
  List<Widget> buildFormFields(BuildContext context, T item);
  
  /// Вызывается один раз для инициализации контроллеров формы данными из `item`.
  void initializeForm(T item);

  /// Содержит логику вызова провайдера для обновления элемента.
  Future<void> updateItem();

  // --- Основная логика ---

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      await updateItem();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Изменения успешно сохранены'),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка при сохранении: $e'),
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
    final itemState = ref.watch(itemDetailsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        backgroundColor: themeColor,
        foregroundColor: Colors.white,
      ),
      body: itemState.when(
        data: (item) {
          if (item == null) {
            return const Center(child: Text('Элемент не найден.'));
          }

          if (!_isInitialized) {
            initializeForm(item);
            _isInitialized = true;
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(headerIcon, size: 64, color: themeColor),
                    const SizedBox(height: 24),
                    ...buildFormFields(context, item),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _isLoading ? null : () => context.pop(),
                            child: const Text('Отмена'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeColor,
                              foregroundColor: Colors.white,
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
                                : const Text('Сохранить'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Ошибка загрузки данных: $error'),
          ),
        ),
      ),
    );
  }
}