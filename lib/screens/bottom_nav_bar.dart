import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'Cart/cart_screen.dart';
import 'Profile/user_profile.dart';
import 'category/categories_screen.dart';
import 'home/main_home_screen/homescreen.dart'; // Make sure to import the Homescreen widget

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0; // Default selected index (Home)

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Homescreen(),
      CategoryScreen(
        onBackPress: () {
          setState(() {
            _selectedIndex = 0; // Navigate back to Home
          });
        },
      ),
      CartScreen(),
      UserProfile(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      // Use local 'pages' list
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeInOut,
        backgroundColor: Colors.white,
        color: AppColors.bottomNavColor,
        buttonBackgroundColor: AppColors.bottomNavColor,
        height: 52,
        index: _selectedIndex,
        items: const [
          Icon(Icons.home, size: 20, color: Colors.indigo),
          Icon(Icons.manage_search_sharp, size: 20, color: Colors.indigo),
          Icon(Icons.shopping_cart, size: 20, color: Colors.indigo),
          Icon(Icons.person, size: 20, color: Colors.indigo),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
