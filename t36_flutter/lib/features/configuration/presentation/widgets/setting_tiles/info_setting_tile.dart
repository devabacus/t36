// manifest: startProject
import 'package:flutter/material.dart';
import '../../models/setting_view_model.dart';

class InfoSettingTile extends StatelessWidget {
  final InfoSettingViewModel model;

  const InfoSettingTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.displayName),
      subtitle: Text(
        model.value,
        style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color),
      ),
    );
  }
}