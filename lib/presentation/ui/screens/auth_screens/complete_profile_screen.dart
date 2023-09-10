import 'package:CraftyBay/presentation/ui/screens/bottom_nav_bar_screen.dart';
import 'package:CraftyBay/presentation/ui/screens/home.dart';
import 'package:CraftyBay/presentation/utilities/const_string.dart';
import 'package:CraftyBay/presentation/utilities/form_validator.dart';
import 'package:CraftyBay/presentation/utilities/resources_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //todo: remove the text from controller
  final TextEditingController _firstNameTEController =
      TextEditingController(text: "First Name");
  final TextEditingController _lastNameTEController =
      TextEditingController(text: "Last Name");
  final TextEditingController _mobileTEController =
      TextEditingController(text: "01533754180");
  final TextEditingController _cityTEController =
      TextEditingController(text: "Mirpur");
  final TextEditingController _shippingAddressTEController =
      TextEditingController(text: "Shipping Address");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
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
                    ConstString.completeProfile,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  const Text(
                    ConstString.getStarted,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "First Name",
                    ),
                    validator: FormValidator.validateName,
                    controller: _firstNameTEController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Last Name",
                    ),
                    validator: FormValidator.validateName,
                    controller: _lastNameTEController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Mobile",
                    ),
                    validator: FormValidator.validateMobileNumber,
                    controller: _mobileTEController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "City",
                    ),
                    validator: FormValidator.validateName,
                    controller: _cityTEController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Shipping Address",
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: FormValidator.validateName,
                    controller: _shippingAddressTEController,
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            _submitForm();
                          },
                          child: const Text("Complete")))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final fname = _firstNameTEController.text;
      final Lname = _lastNameTEController.text;
      final mob = _mobileTEController.text;
      final city = _cityTEController.text;
      final sAdd = _shippingAddressTEController.text;
      print('First Name submitted: $fname');
      print('Last name submitted: $Lname');
      print('Mobile submitted: $mob');
      print('City submitted: $city');
      print('ShippingADDRESS submitted: $sAdd');
      //Get.offAll(const CompleteProfileScreen());
      Get.to(const BottomNavbarScreen());
    }
  }
}
