import 'package:CraftyBay/presentation/utilities/custom_widgets/custom_stepper.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/home_screen_widgets/carousel_slider_product_screen.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              const ProductImagesCarouselSlider(),
              AppBar(
                title: const Text(
                  "Product Details",
                  style: TextStyle(color: Colors.black54),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: const BackButton(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                  "Adidas shoe sdfs dsfsadgs vsdgsa asdgewgfdsf sdfgsdgr ytjtyu",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                Row(
                  children: [
                    CustomStepper(
                      lowerLimit: 1,
                      upperLimit: 10,
                      stepValue: 1,
                      value: 1,
                      onChange: (newValue) {
                        print(newValue);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
