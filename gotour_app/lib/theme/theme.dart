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
);

/// Reference to the application theme.
class GTTheme {
  static TextStyle _defaultTextStyle() {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: ColorName.textColor,
    );
  }

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
    textButtonTheme: TextButtonThemeData(style: ButtonStyle()),
    cardTheme: CardTheme(
      color: _lightColorScheme.surface,
    ),
    textTheme: TextTheme(
      displayMedium: _defaultTextStyle().copyWith(
        fontFamily: FontFamily.gilroyBold,
        fontSize: 42,
      ),
      displaySmall: _defaultTextStyle().copyWith(
        fontFamily: FontFamily.gilroyBold,
        fontSize: 30,
      ),
      titleLarge: _defaultTextStyle().copyWith(
        fontFamily: FontFamily.gilroyBold,
        fontSize: 26,
      ),
      titleMedium: _defaultTextStyle().copyWith(
        fontFamily: FontFamily.gilroyBold,
        fontSize: 18,
      ),
      titleSmall: _defaultTextStyle().copyWith(
        fontFamily: FontFamily.gilroyBold,
        fontSize: 16,
      ),
      labelMedium: _defaultTextStyle().copyWith(
        fontFamily: FontFamily.gilroyMedium,
        fontSize: 16,
      ),
      labelSmall: _defaultTextStyle().copyWith(
        fontFamily: FontFamily.gilroyBold,
        fontSize: 14,
      ),
      bodyLarge: _defaultTextStyle().copyWith(
        fontFamily: FontFamily.gilroyMedium,
        fontSize: 13,
      ),
      bodyMedium: _defaultTextStyle().copyWith(
        fontFamily: FontFamily.gilroyMedium,
        fontSize: 11,
      ),
      bodySmall: _defaultTextStyle().copyWith(
        fontFamily: FontFamily.gilroyMedium,
        fontSize: 10,
      ),
    ),
  );

  /// Dark theme and its settings.
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
