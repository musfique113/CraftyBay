import 'dart:ffi';

import 'package:ecommerceyt/appColors/appColors.dart';
import 'package:ecommerceyt/stylies/loginScreenStylies.dart';
import 'package:ecommerceyt/widgets/MyButtonWidgets.dart';
import 'package:ecommerceyt/stylies/loginScreenStylies.dart';
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
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MyButtonWidgets(
              text: "Login",
              color: AppColors.baseBlackColor,
              onPress: (){},
              ) 
            ),
            const SizedBox(
              width: 20,
             ),
             Expanded(child: MyButtonWidgets(
              text: "Sign up",
              color: AppColors.baseDarkPinkColor,
              onPress: (){},
              ) 
            )
          ],
        ),
      )
      ]
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
