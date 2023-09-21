import 'package:book_worm/core/utils/assets/assets.dart';
import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/core/utils/helper.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_of_week_card.dart';
import 'package:book_worm/features/home/presentation/views/widgets/home_view_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeViewAppBar(),
          const BookOfTheWeekCard(),
          const SizedBox(height: 35),
          const Text(
            'Recommanded for you',
            style: Styels.textStyle20,
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.transparent,
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (contxt, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: BookImage(),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
