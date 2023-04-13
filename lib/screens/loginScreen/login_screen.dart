import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/MyTextFromField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget buildTopPart() {
    return Column(
      children: [Image.asset("images/Logo.png",
      height: 150,
      ),
      Column(
        children: [
          MyTextFromField(
            hintText: "Email",
            obscureText: false,
          ),
          MyTextFromField(
            hintText: "Password",
            obscureText: true,
          ),
        ],
      )],
    );
  } 

  
  // comment from windows and linux merged
  // this is a second commit from linux , this will merge with master

// this is for logo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [buildTopPart()],
            )
          ],
        ),
      )),
    );
  }
}
