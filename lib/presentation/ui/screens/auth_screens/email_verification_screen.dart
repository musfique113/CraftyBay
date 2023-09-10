import 'package:CraftyBay/data/models/network_response.dart';
import 'package:CraftyBay/data/services/network_caller.dart';
import 'package:CraftyBay/data/utils/urls.dart';
import 'package:CraftyBay/presentation/ui/screens/auth_screens/otp_verification_screen.dart';
import 'package:CraftyBay/presentation/utilities/const_string.dart';
import 'package:CraftyBay/presentation/utilities/form_validator.dart';
import 'package:CraftyBay/presentation/utilities/resources_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //todo: remove the text from controller
  final TextEditingController _emailTEController = TextEditingController(text: "musfique113@gmail.com");
  bool _emailVerficationInProgress = false;

  Future<void> sendOTPTOEmail() async {
    if (_formKey.currentState!.validate()) {
      _emailVerficationInProgress = true;
      if (mounted) {
        setState(() {});
      }
      final NetworkResponse response = await NetworkCaller()
          .getRequest(Urls.sendOtpToEmail(_emailTEController.text.trim()));
      _emailVerficationInProgress = false;
      if (mounted) {
        setState(() {});
      }
      if (response.isSuccess) {
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPlVerificationScreen(
                email: _emailTEController.text.trim(),
              ),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email verification has failed!')),
          );
        }
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
                      child: Visibility(
                        visible: _emailVerficationInProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              sendOTPTOEmail();
                            },
                            child: const Text("Next")),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     final email = _emailTEController.text;
  //     print('Email submitted: $email');
  //     Get.to(OTPlVerificationScreen());
  //     //Get.offAll(const OTPlVerificationScreen());
  //   }
  // }
}
