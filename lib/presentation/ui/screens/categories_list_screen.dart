import 'package:CraftyBay/presentation/state_holders/category_list_controller.dart';
import 'package:CraftyBay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/categories_cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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
                "All Categories",
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
            padding: const EdgeInsets.all(4.0),
            child: GetBuilder<CategoryListController>(
              builder: (categoryController) {
                return GridView.builder(
                  itemCount: categoryController.categoryListModel.data?.length ?? 0,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(child: CategoriesCards(categoryListModelData: categoryController.categoryListModel.data![index],));
                    });
              }
            ),
          )),
    );
  }
}
