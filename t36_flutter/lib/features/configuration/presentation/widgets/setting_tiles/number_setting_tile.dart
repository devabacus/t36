// manifest: startProject
import 'package:flutter/material.dart';
import '../../models/setting_view_model.dart';

class NumberSettingTile extends StatelessWidget {
  final NumberSettingViewModel model;
  final ValueChanged<String> onChanged;

  const NumberSettingTile({super.key, required this.model, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.displayName),
      subtitle: Text(model.value.toString()),
      trailing: const Icon(Icons.edit, size: 20),
      onTap: () async {
        final textController = TextEditingController(text: model.value.toString());
        final newValue = await showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Изменить "${model.displayName}"'),
            content: TextField(
              controller: textController,
              autofocus: true,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Отмена')),
              ElevatedButton(onPressed: () => Navigator.pop(context, textController.text), child: const Text('Сохранить')),
            ],
          ),
        );
        if (newValue != null && num.tryParse(newValue) != null) {
          onChanged(newValue);
        }
      },
    );
  }
}