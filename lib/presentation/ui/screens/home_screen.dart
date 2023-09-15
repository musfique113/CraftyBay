import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:CraftyBay/presentation/utilities/custom_widgets/circular_icon_button.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
