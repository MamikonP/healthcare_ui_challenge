import 'package:flutter/material.dart';

import 'theme_mode/dark_mode_theme.dart';
import 'theme_mode/light_mode_theme.dart';

abstract class AppTheme {
  static AppTheme currentThemeOf(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  ColorScheme get colorScheme;

  Color get background;
  Color get white;
  Color get black;

  /* Primary selection */
  Color get primary800;
  Color get primary700;
  Color get primary600;
  Color get primary500;
  Color get primary400;
  Color get primary300;
  Color get primary200;
  Color get primary100;
  Color get primary50;

  /* Gray selection */
  Color get gray900;
  Color get gray500;
  Color get gray400;
  Color get gray300;
  Color get gray200;
  Color get gray100;
  Color get gray50;

  /* Typograhpy selection */
  Color get typography900;
  Color get typography700;
  Color get typography600;
  Color get typography500;
  Color get typography400;
  Color get typography300;

  /* Success selection */
  Color get success500;
  Color get success200;
  Color get success100;
  Color get success50;

  /* Info selection */
  Color get info500;

  /* Warning selection */
  Color get warning500;
  Color get warning400;
  Color get warning200;
  Color get warning50;

  /* Danger selection */
  Color get danger500;
  Color get danger200;
  Color get danger100;
  Color get danger50;

  TextStyle get title1 => TextStyle(
        color: typography900,
        fontWeight: AppTextFontWeight.bold.fontWeight,
        fontSize: 24,
      );

  TextStyle get title2 => TextStyle(
        color: typography900,
        fontWeight: AppTextFontWeight.bold.fontWeight,
        fontSize: 20,
      );

  TextStyle get title3 => TextStyle(
        color: typography900,
        fontWeight: AppTextFontWeight.bold.fontWeight,
        fontSize: 16,
      );

  TextStyle get subtitle1 => TextStyle(
        color: typography900,
        fontWeight: AppTextFontWeight.bold.fontWeight,
        fontSize: 14,
      );

  TextStyle get regular1 => TextStyle(
        color: typography700,
        fontWeight: AppTextFontWeight.medium.fontWeight,
        fontSize: 14,
      );

  TextStyle get regular2 => TextStyle(
        color: typography900,
        fontWeight: AppTextFontWeight.medium.fontWeight,
        fontSize: 12,
      );
}

enum AppTextFontWeight {
  thin,
  extraLight,
  light,
  normal,
  medium,
  semiBold,
  bold,
  extraBold,
  black,
}

extension AppTextFontWeightValues on AppTextFontWeight {
  FontWeight get fontWeight {
    switch (this) {
      case AppTextFontWeight.thin:
        return FontWeight.w100;
      case AppTextFontWeight.extraLight:
        return FontWeight.w200;
      case AppTextFontWeight.light:
        return FontWeight.w300;
      case AppTextFontWeight.normal:
        return FontWeight.w400;
      case AppTextFontWeight.medium:
        return FontWeight.w500;
      case AppTextFontWeight.semiBold:
        return FontWeight.w600;
      case AppTextFontWeight.bold:
        return FontWeight.w700;
      case AppTextFontWeight.extraBold:
        return FontWeight.w800;
      case AppTextFontWeight.black:
        return FontWeight.w900;
    }
  }
}

class AppThemeData {
  DarkModeTheme get darkMode => DarkModeTheme();
  LightModeTheme get lightMode => LightModeTheme();

  ThemeData get darkTheme => ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
      scaffoldBackgroundColor: darkMode.background,
      colorScheme: darkMode.colorScheme,
      fontFamily: 'Manrope',
      cardTheme: CardTheme(
        surfaceTintColor: Colors.transparent,
        color: lightMode.background,
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        color: darkMode.background,
        elevation: 1,
        shadowColor: lightMode.gray50,
        titleTextStyle: TextStyle(
          color: darkMode.typography900,
          fontWeight: AppTextFontWeight.bold.fontWeight,
        ),
      ),
      useMaterial3: true);

  ThemeData get lightTheme => ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
      scaffoldBackgroundColor: lightMode.background,
      colorScheme: lightMode.colorScheme,
      cardTheme: CardTheme(
        surfaceTintColor: Colors.transparent,
        color: lightMode.background,
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        color: lightMode.background,
        elevation: 1,
        shadowColor: lightMode.gray50,
        titleTextStyle: TextStyle(
          color: darkMode.typography900,
          fontWeight: AppTextFontWeight.bold.fontWeight,
        ),
      ),
      fontFamily: 'Manrope',
      useMaterial3: true);
}
