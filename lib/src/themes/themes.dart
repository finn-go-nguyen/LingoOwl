import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_parameters/app_parameters.dart';

class LTheme {
  static final _fontFamily = GoogleFonts.poppins().fontFamily;
  static const _scheme = FlexScheme.deepOrangeM3;

  static ThemeData get light => FlexThemeData.light(
        appBarElevation: 0.5,
        scheme: _scheme,
        useMaterial3: true,
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: _fontFamily,
        subThemesData: subThemesData,
      );

  static ThemeData get dark => FlexThemeData.dark(
        appBarElevation: 2,
        scheme: _scheme,
        useMaterial3: true,
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        fontFamily: _fontFamily,
        subThemesData: subThemesData,
      );

  static FlexSubThemesData get subThemesData => const FlexSubThemesData(
        inputDecoratorBorderType: FlexInputBorderType.underline,
        segmentedButtonSchemeColor: SchemeColor.inversePrimary,
      );

  static InputDecorationTheme get profileViewFormInputDecoration =>
      const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: UiParameters.borderRadius,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 20.0,
        ),
      );

  static get barOverLayStyleLight => SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor:
            FlexColor.deepOrangeM3LightPrimary.withOpacity(.09),
      );
}
