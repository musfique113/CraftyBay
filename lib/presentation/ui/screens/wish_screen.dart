import 'package:CraftyBay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/home_screen_widgets/products_card_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                "Wish List",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              leading: IconButton(
                onPressed: () {
                  Get.find<MainBottomNavController>().backToHome();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              )),
          body: Padding(
            padding: const EdgeInsets.all(1.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return FittedBox(child: const ProductsCard());
                }),
          )),
    );
  }
}
