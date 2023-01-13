import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'styles.dart';

class LTheme {
  static const barOverLayStyle = SystemUiOverlayStyle.light;

  static ThemeData light() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: LStyles.lightTextTheme,

        /// ColorScheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),

        appBarTheme: const AppBarTheme(
          // default system app bar icon is white
          systemOverlayStyle: barOverLayStyle,
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

  static ThemeData dark() => ThemeData.dark(useMaterial3: true);
}
