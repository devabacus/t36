// manifest: startProject
import 'package:flutter/material.dart';

import '../models/settings_screen_model.dart';
import 'settings_section_widget.dart'; // <-- ИМПОРТИРУЕМ НОВЫЙ ФАЙЛ

/// Колбэк для уведомления об изменении значения настройки.
typedef OnSettingChanged = void Function(String key, dynamic value);

/// Колбэк для уведомления о том, что пользователь выбрал группу для перехода.
typedef OnGroupSelected = void Function(String groupKey);

/// Универсальный виджет, который отрисовывает экран настроек
/// на основе декларативной модели [screenModel].
class SettingsScreenWidget extends StatelessWidget {
  final SettingsScreenModel screenModel;
  final OnSettingChanged onSettingChanged;
  final OnGroupSelected? onGroupSelected;

  const SettingsScreenWidget({
    super.key,
    required this.screenModel,
    required this.onSettingChanged,
    this.onGroupSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenModel.title),
      ),
      body: ListView.builder(
        itemCount: screenModel.sections.length,
        itemBuilder: (context, index) {
          final section = screenModel.sections[index];
          // Теперь мы просто используем наш новый, отдельный виджет
          return SettingsSectionWidget(
            section: section,
            onSettingChanged: onSettingChanged,
            onGroupSelected: onGroupSelected,
          );
        },
      ),
    );
  }
}