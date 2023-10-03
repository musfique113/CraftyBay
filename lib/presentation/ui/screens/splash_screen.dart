import 'package:CraftyBay/data/models/auth_utility.dart';
import 'package:CraftyBay/presentation/ui/screens/auth_screens/email_verification_screen.dart';
import 'package:CraftyBay/presentation/ui/screens/bottom_nav_bar_screen.dart';
import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:CraftyBay/presentation/utilities/const_string.dart';
import 'package:CraftyBay/presentation/utilities/resources_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToNextScreen();
  }

  // void goToNextScreen() {
  //   Future.delayed(const Duration(seconds: 2)).then((value) async {
  //     final bool isLoggedIn = await AuthUtility.checkIfUserLoggedIn();
  //     print(isLoggedIn);
  //     if (mounted) {
  //       Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => isLoggedIn
  //                 ? const BottomNavbarScreen()
  //                // :  const EmailVerificationScreen()),
  //         : const BottomNavbarScreen()),
  //         (route) => false,
  //       );
  //     }
  //     //Get.offAll(const EmailVerificationScreen());
  //   });
  // }

  Future<void> goToNextScreen() async {
    await AuthController.getAccessToken();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAll(
        () => AuthController.isLoggedIn
            ? const BottomNavbarScreen()
            : const EmailVerificationScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: SvgPicture.asset(ImageAssets.craftyBayLogoSVG),
          ),
          const Spacer(),
          const SpinKitThreeBounce(
            size: 25,
            color: AppColors.primaryColor,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(ConstString.appVersion),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
