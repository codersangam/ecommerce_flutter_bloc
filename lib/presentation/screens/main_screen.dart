import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:ecommerce_flutter_bloc/presentation/screens/cart/cart.dart';
import 'package:ecommerce_flutter_bloc/presentation/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'home/home_imports.dart';
import 'wishlist/wishlist.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    HomeScreen(),
    CartScreen(),
    WishListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        dotIndicatorColor: Colors.transparent,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(LineIcons.home),
            selectedColor: Colors.orange,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(LineIcons.shoppingCart),
            selectedColor: Colors.pink,
          ),

          /// Search
          DotNavigationBarItem(
            icon: const Icon(LineIcons.heart),
            selectedColor: Colors.purple,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: const Icon(LineIcons.user),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
