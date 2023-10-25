import 'dart:ui';

import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/features/auth/presentation/views/signin_view.dart';
import 'package:book_worm/features/home/presentation/views/home_view.dart';
import 'package:book_worm/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainAppBody extends StatefulWidget {
  const MainAppBody({super.key});

  @override
  State<MainAppBody> createState() => _MainAppBodyState();
}

class _MainAppBodyState extends State<MainAppBody> {
  int selectedViewindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: screensList.elementAt(selectedViewindex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: GNav(
                activeColor: AppColors.primaryColor,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                gap: 5,
                tabs: navBarsItems,
                iconSize: 42,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                duration: const Duration(milliseconds: 400),
                selectedIndex: selectedViewindex,
                onTabChange: (index) {
                  setState(() {
                    selectedViewindex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> screensList = [
  const HomeView(),
  const SearchView(),
  SignInView(),
];

List<GButton> navBarsItems = [
  const GButton(
    icon: Icons.home,
    text: ("Home"),
  ),
  const GButton(
    icon: Icons.search,
    text: ("Search"),
  ),
  const GButton(
    icon: Icons.favorite,
    text: ("favorite"),
  ),
  const GButton(
    icon: Icons.library_books,
    text: ("Library"),
  ),
];
