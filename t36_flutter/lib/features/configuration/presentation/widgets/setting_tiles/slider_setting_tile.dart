// manifest: startProject
import 'package:flutter/material.dart';
import '../../models/setting_view_model.dart';

class SliderSettingTile extends StatelessWidget {
  final SliderSettingViewModel model;
  final ValueChanged<String> onChanged;

  const SliderSettingTile({super.key, required this.model, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.displayName),
      subtitle: Slider(
        value: model.value,
        min: model.min,
        max: model.max,
        divisions: model.divisions,
        label: model.value.round().toString(),
        onChanged: (newValue) {
          onChanged(newValue.toStringAsFixed(1));
        },
      ),
    );
  }
}