import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: Svg(AssetsData.homeBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: const HomeViewBody(),
      ),
    );
  }
}
