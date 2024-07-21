import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextEditingController? controller;

  CustomTextField({
    required this.label,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
    );
  }
}