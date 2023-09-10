
import 'package:CraftyBay/presentation/ui/screens/splash_screen.dart';
import 'package:CraftyBay/presentation/utilities/theme_data/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Crafty Bay',
        debugShowCheckedModeBanner: false,
        theme: AppLightTheme.lightTheme,
        home: const SplashScreen());
  }
}