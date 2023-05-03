import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:ecommerce_flutter_bloc/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBloc = context.read<BottomNavigationBloc>();
    return BlocBuilder<BottomNavigationBloc, int>(
      builder: (context, currentTabIndex) {
        return DotNavigationBar(
          currentIndex: currentTabIndex,
          onTap: (index) {
            bottomNavigationBloc.add(TabChangeEvent(index));
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
        );
      },
    );
  }
}
