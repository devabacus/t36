// manifest: startProject
import 'package:flutter/material.dart';
import '../../models/setting_view_model.dart';

class GroupSettingTile extends StatelessWidget {
  final GroupSettingViewModel model;
  final VoidCallback onTap;

  const GroupSettingTile({super.key, required this.model, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.displayName),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}