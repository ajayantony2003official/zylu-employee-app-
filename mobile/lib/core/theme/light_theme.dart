import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: Colors.white,

    primaryColor: Colors.white, // dark primary

    colorScheme: const ColorScheme.light(
      primary: Colors.white, // dark purple/blue
      secondary: Colors.white, // accent
      surface: Colors.white,
      error: Colors.red,
    ),

    // : Color(0xFF101E2C)

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),

    iconTheme: const IconThemeData(color: Colors.black),

    useMaterial3: true,
  );
}
