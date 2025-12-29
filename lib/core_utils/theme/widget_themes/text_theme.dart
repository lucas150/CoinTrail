import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Light & Dark Text Themes
class TTextTheme {
  const TTextTheme._();

  /* ============================================================
   * Light Text Theme
   * ============================================================ */
  static final TextTheme light = TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 32,
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

  /* ============================================================
   * Dark Text Theme
   * ============================================================ */
  static final TextTheme dark = TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 32,
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
}
