// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TColorScheme {
  const TColorScheme._();

  // ===============================
  // Brand Colors
  // ===============================
  static const Color lightPrimary = Color(0xFF1E40AF);
  static const Color lightOnPrimary = Colors.white;
  static const Color lightSecondary = Color(0xFF38BDF8);
  static const Color lightOnSecondary = Colors.white;

  // ===============================
  // Light Theme Colors
  // ===============================
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightOnBackground = Color(0xFF0F172A);

  // ===============================
  // Dark Theme Colors
  // ===============================

  // ===============================
  // Dark Brand Colors
  // ===============================
  static const Color darkPrimary = Color(0xFF1E40AF);
  static const Color darkOnPrimary = Colors.white;
  static const Color darkSecondary = Color(0xFF38BDF8);
  static const Color darkOnSecondary = Colors.white;

  // ===============================
  // Dark Theme Colors
  // ===============================
  static const Color darkSurface = Color(0xFF020617);
  static const Color darkOnSurface = Color(0xFFE5E7EB);

  // ===============================
  // Semantic
  // ===============================
  static const Color error = Color(0xFFDC2626);

  // ===============================
  // Light ColorScheme
  // ===============================
  static final ColorScheme light = ColorScheme(
    brightness: Brightness.light,

    primary: lightPrimary,
    onPrimary: lightOnPrimary,

    secondary: lightSecondary,
    onSecondary: lightOnSecondary,

    surface: lightBackground,
    onSurface: lightOnBackground,

    background: lightBackground,
    onBackground: lightOnBackground,

    error: error,
    onError: Colors.white,
  );

  // ===============================
  // Dark ColorScheme
  // ===============================
  static final ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,

    primary: darkPrimary,
    onPrimary: darkOnPrimary,

    secondary: darkSecondary,
    onSecondary: darkOnSecondary,

    surface: darkSurface,
    onSurface: darkOnSurface,

    background: darkSurface,
    onBackground: darkOnSurface,

    error: error,
    onError: Colors.white,
  );
}
