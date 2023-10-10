import 'package:CraftyBay/data/models/category_list_model.dart';
import 'package:CraftyBay/data/models/models_data/category_list_model_data.dart';
import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesCards extends StatelessWidget {
  CategoriesCards({
    super.key, required this.categoryListModelData,
  });

  final CategoryListModelData categoryListModelData ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 9),
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: Image.network(categoryListModelData.categoryImg ?? " "),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          categoryListModelData.categoryName ?? "",
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
