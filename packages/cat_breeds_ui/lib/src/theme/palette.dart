import 'package:flutter/material.dart';

class Palette {
  const Palette._();

  // ---------------------------------------------------------------------------
  // Brand / Logo
  // ---------------------------------------------------------------------------

  static const Color brandPrimary = Color(0xFF665687);
  static const Color brandSecondary = Color(0xFF89759C);
  static const Color brandDark = Color(0xFF231F20);
  static const Color brandPrimaryLight = Color(0xFF9A8FB0);
  static const Color brandPrimaryDark = Color(0xFF4F436A);

  // ---------------------------------------------------------------------------
  // Neutral scale
  // ---------------------------------------------------------------------------

  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFF7F7F8);
  static const Color neutral100 = Color(0xFFEDEDEF);
  static const Color neutral200 = Color(0xFFD1D1D6);
  static const Color neutral300 = Color(0xFFB1B1B8);
  static const Color neutral400 = Color(0xFF8E8E93);
  static const Color neutral500 = Color(0xFF6D6D72);
  static const Color neutral600 = Color(0xFF4A4A4F);
  static const Color neutral700 = Color(0xFF2C2C2E);
  static const Color neutral800 = Color(0xFF1C1C1E);
  static const Color neutral900 = Color(0xFF121212);

  static const Color black = neutral900;
  static const Color white = neutral0;
  static const Color transparent = Colors.transparent;

  // ---------------------------------------------------------------------------
  // Semantic colors
  // ---------------------------------------------------------------------------

  static const Color primary = brandPrimary;
  static const Color primaryDark = brandPrimaryDark;
  static const Color primaryLight = brandPrimaryLight;

  static const Color secondary = brandSecondary;
  static const Color secondaryDark = Color(0xFF6E5A82);
  static const Color secondaryLight = Color(0xFFB6A7C3);

  static const Color accent = Color(0xFFFFC107);
  static const Color accentDark = Color(0xFFFFA000);
  static const Color accentLight = Color(0xFFFFE082);

  // ---------------------------------------------------------------------------
  // Backgrounds & surfaces
  // ---------------------------------------------------------------------------

  static const Color scaffoldBackground = neutral0;
  static const Color scaffoldBackgroundDark = neutral900;

  static const Color surface = Color(0xFFF4F2F7);
  static const Color surfaceDark = neutral800;

  static const Color dialogBackground = neutral0;
  static const Color dialogBackgroundDark = neutral800;

  static const Color bottomSheetBackground = neutral0;
  static const Color bottomSheetBackgroundDark = neutral800;

  // ---------------------------------------------------------------------------
  // Text
  // ---------------------------------------------------------------------------

  static const Color textPrimary = neutral900;
  static const Color textPrimaryDark = neutral0;

  static const Color textSecondary = neutral600;
  static const Color textSecondaryDark = neutral300;

  static const Color hint = neutral500;
  static const Color hintDark = neutral400;

  static const Color blue = Color(0xFF0288D1);
  static const Color green = Color(0xFF2E7D32);
  static const Color red = Color(0xFFD32F2F);

  // ---------------------------------------------------------------------------
  // Utilities
  // ---------------------------------------------------------------------------

  static const Color divider = neutral200;
  static const Color dividerDark = neutral700;

  // ---------------------------------------------------------------------------
  // Extras: colores suaves / pastel para UI / Cards
  // ---------------------------------------------------------------------------

  static const Color pastelBlue = Color(0xFFB3C7E6);
  static const Color pastelGreen = Color(0xFFA4E6B3);
  static const Color pastelOrange = Color(0xFFFACBA3);
  static const Color pastelPink = Color(0xFFF3A3B9);
  static const Color pastelPurple = Color(0xFFCBA3E6);
  static const Color pastelYellow = Color(0xFFFFF3B0);
}
