import 'package:flutter/material.dart';
import 'package:todolist/widgets/widget_button.dart';// Pastikan path-nya sesuai

class TodoItem extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final bool isChecked;
  final VoidCallback onCheckChanged;

  const TodoItem({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.isChecked,
    required this.onCheckChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Notes (Title)
        Text(title),

        // Description
        Text(description),

        // Category
        Text("Category: $category"),

        // Check Button (as Checkbox for now)
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (_) => onCheckChanged(),
            ),
          ],
        ),
      ],
    );
  }
}
