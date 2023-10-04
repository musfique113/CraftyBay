import 'package:CraftyBay/presentation/ui/screens/create_review_screen.dart';
import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:CraftyBay/presentation/utilities/display_review_screen_tile_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayReviewScreen extends StatefulWidget {
  const DisplayReviewScreen({super.key});

  @override
  State<DisplayReviewScreen> createState() => _DisplayReviewScreenState();
}

class _DisplayReviewScreenState extends State<DisplayReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Reviews",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: ProductReviewListTile(),
                      );
                    }),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reviews (1000)",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        Get.to(const CreateReviewScreen());
                      },
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                      backgroundColor: AppColors.primaryColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
