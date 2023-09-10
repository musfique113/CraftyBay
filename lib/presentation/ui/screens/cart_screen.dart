import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Cart"),),
      body: const Center(
        child: Text("Cart screen",style: TextStyle(fontSize: 54,color: AppColors.primaryColor),),
      ),
    );
  }
}
