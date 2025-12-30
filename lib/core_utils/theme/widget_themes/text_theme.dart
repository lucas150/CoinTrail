import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  const TTextTheme._();

  static final TextTheme light = TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
    bodyLarge: GoogleFonts.poppins(fontSize: 16),
    bodyMedium: GoogleFonts.poppins(fontSize: 14),
    labelLarge: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
  );

  static final TextTheme dark = light;
}
