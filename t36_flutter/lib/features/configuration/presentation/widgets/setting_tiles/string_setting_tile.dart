// manifest: startProject
import 'package:flutter/material.dart';
import '../../models/setting_view_model.dart';

class StringSettingTile extends StatelessWidget {
  final StringSettingViewModel model;
  final ValueChanged<String> onChanged;

  const StringSettingTile({super.key, required this.model, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.displayName),
      subtitle: Text(model.value),
      trailing: const Icon(Icons.edit, size: 20),
      onTap: () async {
        final textController = TextEditingController(text: model.value);
        final newValue = await showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Изменить "${model.displayName}"'),
            content: TextField(
              controller: textController,
              autofocus: true,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Отмена'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, textController.text),
                child: const Text('Сохранить'),
              ),
            ],
          ),
        );

        if (newValue != null && newValue.isNotEmpty) {
          onChanged(newValue);
        }
      },
    );
  }
}