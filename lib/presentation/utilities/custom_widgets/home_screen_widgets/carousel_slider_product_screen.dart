import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImagesCarouselSlider extends StatefulWidget {
  const ProductImagesCarouselSlider({super.key});

  @override
  State<ProductImagesCarouselSlider> createState() =>
      _ProductImagesCarouselSliderState();
}

class _ProductImagesCarouselSliderState
    extends State<ProductImagesCarouselSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 240.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 7),
              viewportFraction: 1,
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(1)),
                    alignment: Alignment.center,
                    child: Text(
                      'Image $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedSlider,
            builder: (context, value, _) {
              List<Widget> containers = [];
              for (int i = 0; i < 5; i++) {
                containers.add(
                  Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            value == i ? AppColors.primaryColor : Colors.white),
                  ),
                );
              }

              // Return the list of containers from the builder function.
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: containers,
              );
            },
          ),
        )
      ],
    );
  }
}
