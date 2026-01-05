import 'package:flutter/material.dart';
import '../../constants/sizes.dart';

class TOutlinedButtonTheme {
  const TOutlinedButtonTheme._();

  static OutlinedButtonThemeData theme(ColorScheme colors) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colors.onSurface,
        side: BorderSide(color: colors.onSurface, width: 1),

        disabledForegroundColor: colors.onSurface.withOpacity(0.2),

        padding: const EdgeInsets.symmetric(
          vertical: TSizes.elevatedButtonHeight,
        ),

        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
        // ),
      ),
    );
  }
}
