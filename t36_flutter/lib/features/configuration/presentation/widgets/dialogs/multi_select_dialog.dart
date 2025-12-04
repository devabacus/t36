// manifest: startProject
import 'package:flutter/material.dart';

class MultiSelectDialog extends StatefulWidget {
  final String title;
  final List<String> options;
  final Set<String> initialSelection;
  final ValueChanged<Set<String>> onConfirm;

  const MultiSelectDialog({
    super.key,
    required this.title,
    required this.options,
    required this.initialSelection,
    required this.onConfirm,
  });

  @override
  State<MultiSelectDialog> createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  late Set<String> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = Set.from(widget.initialSelection);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: Column(
          children: widget.options.map((option) {
            return CheckboxListTile(
              title: Text(option),
              value: _selectedValues.contains(option),
              onChanged: (isSelected) {
                setState(() {
                  if (isSelected == true) {
                    _selectedValues.add(option);
                  } else {
                    _selectedValues.remove(option);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onConfirm(_selectedValues);
            Navigator.pop(context);
          },
          child: const Text('Применить'),
        ),
      ],
    );
  }
}