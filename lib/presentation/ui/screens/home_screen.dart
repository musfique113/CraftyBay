import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("HomeScreen"),),
      body: const Center(
        child: Text("HomeScreen",style: TextStyle(fontSize: 54,color: AppColors.primaryColor),),
      ),
    );
  }
}

