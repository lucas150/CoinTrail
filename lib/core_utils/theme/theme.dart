import 'package:flutter/material.dart';
import 'color_scheme.dart';

import 'widget_themes/appbar_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_field_theme.dart';
import 'widget_themes/text_theme.dart';

class TAppTheme {
  const TAppTheme._();

  /* ============================================================
   * Light Theme
   * ============================================================ */
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: TColorScheme.light,
    scaffoldBackgroundColor: TColorScheme.light.surface,

    textTheme: TTextTheme.light,
    appBarTheme: TAppBarTheme.light,

    elevatedButtonTheme: TElevatedButtonTheme.theme(TColorScheme.light),

    outlinedButtonTheme: TOutlinedButtonTheme.theme(TColorScheme.light),

    inputDecorationTheme: TTextFormFieldTheme.light(TColorScheme.light),
  );

  /* ============================================================
   * Dark Theme
   * ============================================================ */
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: TColorScheme.dark,
    scaffoldBackgroundColor: TColorScheme.dark.surface,

    textTheme: TTextTheme.dark,
    appBarTheme: TAppBarTheme.dark,

    elevatedButtonTheme: TElevatedButtonTheme.theme(TColorScheme.dark),

    outlinedButtonTheme: TOutlinedButtonTheme.theme(TColorScheme.dark),

    inputDecorationTheme: TTextFormFieldTheme.light(TColorScheme.dark),
  );
}
