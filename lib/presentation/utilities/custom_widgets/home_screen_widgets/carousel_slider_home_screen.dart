import 'package:CraftyBay/data/models/carousel_slider_data_model.dart';
import 'package:CraftyBay/data/models/models_data/carousel_slider_data.dart';
import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<CarouselSliderData> sliders;

  const CustomCarouselSlider({super.key, required this.sliders});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: widget.sliders.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0)),
                  alignment: Alignment.center,
                  child: Stack(children: [
                    Image.network(sliderData.image ?? ''),
                    Positioned(
                        bottom: 0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              sliderData.title ?? "",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ))
                  ]),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        ValueListenableBuilder(
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
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: value == i ? AppColors.primaryColor : null),
                ),
              );
            }

            // Return the list of containers from the builder function.
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: containers,
            );
          },
        )
      ],
    );
  }
}
