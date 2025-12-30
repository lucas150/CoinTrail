import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String label;
  final IconData icon;
  final ColorScheme colors;
  final bool obscure;
  final FocusNode focusNode;
  final TextEditingController controller;

  const AuthField({
    super.key,
    required this.label,
    required this.icon,
    required this.colors,
    required this.focusNode,
    required this.controller,
    this.obscure = false,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: _obscureText,
      style: TextStyle(color: widget.colors.onPrimary),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: widget.colors.secondary),
        floatingLabelStyle: TextStyle(
          color: widget.colors.secondary,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Icon(widget.icon, color: widget.colors.secondary),

        // 👁 SHOW / HIDE PASSWORD
        suffixIcon: widget.obscure
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: widget.colors.secondary,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,

        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: widget.colors.secondary, width: 1.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: widget.colors.secondary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
      ),
    );
  }
}
