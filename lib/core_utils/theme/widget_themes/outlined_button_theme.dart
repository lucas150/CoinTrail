import 'package:flutter/material.dart';
import '../../constants/sizes.dart';

class TOutlinedButtonTheme {
  const TOutlinedButtonTheme._();

  static OutlinedButtonThemeData theme(ColorScheme colors) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colors.primary,
        side: BorderSide(color: colors.primary, width: 1.2),

        disabledForegroundColor: colors.onSurface.withOpacity(0.38),

        padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
        ),
      ),
    );
  }
}
