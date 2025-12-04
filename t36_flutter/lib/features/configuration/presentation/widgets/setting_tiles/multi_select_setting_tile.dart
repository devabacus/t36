// manifest: startProject
import 'package:flutter/material.dart';
import '../../models/setting_view_model.dart';
import '../dialogs/multi_select_dialog.dart';

class MultiSelectSettingTile extends StatelessWidget {
  final MultiSelectSettingViewModel model;
  final ValueChanged<String> onChanged;

  const MultiSelectSettingTile({super.key, required this.model, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.displayName),
      subtitle: Text(model.currentValues.isEmpty ? 'Не выбрано' : model.currentValues.join(', ')),
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) {
            return MultiSelectDialog(
              title: model.displayName,
              options: model.options,
              initialSelection: model.currentValues,
              onConfirm: (newSelection) {
                onChanged(newSelection.join(';'));
              },
            );
          },
        );
      },
    );
  }
}