import 'package:CraftyBay/presentation/state_holders/email_verification_controller.dart';
import 'package:CraftyBay/presentation/ui/screens/auth_screens/otp_verification_screen.dart';
import 'package:CraftyBay/presentation/utilities/const_string.dart';
import 'package:CraftyBay/presentation/utilities/form_validator.dart';
import 'package:CraftyBay/presentation/utilities/resources_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //todo: remove the text from controller
  final TextEditingController _emailTEController =
      TextEditingController(text: "musfique113@gmail.com");

  Future<void> verifyEmail(EmailVerificationController controller) async {
    final responseIsSuccess =
        await controller.verifyEmail(_emailTEController.text.trim());
    if (responseIsSuccess) {
      Get.to(
          () => OTPVerificationScreen(email: _emailTEController.text.trim()));
    } else {
      if (mounted) {
        Get.snackbar(
          "Error !",
          "Email Verification failed!!",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          borderRadius: 10.0,
          margin: const EdgeInsets.all(10.0),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
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
                    ConstString.welcomeBack,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    ConstString.enterYourEmail,
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter your email",
                    ),
                    validator: FormValidator.validateEmail,
                    controller: _emailTEController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: GetBuilder<EmailVerificationController>(
                          builder: (controller) {
                        if (controller.emailVerificationInProgress) {
                          return const Center(
                              child: CircularProgressIndicator(),);
                        }
                        return ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                verifyEmail(controller);
                              }
                            },
                            child: const Text("Next"));
                      }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
