import 'package:book_worm/core/utils/font_styels.dart';
import 'package:book_worm/features/home/presentation/views/widgets/book_of_week_card.dart';
import 'package:book_worm/features/home/presentation/views/widgets/home_view_appBar.dart';
import 'package:book_worm/features/home/presentation/views/widgets/pobular_list_item.dart';
import 'package:book_worm/features/home/presentation/views/widgets/recommanded_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeViewAppBar(),
        const BookOfTheWeekCard(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 35),
                      Text(
                        'Recommanded for you',
                        style: Styels.textStyle20,
                      ),
                      SizedBox(height: 20),
                      RecommandedList(),
                      SizedBox(height: 25),
                      Text(
                        'Popular books',
                        style: Styels.textStyle20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 100,
                  (context, index) => const Padding(
                    padding:
                        EdgeInsets.only(bottom: 5, top: 5, right: 20, left: 20),
                    child: PobularListItem(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
