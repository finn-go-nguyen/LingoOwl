import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LStyles {
  static const headline1 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 96,
    letterSpacing: -1.5,
  );

  static const headline2 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 60,
    letterSpacing: -0.5,
  );

  static const headline3 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 48,
    letterSpacing: 0,
  );

  static const headline4 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 34,
    letterSpacing: 0.25,
  );

  static const headline5 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    letterSpacing: 0,
  );

  static const headline6 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    letterSpacing: 0.15,
  );

  static const subtitle1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.15,
  );

  static const subtitle2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 0.1,
  );

  static const body1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.5,
  );

  static const body2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.25,
  );

  static const button = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 1.25,
  );

  static const caption = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.4,
  );

  static const overline = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    letterSpacing: 1.5,
  );

  static final lightTextTheme = GoogleFonts.poppinsTextTheme(TextTheme(
    headline1: headline1,
    headline2: headline2,
    headline3: headline3.copyWith(color: Colors.black),
    headline4: headline4.copyWith(color: Colors.black),
    headline5: headline5,
    headline6: headline6,
    subtitle1: subtitle1,
    subtitle2: subtitle2,
    bodyText1: body1,
    bodyText2: body2,
    button: button,
    caption: caption,
    overline: overline,
  ));
}
