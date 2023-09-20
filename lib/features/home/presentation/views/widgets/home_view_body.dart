import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/core/utils/helper.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_of_week_card.dart';
import 'package:book_worm/features/home/presentation/views/widgets/home_view_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeViewAppBar(),
        BookOfTheWeekCard(),
      ],
    );
  }
}
