import 'package:flutter/material.dart';

import '../app_theme.dart';

class LightModeTheme extends AppTheme {
  @override
  ColorScheme get colorScheme => ColorScheme(
        brightness: Brightness.light,
        primary: primary800,
        onPrimary: white,
        secondary: primary50,
        onSecondary: primary500,
        background: background,
        onBackground: black,
        error: danger500,
        onError: white,
        surface: gray200,
        onSurface: black,
      );

  @override
  Color get background => const Color(0xffFFFFFF);

  @override
  Color get white => const Color(0xffFFFFFF);

  @override
  Color get black => const Color(0xff000000);

  @override
  Color get danger100 => const Color(0xffFCE5E2);

  @override
  Color get danger200 => const Color(0xffFACFCB);

  @override
  Color get danger50 => const Color(0xffFCF3F1);

  @override
  Color get danger500 => const Color(0xffE6503B);

  @override
  Color get gray100 => const Color(0xffF3F4F6);

  @override
  Color get gray200 => const Color(0xffE4E6EA);

  @override
  Color get gray300 => const Color(0xffD3D6DB);

  @override
  Color get gray400 => const Color(0xff9EA3AD);

  @override
  Color get gray50 => const Color(0xffF9FAFB);

  @override
  Color get gray500 => const Color(0xff6D737F);

  @override
  Color get gray900 => const Color(0xff111927);

  @override
  Color get info500 => const Color(0xff3A8CF7);

  @override
  Color get primary100 => const Color(0xffC6D4F0);

  @override
  Color get primary200 => const Color(0xffA2B5E8);

  @override
  Color get primary300 => const Color(0xff7A95E2);

  @override
  Color get primary400 => const Color(0xff5070DC);

  @override
  Color get primary50 => const Color(0xffF7F3FD);

  @override
  Color get primary500 => const Color(0xff224BD8);

  @override
  Color get primary600 => const Color(0xff1F42BC);

  @override
  Color get primary700 => const Color(0xff1A39A2);

  @override
  Color get primary800 => const Color(0xff172F85);

  @override
  Color get success100 => const Color(0xffD7F7E0);

  @override
  Color get success200 => const Color(0xffB3EFC6);

  @override
  Color get success50 => const Color(0xffEFFCF3);

  @override
  Color get success500 => const Color(0xff41B168);

  @override
  Color get typography300 => const Color(0xffD4D4D8);

  @override
  Color get typography400 => const Color(0xffA1A1AA);

  @override
  Color get typography500 => const Color(0xff71717A);

  @override
  Color get typography600 => const Color(0xff52525B);

  @override
  Color get typography700 => const Color(0xff3F3F46);

  @override
  Color get typography900 => const Color(0xff00001B);

  @override
  Color get warning200 => const Color(0xffF7DCB1);

  @override
  Color get warning400 => const Color(0xffEB8C49);

  @override
  Color get warning50 => const Color(0xffFEF7EF);

  @override
  Color get warning500 => const Color(0xffE77028);
}
