import 'package:flutter/material.dart';

import 'package:gotour_app/gen/colors.gen.dart';
import 'package:gotour_app/gen/fonts.gen.dart';

ColorScheme _lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: ColorName.primaryColor,
  onPrimary: ColorName.onPrimaryColor,
  secondary: ColorName.secondaryColor,
  onSecondary: ColorName.onSecondaryColor,
  error: ColorName.errorColor,
  onError: ColorName.onErrorColor,
  background: ColorName.backgroundColor,
  onBackground: ColorName.onBackgroundColor,
  surface: ColorName.surfaceColor,
  onSurface: ColorName.onSurfaceColor,
);

/// Reference to the application theme.
class GTTheme {
  static FontWeight fontWeightBold = FontWeight.w700;
  static FontWeight fontWeightMedium = FontWeight.w400;

  static TextStyle _defaultTextStyle({
    required double fontSize,
    required FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: FontFamily.gilroy,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorName.textColor,
    );
  }

  /// Light theme and its settings.
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _lightColorScheme.primary,
      onPrimary: _lightColorScheme.onPrimary,
      secondary: _lightColorScheme.secondary,
      onSecondary: _lightColorScheme.onSecondary,
      error: _lightColorScheme.error,
      onError: _lightColorScheme.onError,
      background: _lightColorScheme.background,
      onBackground: _lightColorScheme.onBackground,
      surface: _lightColorScheme.surface,
      onSurface: _lightColorScheme.onSurface,
    ),
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.background,
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    primaryColor: _lightColorScheme.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll<Color>(_lightColorScheme.primary),
        textStyle: MaterialStatePropertyAll<TextStyle>(
          _defaultTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: _lightColorScheme.surface,
    ),
    textTheme: TextTheme(
      displayMedium: _defaultTextStyle(
        fontSize: 42,
        fontWeight: fontWeightBold,
      ),
      displaySmall: _defaultTextStyle(
        fontSize: 30,
        fontWeight: fontWeightBold,
      ),
      titleLarge: _defaultTextStyle(
        fontSize: 26,
        fontWeight: fontWeightBold,
      ),
      titleMedium: _defaultTextStyle(
        fontSize: 18,
        fontWeight: fontWeightBold,
      ),
      titleSmall: _defaultTextStyle(
        fontSize: 16,
        fontWeight: fontWeightBold,
      ),
      labelMedium: _defaultTextStyle(
        fontSize: 16,
        fontWeight: fontWeightMedium,
      ),
      labelSmall: _defaultTextStyle(
        fontSize: 14,
        fontWeight: fontWeightBold,
      ),
      bodyLarge: _defaultTextStyle(
        fontSize: 13,
        fontWeight: fontWeightMedium,
      ),
      bodyMedium: _defaultTextStyle(
        fontSize: 11,
        fontWeight: fontWeightMedium,
      ),
      bodySmall: _defaultTextStyle(
        fontSize: 10,
        fontWeight: fontWeightMedium,
      ),
    ),
  );

  /// Dark theme and its settings.
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
