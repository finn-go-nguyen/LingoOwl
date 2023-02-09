import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_parameters/app_parameters.dart';
import 'styles.dart';

class LTheme {
  static const barOverLayStyleLight = SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  );

  static ThemeData light() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: LStyles.lightTextTheme,

        /// ColorScheme
        colorSchemeSeed: Colors.purple,

        appBarTheme: const AppBarTheme(
          // default system app bar icon is white
          systemOverlayStyle: barOverLayStyleLight,
        ),

        /// input
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.zero,
        ),

        /// Button
        buttonTheme: const ButtonThemeData(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              // side: const BorderSide(),
              // shape: const RoundedRectangleBorder(),
              ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(),
        ),
        iconTheme: const IconThemeData(),
      );

  static InputDecorationTheme profileViewFormInputDecoration() =>
      const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: UiParameters.borderRadius,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 20.0,
        ),
      );

  static ElevatedButtonThemeData alertButtonTheme() => ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ));

  static ThemeData dark() => ThemeData.dark(useMaterial3: true);
}
