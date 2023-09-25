import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:CraftyBay/presentation/utilities/form_validator.dart';
import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final bool _reviewInProgress = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _writeReviewTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Create Review",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: FormValidator.validateName,
                            controller: _firstNameTEController,
                            decoration: const InputDecoration(hintText: "First Name"),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            validator: FormValidator.validateName,
                            controller: _lastNameTEController,
                            decoration: const InputDecoration(hintText: "Last Name"),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            validator: FormValidator.validateName,
                            controller: _writeReviewTEController,
                            maxLines: 10,
                            decoration: const InputDecoration(
                              hintText: "Write Review",
                              contentPadding: EdgeInsets.fromLTRB(10, 12, 12, 20),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Visibility(
                              visible: _reviewInProgress == false,
                              replacement:
                                  const Center(child: CircularProgressIndicator()),
                              child: ElevatedButton(
                                onPressed: () {
                                  _printDataFromField();
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  void _printDataFromField() {
    if (_formKey.currentState!.validate()) {
      String value1 = _firstNameTEController.text;
      String value2 = _lastNameTEController.text;
      String value3 = _writeReviewTEController.text;

      print('Value 1: $value1');
      print('Value 2: $value2');
      print('Value 3: $value3');
    }
  }
}
