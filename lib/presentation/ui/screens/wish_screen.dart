import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("WishScreen"),),
      body: const Center(
        child: Text("WishScreen",style: TextStyle(fontSize: 54,color: AppColors.primaryColor),),
      ),
    );
  }
}
