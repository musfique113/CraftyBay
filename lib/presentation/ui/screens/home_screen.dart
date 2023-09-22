import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/categories_cards.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/circular_icon_button_app_bar.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/home_screen_widgets/carousel_slider_home_screen.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/home_screen_widgets/section_title_home_screen.dart';
import 'package:CraftyBay/presentation/utilities/resources_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              const CustomCarouselSlider(),
              SectionTitle(title: "Categories", onTap: () {}),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const CategoriesCards();
                  },
                ),
              ),
              SectionTitle(title: "Popular", onTap: () {}),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                child: SizedBox(
                  width: 150,
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(7),
                                topRight: Radius.circular(7)),
                            color: AppColors.primaryColor.withOpacity(0.1),
                            image: const DecorationImage(
                                image: AssetImage(ImageAssets.nikeShoePNG))),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 2, 8, 0),
                        child: Text(
                          "Nike Shoe dsfdsGF ASDGFEW SDFWEgsasdS",
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 8, 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$1000",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                              Icon(
                                Icons.star,
                                size: 21,
                                color: Colors.amber,
                              ),
                              Text(
                                "4.5",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis),
                              )
                            ]),
                            Card(
                                color: AppColors.primaryColor,
                                child: Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
