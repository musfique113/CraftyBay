import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:CraftyBay/presentation/utilities/const_string.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/custom_stepper.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/home_screen_widgets/carousel_slider_product_screen.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/product_size_picker_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colorsList = [
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
  ];

  int _selectedColorIndex = 0;

  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  int _selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          productDetailsAppBar,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                    Row(
                      children: [
                        const Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.amber,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'REVIEW',
                            style: TextStyle(
                                fontSize: 13,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Card(
                          color: AppColors.primaryColor,
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_border,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Text(
                      "Color",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 25,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: colorsList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              _selectedColorIndex = index;
                              if (mounted) {
                                setState(() {});
                              }
                            },
                            child: CircleAvatar(
                              backgroundColor: colorsList[index],
                              child: _selectedColorIndex == index
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 4,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      "Size",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 25,
                      child: ProductSizePicker(
                          sizes: sizes,
                          onSelected: (int selectIndex) {
                            _selectedSizeIndex = selectIndex;
                          },
                          initialSelected: 0),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(ConstString.dummyText)
                  ],
                ),
              ),
            ),
          ),
          addToCartButtonContainer,
        ],
      ),
    ));
  }

  Stack get productDetailsAppBar {
    return Stack(
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
    );
  }

  Container get addToCartButtonContainer {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Price"),
              Text("\$204",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor)),
            ],
          ),
          SizedBox(
              width: 120,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Add to Cart",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  )))
        ],
      ),
    );
  }
}

// class ProductSizePicker extends StatefulWidget {
//   const ProductSizePicker(
//       {super.key,
//       required this.sizes,
//       required this.onSelected,
//       required this.initialSelected});
//
//   final List<String> sizes;
//   final Function(int selectedIndex) onSelected;
//   final int initialSelected;
//
//   @override
//   State<ProductSizePicker> createState() => _ProductSizePickerState();
// }
//
// class _ProductSizePickerState extends State<ProductSizePicker> {
//   int _selectedSizeIndex = 0;
//
//   @override
//   void initState() {
//     _selectedSizeIndex = widget.initialSelected;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       scrollDirection: Axis.horizontal,
//       itemCount: widget.sizes.length,
//       itemBuilder: (context, index) {
//         return InkWell(
//           borderRadius: BorderRadius.circular(10),
//           onTap: () {
//             _selectedSizeIndex = index;
//             if (mounted) {
//               setState(() {});
//             }
//           },
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             decoration: BoxDecoration(
//               color:
//                   _selectedSizeIndex == index ? AppColors.primaryColor : null,
//               borderRadius: BorderRadius.circular(7),
//               border: Border.all(color: Colors.grey),
//             ),
//             alignment: Alignment.center,
//             child: Text(
//               widget.sizes[index],
//               style: TextStyle(
//                   color: _selectedSizeIndex == index ? Colors.white : null),
//             ),
//           ),
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) {
//         return const SizedBox(
//           width: 4,
//         );
//       },
//     );
//   }
// }
