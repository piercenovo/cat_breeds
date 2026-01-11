import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';

class CBTheme {
  const CBTheme._();

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Palette.primary,
    popupMenuTheme: PopupMenuThemeData(
      color: Palette.scaffoldBackground,
      surfaceTintColor: Palette.scaffoldBackground,
      textStyle: TextStyles.bodyMedium.apply(
        color: Palette.neutral500,
      ),
    ),
    scaffoldBackgroundColor: Palette.scaffoldBackground,
    iconTheme: const IconThemeData(color: Palette.neutral500),
    appBarTheme: AppBarTheme(
      backgroundColor: Palette.scaffoldBackground,
      foregroundColor: Palette.black,
      elevation: 0,
      titleTextStyle: TextStyles.titleLarge,
    ),
    colorScheme: const ColorScheme.light(
      primary: Palette.primary,
      secondary: Palette.white,
      tertiary: Palette.black,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      fillColor: Palette.white,
      filled: true,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Palette.white,
      surfaceTintColor: Palette.white,
      shadowColor: Palette.white,
    ),
    hintColor: Palette.hint,
    focusColor: Palette.hint,
    textTheme: TextTheme(
      displayLarge: TextStyles.displayLarge,
      displayMedium: TextStyles.displayMedium,
      headlineSmall: TextStyles.headlineSmall,
      headlineMedium: TextStyles.headlineMedium,
      headlineLarge: TextStyles.headlineLarge,
      bodySmall: const TextStyle(
        color: Palette.textPrimaryDark,
      ),
      bodyMedium: TextStyles.bodyMedium.apply(
        color: Palette.neutral500,
      ),
      bodyLarge: TextStyles.bodyLarge.apply(
        color: Palette.neutral600,
      ),
      titleSmall: TextStyles.titleSmall.apply(
        color: Palette.neutral500,
      ),
      titleMedium: TextStyles.titleMedium.apply(
        color: Palette.neutral500,
      ),
      titleLarge: TextStyles.titleLarge.apply(
        color: Palette.neutral600,
      ),
      labelSmall: TextStyles.labelSmall,
      labelMedium: TextStyles.labelMedium.apply(
        color: Palette.neutral500,
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Palette.primaryDark,
    popupMenuTheme: PopupMenuThemeData(
      color: Palette.scaffoldBackgroundDark,
      surfaceTintColor: Palette.scaffoldBackgroundDark,
      textStyle: TextStyles.bodyMedium.apply(
        color: Palette.white.withValues(alpha: .7),
      ),
    ),
    timePickerTheme: TimePickerThemeData(
      entryModeIconColor: Colors.transparent,
      backgroundColor: Colors.teal.shade50,
      hourMinuteTextColor: Palette.black,
      dayPeriodTextColor: Palette.black,
      dayPeriodBorderSide: const BorderSide(
        color: Palette.primary,
      ),
      dialHandColor: Colors.teal.shade200,
      helpTextStyle: const TextStyle(
        color: Palette.primary,
      ),
      cancelButtonStyle: TextButton.styleFrom(
        foregroundColor: Palette.primary,
      ),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: Palette.primary,
      ),
      hourMinuteTextStyle: const TextStyle(
        fontSize: 30,
      ),
    ),
    scaffoldBackgroundColor: Palette.scaffoldBackgroundDark,
    iconTheme: IconThemeData(color: Palette.white.withValues(alpha: .7)),
    colorScheme: const ColorScheme.dark(
      primary: Palette.primaryDark,
      secondary: Palette.black,
      tertiary: Palette.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          Palette.primary,
        ),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Palette.white,
      surfaceTintColor: Palette.white,
      shadowColor: Palette.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      fillColor: Palette.scaffoldBackgroundDark,
      filled: true,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyles.displayLarge,
      displayMedium: TextStyles.displayMedium,
      headlineSmall: TextStyles.headlineSmall,
      headlineMedium: TextStyles.headlineMedium,
      headlineLarge: TextStyles.headlineLarge,
      bodySmall: const TextStyle(
        color: Palette.textPrimary,
      ),
      bodyMedium: TextStyles.bodyMedium.apply(
        color: Palette.white.withValues(alpha: .7),
      ),
      bodyLarge: TextStyles.bodyLarge.apply(
        color: Palette.white.withValues(alpha: .8),
      ),
      titleSmall: TextStyles.titleSmall,
      titleMedium: TextStyles.titleMedium,
      titleLarge: TextStyles.titleLarge.apply(
        color: Palette.white.withValues(alpha: .8),
      ),
      labelSmall: TextStyles.labelSmall,
      labelMedium: TextStyles.labelMedium.apply(
        color: Palette.white.withValues(alpha: .6),
      ),
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: Palette.dialogBackgroundDark,
    ),
  );
}
