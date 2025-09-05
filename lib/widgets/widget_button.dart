import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text; // bisa null jika pakai icon
  final IconData? icon; // ikon opsional
  final Color textColor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    this.text,
    this.icon,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: icon != null
          ? Icon(icon, color: textColor)
          : Text(
              text ?? '',
              style: TextStyle(color: textColor),
            ),
    );
  }
}
