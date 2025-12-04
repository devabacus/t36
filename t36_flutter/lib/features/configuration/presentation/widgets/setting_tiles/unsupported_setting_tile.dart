// manifest: startProject
import 'package:flutter/material.dart';
import '../../models/setting_view_model.dart';

class UnsupportedSettingTile extends StatelessWidget {
  final UnsupportedSettingViewModel model;

  const UnsupportedSettingTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.displayName, style: TextStyle(color: Theme.of(context).disabledColor)),
      subtitle: Text('Неподдерживаемый тип: ${model.key}'),
      leading: Icon(Icons.warning_amber_rounded, color: Colors.orange.shade300),
    );
  }
}