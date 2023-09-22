import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class AppLightTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.light,
    // useMaterial3: true,
    primarySwatch:
        MaterialColor(AppColors.primaryColor.value, AppColors().color),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        textStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      disabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    ),
    textTheme: const TextTheme(
        titleSmall: TextStyle(
          fontSize: 24,
          fontFamily: 'Poppins',
          color: Colors.black,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.6,
        ),
        titleLarge: (TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 36,
            fontFamily: 'Poppins',
            letterSpacing: 0.6))),
  );
}
