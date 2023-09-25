
import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/custom_stepper.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 80,
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://c.static-nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/g1ljiszo4qhthfpluzbt/123-joyride-cdp-apla-xa-xp.jpg"),
                )),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "New Bata Show fdsfjig sdiuwg",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.fade),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54),
                                  children: [
                                    TextSpan(text: "Color: Black"),
                                    TextSpan(text: "Size: L"),
                                  ]),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_outline))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "\$100",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      CustomStepper(
                          lowerLimit: 1,
                          upperLimit: 10,
                          stepValue: 1,
                          value: 1,
                          onChange: (int value) {
                            return value;
                          })
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}