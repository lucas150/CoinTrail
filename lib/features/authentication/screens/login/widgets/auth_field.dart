import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String label;
  final IconData icon;
  final ColorScheme colors;
  final bool obscure;
  final FocusNode focusNode;

  const AuthField({
    super.key,
    required this.label,
    required this.icon,
    required this.colors,
    required this.focusNode,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      obscureText: obscure,
      style: TextStyle(color: colors.onPrimary),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: colors.secondary),
        floatingLabelStyle: TextStyle(
          color: colors.secondary,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Icon(icon, color: colors.secondary),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.secondary, width: 1.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.secondary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
      ),
    );
  }
}
