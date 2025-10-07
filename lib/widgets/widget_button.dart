import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;       // Bisa null jika hanya icon
  final IconData? icon;     // Ikon opsional
  final Color foregroundColor;    // Warna teks/icon
  final Color backgroundColor; // Warna latar belakang tombol
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    this.text,
    this.icon,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // warna background
        foregroundColor: foregroundColor,       // warna teks & icon default
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: icon != null
          ? Icon(icon)
          : Text(
              text ?? '',
              style: TextStyle(color: foregroundColor,fontSize: 15),
            ),
    );
  }
}
