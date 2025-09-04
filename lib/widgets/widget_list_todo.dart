import 'package:flutter/material.dart';
import 'package:todolist/widgets/widget_button.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final bool isChecked;
  final VoidCallback onCheckChanged;
  final VoidCallback onButtonPressed;

  const TodoItem({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.isChecked,
    required this.onCheckChanged,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Text(description),
        Text("Category: $category"),
        Row(
          children: [
            CustomButton(
  icon: Icons.check, // ✅ tombol centang
  textColor: Colors.green,
  onPressed: onCheckChanged,
),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
