// manifest: startProject
import 'package:flutter/material.dart';
import '../../models/setting_view_model.dart';

class OptionsSettingTile extends StatelessWidget {
  final OptionsSettingViewModel model;
  final ValueChanged<String> onChanged;

  const OptionsSettingTile({super.key, required this.model, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.displayName),
      subtitle: Text(model.currentValue),
      trailing: const Icon(Icons.arrow_drop_down),
      onTap: () async {
        final selected = await showDialog<String>(
          context: context,
          builder: (context) => SimpleDialog(
            title: Text('Выбрать "${model.displayName}"'),
            children: model.options.map((option) => SimpleDialogOption(
              onPressed: () => Navigator.pop(context, option),
              child: Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: Text(option)),
            )).toList(),
          ),
        );
        if (selected != null) {
          onChanged(selected);
        }
      },
    );
  }
}
