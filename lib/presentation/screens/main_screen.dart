import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:ecommerce_flutter_bloc/presentation/screens/cart/cart.dart';
import 'package:ecommerce_flutter_bloc/presentation/screens/profile/profile.dart';
import 'package:ecommerce_flutter_bloc/presentation/screens/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'home/home_imports.dart';

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
    ProfileScreen(),
    SettingScreen(),
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
        dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(LineIcons.home),
            selectedColor: Colors.purple,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(LineIcons.heart),
            selectedColor: Colors.pink,
          ),

          /// Search
          DotNavigationBarItem(
            icon: const Icon(LineIcons.search),
            selectedColor: Colors.orange,
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
