import 'package:CraftyBay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:CraftyBay/presentation/ui/screens/categories_list_screen.dart';
import 'package:CraftyBay/presentation/ui/screens/cart_screen.dart';
import 'package:CraftyBay/presentation/ui/screens/home_screen.dart';
import 'package:CraftyBay/presentation/ui/screens/wish_screen.dart';
import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const WishScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (context) {
        return Scaffold(
          body: _screens[context.currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: context.currentSelectedIndex,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            showUnselectedLabels: true,
            selectedItemColor: AppColors.primaryColor,
            onTap: context.changeScreen,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.widgets_sharp), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard_outlined), label: 'Wish'),
            ],
          ),
        );
      }
    );
  }
}
