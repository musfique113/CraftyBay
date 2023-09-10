import 'package:CraftyBay/presentation/ui/screens/auth_screens/categories_screen.dart';
import 'package:CraftyBay/presentation/ui/screens/cart_screen.dart';
import 'package:CraftyBay/presentation/ui/screens/home.dart';
import 'package:CraftyBay/presentation/ui/screens/wish_screen.dart';
import 'package:CraftyBay/presentation/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishScreen()
  ];

  @override
  Widget build(BuildContext context) {
    print(_selectedScreenIndex);
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedScreenIndex,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(
            color: Colors.grey
        ),
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primaryColor,
        onTap: (int index) {
          _selectedScreenIndex = index;
          print(_selectedScreenIndex);
          if (mounted) {
            setState(() {});
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.widgets_sharp), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_outlined), label: 'Wish'),
        ],
      ),
    );
  }
}