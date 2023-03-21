import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/fonts.gen.dart';

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
  onSurfaceVariant: ColorName.onSurfaceVariant,
);

double height({
  required int lineHeight,
  required int fontSize,
}) {
  return lineHeight / fontSize;
}

TextStyle _defaultTextStyle = TextStyle(
  fontFamily: FontFamily.gilroyBold,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: _lightColorScheme.onBackground,
);

/// Reference to the application theme.
class GTTheme {
  /// Light theme and its settings.
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.background,
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    primaryColor: _lightColorScheme.primary,
    inputDecorationTheme: InputDecorationTheme(
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: _lightColorScheme.error,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: _lightColorScheme.onSurfaceVariant,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: _lightColorScheme.onSurfaceVariant,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: _lightColorScheme.error,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      hintStyle: TextStyle(
        fontFamily: FontFamily.gilroyMedium,
        fontSize: 14,
        color: ColorName.iconsColor,
        height: height(lineHeight: 17, fontSize: 14),
      ),
    ),
    cardTheme: CardTheme(
      color: _lightColorScheme.surface,
    ),
    textTheme: TextTheme(
      displayMedium: _defaultTextStyle.copyWith(
        fontSize: 42,
        height: height(lineHeight: 53, fontSize: 42),
      ),
      displaySmall: _defaultTextStyle.copyWith(
        fontSize: 30,
        height: height(lineHeight: 38, fontSize: 30),
      ),
      titleLarge: _defaultTextStyle.copyWith(
        fontSize: 26,
        height: height(lineHeight: 33, fontSize: 26),
      ),
      titleMedium: _defaultTextStyle.copyWith(
        fontSize: 18,
        height: height(lineHeight: 22, fontSize: 18),
      ),
      titleSmall: _defaultTextStyle.copyWith(
        fontSize: 16,
        height: height(lineHeight: 20, fontSize: 16),
      ),
      labelLarge: _defaultTextStyle.copyWith(
        fontFamily: FontFamily.gilroyMedium,
        fontSize: 16,
        height: height(lineHeight: 19, fontSize: 16),
      ),
      labelMedium: _defaultTextStyle.copyWith(
        fontFamily: FontFamily.gilroyMedium,
        fontSize: 14,
        height: height(lineHeight: 17, fontSize: 14),
      ),
      labelSmall: _defaultTextStyle.copyWith(
        fontFamily: FontFamily.gilroyMedium,
        fontSize: 13,
        height: height(lineHeight: 16, fontSize: 13),
      ),
      bodyLarge: _defaultTextStyle.copyWith(
        fontSize: 11,
        height: height(lineHeight: 14, fontSize: 11),
      ),
      bodyMedium: _defaultTextStyle.copyWith(
        fontFamily: FontFamily.gilroyMedium,
        fontSize: 11,
        height: height(lineHeight: 17, fontSize: 11),
      ),
      bodySmall: _defaultTextStyle.copyWith(
        fontFamily: FontFamily.gilroyMedium,
        fontSize: 10,
        height: height(lineHeight: 12, fontSize: 10),
      ),
    ),
  );

  /// Dark theme and its settings.
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
