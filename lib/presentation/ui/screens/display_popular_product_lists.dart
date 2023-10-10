import 'package:CraftyBay/presentation/utilities/custom_widgets/home_screen_widgets/products_card_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayPopularProductListScreen extends StatefulWidget {
  const DisplayPopularProductListScreen({super.key});

  @override
  State<DisplayPopularProductListScreen> createState() =>
      _DisplayPopularProductListScreenState();
}

class _DisplayPopularProductListScreenState
    extends State<DisplayPopularProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Popular Items",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(1.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return const FittedBox(
                    // child: ProductsCard()
                );
              }),
        ));
  }
}
