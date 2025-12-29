import 'package:flutter/material.dart';
import '../../constants/sizes.dart';

class TTextFormFieldTheme {
  const TTextFormFieldTheme._();

  static InputDecorationTheme light(ColorScheme colors) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colors.surface,

      prefixIconColor: colors.onSurface.withOpacity(0.6),
      suffixIconColor: colors.onSurface.withOpacity(0.6),

      labelStyle: TextStyle(color: colors.onSurface.withOpacity(0.6)),

      floatingLabelStyle: TextStyle(
        color: colors.primary,
        fontWeight: FontWeight.w500,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
        borderSide: BorderSide(color: colors.outline, width: 1),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
        borderSide: BorderSide(color: colors.primary, width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
        borderSide: BorderSide(color: colors.error, width: 1.5),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
        borderSide: BorderSide(color: colors.error, width: 2),
      ),
    );
  }
}
