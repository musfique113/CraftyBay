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
            fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor)),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      disabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    ),
  );
}
