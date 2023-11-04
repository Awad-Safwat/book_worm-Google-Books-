import 'dart:ui';

import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/utils/functions.dart';
import 'package:book_worm/features/auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import 'package:book_worm/features/auth/presentation/views/signin_view.dart';
import 'package:book_worm/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:book_worm/features/favorites/presentation/views/favorites_view.dart';
import 'package:book_worm/features/home/presentation/views/home_view.dart';
import 'package:book_worm/features/home/presentation/views/widgets/home_view_appBar.dart';
import 'package:book_worm/features/my_books/presentation/view/my_books_view.dart';
import 'package:book_worm/features/search/presentation/views/search_view.dart';
import 'package:book_worm/features/user_profile/presentation/view/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: (AppColors.gitBritness(context) == Brightness.light)
                ? const Svg(AssetsData.homeBackgroundImage)
                : const Svg(AssetsData.homeBackgroundImageDarkTheme),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              top: 100,
              child: Container(
                child: screensList.elementAt(selectedViewindex),
              ),
            ),
            Positioned.fill(
              bottom: MediaQuery.sizeOf(context).height - 120,
              child: MainAppBar(
                title: navBarsItems[selectedViewindex].text,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
                onTabChange: (index) async {
                  if (index == 2) {
                    BlocProvider.of<FavoritesCubit>(context).booklst.clear();
                    BlocProvider.of<FavoritesCubit>(context)
                        .getFavoritesBooks();

                    // BlocProvider.of<SignInCubit>(context).signInGoogle();
                  }
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
  const FavoritesView(),
  const MyBooksView(),
  const UserProfileView(),
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
    text: ("My Books"),
  ),
  const GButton(
    icon: Icons.person,
    text: 'My Profile',
  )
];
