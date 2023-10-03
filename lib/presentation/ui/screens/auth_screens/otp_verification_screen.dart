import 'dart:async';

import 'package:CraftyBay/presentation/state_holders/email_verification_controller.dart';
import 'package:CraftyBay/presentation/state_holders/otp_verification_controller.dart';
import 'package:CraftyBay/presentation/ui/screens/bottom_nav_bar_screen.dart';
import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:CraftyBay/presentation/utilities/const_string.dart';
import 'package:CraftyBay/presentation/utilities/form_validator.dart';
import 'package:CraftyBay/presentation/utilities/resources_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;

  const OTPVerificationScreen({super.key, required this.email});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpTEController =
      TextEditingController(text: "1234");

  //TODO: set the countdown to 120
  int _countdown = 120;
  late Timer _timer;
  bool _otpVerificationInProgress = false;

  Future<void> verifyOtp(OtpVerificationController controller) async {
    final response =
        await controller.verifyOtp(widget.email, _otpTEController.text.trim());
    if (response) {
      Get.offAll(() => const BottomNavbarScreen());
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Otp verification failed! Try again'),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Center(
                  child: SvgPicture.asset(
                    ImageAssets.craftyBayLogoSVG,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  ConstString.enterOTP,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  ConstString.otpSent,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 24,
                ),
                Form(
                  key: _formKey,
                  child: PinCodeTextField(
                    length: 4,
                    validator: FormValidator.validateOTP,
                    obscureText: false,
                    controller: _otpTEController,
                    animationType: AnimationType.fade,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.primaryColor,
                      selectedColor: Colors.green,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<OtpVerificationController>(builder: (controller) {
                  return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: _otpVerificationInProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              print("Email ${widget.email}");
                              print("OTP $_otpTEController");
                              verifyOtp(controller);
                            },
                            child: const Text("Next")),
                      ));
                }),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      const TextSpan(text: 'This code will expire in '),
                      TextSpan(
                        text: '$_countdown s',
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: _countdown > 0 ? null : _resendCode,
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  child: Text(
                    _countdown > 0 ? ' ' : 'Resend Code',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _resendCode() async {
    EmailVerificationController emailController = EmailVerificationController();
    bool verificationSuccess = await emailController.verifyEmail(widget.email);

    // Check if the verification was successful
    if (verificationSuccess) {
      // Reset the countdown to 120 seconds
      _countdown = 120;
      _startCountdown();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to resend verification code. Try again.'),
        ),
      );
    }
  }

}
