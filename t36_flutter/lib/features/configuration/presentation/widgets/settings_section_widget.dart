// manifest: startProject
import 'package:flutter/material.dart';

import '../models/settings_screen_model.dart';
import '../models/setting_view_model.dart';
import 'setting_tiles/info_setting_tile.dart';

import 'setting_tiles.dart';

// Колбэки, которые виджет будет пробрасывать дочерним компонентам
typedef OnSettingChanged = void Function(String key, dynamic value);
typedef OnGroupSelected = void Function(String groupKey);

/// Виджет для отрисовки одной секции настроек с заголовком.
class SettingsSectionWidget extends StatelessWidget {
  final SettingsSectionModel section;
  final OnSettingChanged onSettingChanged;
  final OnGroupSelected? onGroupSelected;

  const SettingsSectionWidget({
    super.key,
    required this.section,
    required this.onSettingChanged,
    this.onGroupSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (section.settings.isEmpty) {
      return const SizedBox.shrink();
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            section.title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: section.settings.length,
          itemBuilder: (context, index) {
            return _buildSettingTile(context, section.settings[index]);
          },
          separatorBuilder: (context, index) => const Divider(height: 1, indent: 16),
        ),
        const Divider(height: 1),
      ],
    );
  }

  /// Метод-диспетчер: выбирает правильный виджет-плитку для каждой ViewModel.
  Widget _buildSettingTile(BuildContext context, SettingViewModel model) {
    return model.when(
      boolean: (key, displayName, group, value) => BooleanSettingTile(
        model: model as BooleanSettingViewModel,
        onChanged: (newValue) => onSettingChanged(key, newValue),
      ),
      options: (key, displayName, group, currentValue, options) => OptionsSettingTile(
        model: model as OptionsSettingViewModel,
        onChanged: (newValue) => onSettingChanged(key, newValue),
      ),
      string: (key, displayName, group, value) => StringSettingTile(
        model: model as StringSettingViewModel,
        onChanged: (newValue) => onSettingChanged(key, newValue),
      ),
      slider: (key, displayName, group, value, min, max, divisions) => SliderSettingTile(
        model: model as SliderSettingViewModel,
        onChanged: (newValue) => onSettingChanged(key, newValue),
      ),
      multiSelect: (key, displayName, group, currentValues, options) => MultiSelectSettingTile(
        model: model as MultiSelectSettingViewModel,
        onChanged: (newValue) => onSettingChanged(key, newValue),
      ),
      number: (key, displayName, group, value) => NumberSettingTile(
        model: model as NumberSettingViewModel,
        onChanged: (newValue) => onSettingChanged(key, newValue),
      ),
      group: (key, displayName, group) => GroupSettingTile(
        model: model as GroupSettingViewModel,
        onTap: () => onGroupSelected?.call(key),
      ),
        info:
          (key, displayName, group, value) =>
              InfoSettingTile(model: model as InfoSettingViewModel),
      unsupported: (key, displayName, group) => UnsupportedSettingTile(
        model: model as UnsupportedSettingViewModel,
      ),
    );
  }
}