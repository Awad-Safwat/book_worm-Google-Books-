import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/utils/app_colors.dart';
import 'package:book_worm/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
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
        child: const HomeViewBody(),
      ),
    );
  }
}
