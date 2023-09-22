import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesCards extends StatelessWidget {
  const CategoriesCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 9),
          padding: const EdgeInsets.all(17.5),
          decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: const Icon(
            Icons.account_box,
            size: 40,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Electronics",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
