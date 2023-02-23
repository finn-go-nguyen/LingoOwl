import 'package:flutter/material.dart';

class LColors {
  static const primary = Color(0xFFBF360C);
  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  static const loading = Color.fromARGB(255, 224, 224, 224);

  static const unratedColor = Color.fromARGB(255, 224, 224, 224);

  static const rating = Colors.orange;
  static const strikeThrough = Colors.black54;
  static const videoDimBackground = Color.fromARGB(125, 0, 0, 0);
  static const videoProgressBarBackground = Color.fromARGB(50, 255, 255, 255);
  static const videoProgressBarBuffer = Color.fromARGB(50, 255, 255, 255);
  static const videoPlayerBackground = Colors.black;
}
