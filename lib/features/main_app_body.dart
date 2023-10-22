import 'package:book_worm/features/home/presentation/views/home_view.dart';
import 'package:book_worm/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainAppBody extends StatefulWidget {
  const MainAppBody({super.key});

  @override
  State<MainAppBody> createState() => _MainAppBodyState();
}

class _MainAppBodyState extends State<MainAppBody> {
  late PersistentTabController controller;

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screensList,
      items: navBarsItems,
      navBarStyle: NavBarStyle.style9,
      backgroundColor: Colors.transparent,
      confineInSafeArea: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(5.0),
        colorBehindNavBar: Colors.white.withOpacity(0.8),
      ),
      navBarHeight: 55,
    );
  }
}

List<Widget> screensList = [
  const HomeView(),
  const SearchView(),
];

List<PersistentBottomNavBarItem> navBarsItems = [
  PersistentBottomNavBarItem(
    icon: const Icon(Icons.home),
    title: ("Home"),
  ),
  PersistentBottomNavBarItem(
    icon: const Icon(Icons.search),
    title: ("Search"),
  ),
];
