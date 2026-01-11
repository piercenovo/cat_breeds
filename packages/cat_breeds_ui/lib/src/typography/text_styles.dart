import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';

/// App Text Style Definitions
/// Source: https://m3.material.io/styles/typography/type-scale-tokens
class TextStyles {
  const TextStyles._();

  static const _baseTextStyle = TextStyle(
    fontFamily: FontFamily.poppins,
    fontWeight: AppFontWeight.medium,
    color: Palette.white,
  );

  static TextStyle headlineSmall = _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: AppFontWeight.semiBold,
    color: Palette.primary,
  );

  static TextStyle headlineMedium = _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: AppFontWeight.semiBold,
    color: Palette.primary,
  );

  static TextStyle headlineLarge = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: AppFontWeight.semiBold,
    color: Palette.primary,
  );

  static TextStyle displaySmall = _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: AppFontWeight.semiBold,
    color: Palette.primary,
  );

  static TextStyle displayMedium = _baseTextStyle.copyWith(
    fontSize: 26,
    fontWeight: AppFontWeight.semiBold,
    color: Palette.primary,
  );

  static TextStyle displayLarge = _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: AppFontWeight.semiBold,
    color: Palette.primary,
  );

  static TextStyle titleSmall = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.medium,
  );

  static TextStyle titleMedium = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: AppFontWeight.medium,
  );

  static TextStyle titleLarge = _baseTextStyle.copyWith(
    fontSize: 18,
    letterSpacing: -.2,
    fontWeight: AppFontWeight.medium,
  );

  static TextStyle bodySmall = _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: AppFontWeight.regular,
  );

  static TextStyle bodyMedium = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.regular,
  );

  static TextStyle bodyLarge = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: AppFontWeight.regular,
  );

  static TextStyle labelSmall = _baseTextStyle.copyWith(fontSize: 11);

  static TextStyle labelMedium = _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: AppFontWeight.regular,
  );

  static TextStyle labelLarge = _baseTextStyle.copyWith(
    fontSize: 13,
    fontWeight: AppFontWeight.regular,
  );
}
