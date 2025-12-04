// manifest: startProject
import 'package:flutter/material.dart';
import '../../models/setting_view_model.dart';

class BooleanSettingTile extends StatelessWidget {
  final BooleanSettingViewModel model;
  final ValueChanged<bool> onChanged;

  const BooleanSettingTile({super.key, required this.model, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(model.displayName),
      value: model.value,
      onChanged: onChanged,
    );
  }
}