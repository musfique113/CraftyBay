import 'package:CraftyBay/data/models/auth_utility.dart';
import 'package:CraftyBay/presentation/state_holders/carousel_slider_controller.dart';
import 'package:CraftyBay/presentation/state_holders/category_list_controller.dart';
import 'package:CraftyBay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:CraftyBay/presentation/state_holders/popular_products_controller.dart';
import 'package:CraftyBay/presentation/ui/screens/auth_screens/email_verification_screen.dart';
import 'package:CraftyBay/presentation/ui/screens/display_popular_product_lists.dart';
import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/categories_cards.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/circular_icon_button_app_bar.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/home_screen_widgets/carousel_slider_home_screen.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/home_screen_widgets/products_card_widgets.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/home_screen_widgets/section_title_home_screen.dart';
import 'package:CraftyBay/presentation/utilities/resources_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.craftyBayLogoAppbarSVG),
            const Spacer(),
            CircularIconButton(
              iconData: Icons.person,
              onTap: () {
                print("button person pressed");
              },
            ),
            const SizedBox(width: 10),
            CircularIconButton(
              iconData: Icons.phone_in_talk_outlined,
              onTap: () {
                print("button phone pressed");
              },
            ),
            const SizedBox(width: 10),
            CircularIconButton(
              iconData: Icons.add_alert_outlined,
              onTap: () {
                print("button alert pressed");
              },
            ),
            const SizedBox(width: 10),
            CircularIconButton(
              iconData: Icons.logout,
              onTap: () {
                gotoLogin();
                print("log out");
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none)),
                style: const TextStyle(
                    fontSize: 20, color: AppColors.primaryColor),
              ),

              GetBuilder<CarouselSlidersController>(
                  builder: (homeSliderController) {
                if (homeSliderController.getCarouselSlidersInProgress) {
                  return const SizedBox(
                    height: 180.0,
                    child: Center(
                      child: SpinKitCircle(
                        color: Colors.cyan,
                        size: 50,
                      ),
                    ),
                  );
                }
                return CustomCarouselSlider(
                  sliders:
                      homeSliderController.carouselSliderDataModel.data ?? [],
                );
              }),
              SectionTitle(
                  title: "Categories",
                  onTap: () {
                    Get.find<MainBottomNavController>().changeScreen(1);
                  }),
              SizedBox(
                height: 110,
                child: GetBuilder<CategoryListController>(
                  builder: (categoryController) {
                    if (categoryController.getCategoryListInProgress) {
                      return const SizedBox(
                        height: 90,
                        child: Center(
                          child: SpinKitCircle(
                            color: Colors.cyan,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: categoryController.categoryListModel.data?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoriesCards(categoryListModelData: categoryController.categoryListModel.data![index],);
                      },
                    );
                  }
                ),
              ),
              SectionTitle(
                  title: "Popular",
                  onTap: () {
                    Get.to(const DisplayPopularProductListScreen());
                  }),
              GetBuilder<PopularProductController>(
                builder: (popularProductController) {
                  return SizedBox(
                    height: 165,
                    child: ListView.builder(
                        itemCount: popularProductController.popularProductModel.data?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return  ProductsCard(product: popularProductController.popularProductModel.data![index],);
                        }),
                  );
                }
              ),
              SectionTitle(
                  title: "Special",
                  onTap: () {
                    Get.to(const DisplayPopularProductListScreen());
                  }),
              SizedBox(
                height: 165,
                child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                    //  return const ProductsCard();
                    }),
              ),
              SectionTitle(
                  title: "New",
                  onTap: () {
                    Get.to(const DisplayPopularProductListScreen());
                  }),
              SizedBox(
                height: 165,
                child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                    //  return ProductsCard(product: null,);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> gotoLogin() async {
  await AuthController.clearUserInfo();
  Get.to(const EmailVerificationScreen());
}
