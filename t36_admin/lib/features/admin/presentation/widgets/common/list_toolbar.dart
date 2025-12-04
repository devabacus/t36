// manifest: startProject

import 'package:flutter/material.dart';

class ListToolbar extends StatelessWidget {
  final TextEditingController searchController;
  final String entityNamePlural;
  final Function(String) onSearchChanged;
  final List<Widget>? additionalFilters;

  const ListToolbar({
    super.key,
    required this.searchController,
    required this.entityNamePlural,
    required this.onSearchChanged,
    this.additionalFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Поиск ${entityNamePlural.toLowerCase()}...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onChanged: onSearchChanged,
            ),
          ),
          if (additionalFilters != null) ...[
            const SizedBox(width: 16),
            ...additionalFilters!,
          ],
        ],
      ),
    );
  }
}