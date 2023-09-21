import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_image.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_of_week_card.dart';
import 'package:book_worm/features/home/presentation/views/widgets/home_view_appBar.dart';
import 'package:book_worm/features/home/presentation/views/widgets/pobular_list_item.dart';
import 'package:book_worm/features/home/presentation/views/widgets/recommanded_list.dart';
import 'package:flutter/material.dart';

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
          const RecommandedList(),
          const SizedBox(height: 25),
          const Text(
            'Popular books',
            style: Styels.textStyle20,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const Padding(
                  padding:
                      EdgeInsets.only(bottom: 5, top: 5, right: 15, left: 10),
                  child: PobularListItem(),
                );
              },
              itemCount: 10,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
