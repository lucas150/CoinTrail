import 'package:flutter/material.dart';
import '../../constants/sizes.dart';

class TElevatedButtonTheme {
  const TElevatedButtonTheme._();

  static ElevatedButtonThemeData theme(ColorScheme colors) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,

        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,

        disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
        disabledForegroundColor: colors.onSurface.withOpacity(0.38),

        padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
        ),
      ),
    );
  }
}
