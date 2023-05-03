import 'package:ecommerce_flutter_bloc/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:ecommerce_flutter_bloc/presentation/screens/profile/profile.dart';
import 'package:ecommerce_flutter_bloc/presentation/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart/cart_imports.dart';
import 'home/home_imports.dart';
import 'wishlist/wishlist.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
        child: BlocBuilder<BottomNavigationBloc, int>(
          builder: (context, currentTabIndex) {
            return _pages.elementAt(currentTabIndex);
          },
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
